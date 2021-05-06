#include "flash.h"
#include "spi.h"
#include "uart.h"
#include "string_lib.h"

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
    spi_setup_cmd_addr(0x60, 8, 0, 0);
    spi_set_datalen(0);
    spi_start_transaction(SPI_CMD_WR, SPI_CSN0);
}

void flash_write_word(int addr, int data)
{
    int status1, status2, status3;

    flash_write_enable();
    spi_setup_dummy(0, 0);
    status1 = spi_get_status();
    printf("write status1 is %08x\n", status1);
    spi_setup_cmd_addr(0x02, 8, ((addr << 8) & 0xFFFFFF00), 24);
    //spi_setup_cmd_addr(0x02, 8, addr, 24);
    spi_set_datalen(32);
    spi_write_fifo(&data, 32);
    status2 = spi_get_status();
    printf("write status2 is %08x\n", status2);
    spi_start_transaction(SPI_CMD_WR, SPI_CSN0);
    status3 = spi_get_status();
    printf("write status3 is %08x\n", status3);
    while (flash_in_progress())
        ;
    flash_write_disable();
    while (flash_in_progress())
        ;
    printf("Writing done.\n");
}

void flash_read_word(int addr, int *data)
{
    int status1, status2;

    spi_start_transaction(SPI_CMD_SWRST, SPI_CSN0);
    spi_setup_dummy(0, 0);
    spi_setup_cmd_addr(0x03, 8, ((addr << 8) & 0xFFFFFF00), 24);
    //spi_setup_cmd_addr(0x03, 8, addr, 24);
    spi_set_datalen(32);
    spi_start_transaction(SPI_CMD_RD, SPI_CSN0);
    status1 = spi_get_status();
    printf("read status1 is %08x\n", status1);
    spi_read_fifo(data, 32);
    status2 = spi_get_status();
    printf("read status2 is %08x\n", status2);
    while (flash_in_progress())
        ;
}