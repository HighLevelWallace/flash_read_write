#include "stdlib.h"
#include "gpio.h"
#include "uart.h"
#include "string_lib.h"
#include "pulpino.h"
#include "utils.h"
#include "spi.h"

void hex_to_string(char *, unsigned int);

void flash_write_enable()
{
	spi_setup_dummy(0, 0);
	spi_setup_cmd_addr(0x06, 8, 0, 0);
	spi_set_datalen(0);
	spi_start_transaction(SPI_CMD_WR, SPI_CSN0);
}

void flash_write_disable()
{
	spi_setup_dummy(0, 0);
	spi_setup_cmd_addr(0x04, 8, 0, 0);
	spi_set_datalen(0);
	spi_start_transaction(SPI_CMD_WR, SPI_CSN0);
}

int flash_in_progress()
{
	int sr1 = 0;
	spi_setup_dummy(0, 0);
	spi_setup_cmd_addr(0x05, 8, 0, 0);
	spi_set_datalen(8);
	spi_start_transaction(SPI_CMD_RD, SPI_CSN0);
	spi_read_fifo(&sr1, 8);
	return sr1 & 0x1;
}

void flash_block_erase_64k(int addr)
{
	spi_setup_dummy(0, 0);
	spi_setup_cmd_addr(0xD8, 8, addr, 24);
	spi_set_datalen(0);
	spi_start_transaction(SPI_CMD_WR, SPI_CSN0);
}

void flash_chip_erase()
{
	spi_setup_dummy(0, 0);
	spi_setup_cmd_addr(0xC7, 8, 0, 0);
	spi_set_datalen(0);
	spi_start_transaction(SPI_CMD_WR, SPI_CSN0);
}

void flash_write_word(int addr, int data)
{
	flash_write_enable();
	spi_setup_dummy(0, 0);
	spi_setup_cmd_addr(0x02, 8, addr, 24);
	spi_set_datalen(32);
	spi_write_fifo(&data, 32);
	spi_start_transaction(SPI_CMD_WR, SPI_CSN0);
	while (flash_in_progress())
		;
	flash_write_disable();
	while (flash_in_progress())
		;
}

void flash_read_word(int addr, int *data)
{
	spi_start_transaction(SPI_CMD_SWRST, SPI_CSN0);
	spi_setup_dummy(0, 0);
	spi_setup_cmd_addr(0x03, 8, addr, 24);
	spi_set_datalen(32);
	spi_start_transaction(SPI_CMD_RD, SPI_CSN0);
	spi_read_fifo(data, 32);
	while (flash_in_progress())
		;
}

const char numchar[16] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
						  'A', 'B', 'C', 'D', 'E', 'F'};

int main()
{
	int id[8];
	char numstring[9] = {0};
	int rdata = 0;
	spi_setup_master(1);

	uart_set_cfg(0, 12); //Core clock 24MHz, baud rate 115200 bps

	for (int i = 0; i < 8; i++)
	{
		set_gpio_pin_direction(i, 1);
		set_gpio_pin_value(i, i & 1);
	}

	while (uart_getchar() != 's')
		;
	uart_send("hello world!\n", 13);
	/* divide sys clock by 4 */
	*(volatile int *)(SPI_REG_CLKDIV) = 0x4;

	// if (check_spi_flash()) {
	// 	uart_send("ERROR: Spansion SPI flash not found\n", 36);
	// 	while (1);
	// }

	uart_send("Release Power down / Device ID\n", 31);

	for (int i = 0; i < 3000; i++)
	{
		// //wait some time to have proper power up of external flash
		// #ifdef __riscv__
		//     asm volatile ("nop");
		// #else
		//     asm volatile ("l.nop");
		// #endif
	}

	spi_setup_dummy(24, 0);
	spi_setup_cmd_addr(0xAB, 8, 0, 0);
	spi_set_datalen(8);
	spi_start_transaction(SPI_CMD_RD, SPI_CSN0);
	spi_read_fifo(id, 8);

	hex_to_string(numstring, id[0]);
	uart_send(numstring, 8);
	uart_send("\n", 1);
	uart_wait_tx_done();

	id[0] = 0;
	uart_send("JEDEC ID\n", 9);
	uart_wait_tx_done();

	spi_setup_dummy(0, 0);
	spi_setup_cmd_addr(0x9F, 8, 0, 0);
	spi_set_datalen(24);
	spi_start_transaction(SPI_CMD_RD, SPI_CSN0);
	spi_read_fifo(id, 24);

	hex_to_string(numstring, id[0]);
	uart_send(numstring, 10);
	uart_send("  \n", 3);

	uart_send("Manufacturer/Device ID\n", 23);
	uart_wait_tx_done();
	id[0] = 0;
	spi_setup_dummy(16, 0);
	spi_setup_cmd_addr(0x90, 8, 0, 8);
	spi_set_datalen(16);
	spi_start_transaction(SPI_CMD_RD, SPI_CSN0);
	spi_read_fifo(id, 16);

	hex_to_string(numstring, id[0]);
	uart_send(numstring, 8);
	uart_send("  \n", 3);

	flash_write_enable();
	printf("Erasing block 0...\n");
	flash_block_erase_64k(0);
	while (flash_in_progress())
		;
	printf("Done erasing block.\n");

	printf("Writing 0x12345678 to address 0...\n");
	flash_write_word(0, 0x12345678);
	printf("Writing done.\n");
	flash_read_word(0x0, &rdata);
	printf("Read: %08x", rdata);
	// for(int i = 0; ; i++)
	// {
	// 	set_gpio_pin_value(i % 8, 0);
	// 	set_gpio_pin_value((i - 1) % 8, 1);
	// 	// uart_send("hello world!\n", 12);

	// 	uart_sendchar(uart_getchar());
	// 	// uart_mysendstring("hello world!\n");
	// 	// for(int j = 0; j < 100000; j++){;}
	// }
	return 0;
}

// char * hex_to_string(unsigned int hex)
// {
// 	static char str[11];
// 	str[0] = ' ';
// 	str[1] = ' ';
// 	for(int i = 0; i < 8; ++i)
// 		str[i + 2] = numchar[(hex >> (4 * i)) & 0x0F];
// 	str[10] = '\0';
// 	return str;
// }

void hex_to_string(char *str, unsigned int hex)
{
	for (int i = 0; i < 8; ++i)
		str[i] = numchar[(hex >> (4 * (7 - i))) % 16];
	str[8] = '\0';
	return;
}