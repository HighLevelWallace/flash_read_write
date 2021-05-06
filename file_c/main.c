#include "stdlib.h"
#include "gpio.h"
#include "uart.h"
#include "string_lib.h"
#include "pulpino.h"
#include "utils.h"
#include "spi.h"
#include "flash.h"

void hex_to_string(char *, unsigned int);
int str_to_int(const char *);
int is_hex(char c) { return c <= 'H' && c >= 'A' ||
							c <= 'h' && c >= 'a' || c <= '9' && c >= '0'; }

const char g_numbers[] = {
	'0', '1', '2', '3', '4', '5', '6', '7',
	'8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

int check_spi_flash();

void uart_send_block_done(unsigned int i);
void jump_and_start(volatile int *ptr);

unsigned char one_count(unsigned int x)
{
	unsigned char c = 0;
	int i = 0;
	while (x)
	{
		c += x & 0x1;
		x >>= 1;
	}
	return c;
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

	//while (uart_getchar() != 's');
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

	/*id[0] = 0;
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
	uart_send("  \n", 3);*/

	flash_write_enable();
	printf("Erasing the whole chip...\n");
	flash_chip_erase();
	while (flash_in_progress())
		;
	printf("Done erasing chip.\n");

	/*printf("Writing 0x12345678 to address 0...\n");
	flash_write_word(0x0, 0x12345678);
	printf("Writing done.\n");
	flash_read_word(0x4, &rdata);
	printf("Read: %08x", rdata);
        flash_write_word(0x4, 0xabcdef);
	printf("Writing done.\n");*/

	char flashstr[9];
	unsigned int flashaddr = 0;
	unsigned int flashdata;
	unsigned int datanum = 0;
	printf("waiting for uart signals to write to flash...\n");
	uart_wait_tx_done();
	while (1)
	{
		int i = 0;
		while (1)
		{
			if (!is_hex(flashstr[i++] = uart_getchar()))
				break;
			if (i >= 20)
				break;
		}
		flashstr[8] = '\0';
		if (flashstr[i - 1] == 'q')
			break;
		flashdata = str_to_int(flashstr);
		datanum = datanum + 0x1;
		printf("flash data is %08x \n", flashdata);
		uart_wait_tx_done();
		flash_write_word(flashaddr, flashdata);
		uart_wait_tx_done();
		flashaddr = flashaddr + 0x4;
		uart_sendchar(one_count(flashdata));
	}

	uart_send("Done write data to flash!\n", 26);

	uart_wait_tx_done();

	uart_send("Loading from flash...\n", 22);

	unsigned int *memaddr = 0;
	unsigned int readflashaddr = 0;
	for (int num = 0; num <= datanum; num++)
	{
		flash_read_word(readflashaddr, &rdata);
		*(memaddr++) = rdata;
		readflashaddr = readflashaddr + 0x4;
	}

	uart_send("Done, jumping to Instruction RAM.\n", 34);
	uart_wait_tx_done();

	BOOTREG = 0x00;

	jump_and_start((volatile int *)(INSTR_RAM_START_ADDR));
	while (1)
		printf("This isn't supposed to be shown. \n");

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

int str_to_int(const char *str)
{
	int hex = 0;
	for (int i = 0; i < 8; ++i)
	{
		if (str[i] <= '9' && str[i] >= '0')
			hex |= (int)(str[i] - '0') << 4 * (7 - i);
		else if (str[i] <= 'F' && str[i] >= 'A')
			hex |= (int)(str[i] - 'A' + 0xA) << 4 * (7 - i);
		else if (str[i] <= 'f' && str[i] >= 'a')
			hex |= (int)(str[i] - 'a' + 0xA) << 4 * (7 - i);
	}
	return hex;
}

int check_spi_flash()
{
	int err = 0;
	int rd_id[2];

	// reads flash ID
	spi_setup_cmd_addr(0x90, 8, 0, 0);
	spi_set_datalen(64);
	spi_setup_dummy(0, 0);
	spi_start_transaction(SPI_CMD_RD, SPI_CSN0);
	spi_read_fifo(rd_id, 64);

	// id should be 0x0102194D  //EF
	//if (((rd_id[0] >> 24) & 0xFF) != 0x01)
	if ((rd_id[0] & 0xFF) != 0xEF)
		err++;

	// check flash model is 128MB or 256MB 1.8V
	/*if ( (((rd_id[0] >> 8) & 0xFFFF) != 0x0219) &&
       (((rd_id[0] >> 8) & 0xFFFF) != 0x2018) )
    err++;*/

	return err;
}

void jump_and_start(volatile int *ptr)
{
#ifdef __riscv__
	asm("jalr x0, %0\n"
		"nop\n"
		"nop\n"
		"nop\n"
		:
		: "r"(ptr));
#else
	asm("l.jr\t%0\n"
		"l.nop\n"
		"l.nop\n"
		"l.nop\n"
		:
		: "r"(ptr));
#endif
}

void uart_send_block_done(unsigned int i)
{
	unsigned int low = i & 0xF;
	unsigned int high = i >> 4; // /16

	uart_send("Block ", 6);

	uart_send(&g_numbers[high], 1);
	uart_send(&g_numbers[low], 1);

	uart_send(" done\n", 6);

	uart_wait_tx_done();
}
