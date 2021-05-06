#ifndef FLASH_H_
#define FLASH_H_

void flash_write_enable();
void flash_write_disable();
int flash_in_progress();
void flash_block_erase_64k(int);
void flash_chip_erase();
void flash_write_word(int, int);
void flash_read_word(int, int *);

#endif