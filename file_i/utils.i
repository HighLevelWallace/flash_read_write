# 1 "./file_c/utils.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./file_c/utils.c"
# 11 "./file_c/utils.c"
# 1 "./file_c/spr-defs.h" 1
# 12 "./file_c/utils.c" 2
# 1 "./file_c/utils.h" 1
# 25 "./file_c/utils.h"
# 1 "./file_c/event.h" 1
# 29 "./file_c/event.h"
# 1 "./file_c/pulpino.h" 1
# 30 "./file_c/event.h" 2
# 26 "./file_c/utils.h" 2


static inline int get_core_id()
{
  return 0;
}


static inline int get_core_num()
{
  return 0;
}
# 68 "./file_c/utils.h"
static inline void sleep(void) {
  *(volatile int*) (( ( 0x10000000 + 0xA100000 ) + 0x4000 ) + 0x20) = 0x01;
  asm volatile ("nop;nop;wfi");
}
# 95 "./file_c/utils.h"
void exit(int i);


void eoc(int i);


void sleep_busy(volatile int);
# 13 "./file_c/utils.c" 2

# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stdint.h" 1 3 4
# 9 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stdint.h" 3 4
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 1 3 4
# 12 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 3 4
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 1 3 4







# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/features.h" 1 3 4
# 28 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/features.h" 3 4
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/_newlib_version.h" 1 3 4
# 29 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/features.h" 2 3 4
# 9 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 2 3 4
# 41 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4

# 41 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 2 3 4
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/_intsup.h" 1 3 4
# 35 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 190 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
       
# 14 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 2 3 4
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/_stdint.h" 1 3 4
# 20 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/home/barneyzhu/riscv/riscv-gnu-toolchain/riscv32-unknown-elf/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stdint.h" 2 3 4
# 15 "./file_c/utils.c" 2
# 1 "./file_c/string_lib.h" 1
# 14 "./file_c/string_lib.h"
# 1 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 1 3 4
# 143 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 209 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 3 4
typedef int wchar_t;
# 415 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
# 426 "/home/barneyzhu/riscv/riscv-gnu-toolchain/lib/gcc/riscv32-unknown-elf/10.2.0/include/stddef.h" 3 4
} max_align_t;
# 15 "./file_c/string_lib.h" 2
# 23 "./file_c/string_lib.h"

# 23 "./file_c/string_lib.h"
size_t strlen (const char *str);
int strcmp (const char *s1, const char *s2);
char* strcpy (char *s1, const char *s2);
int puts(const char *s);
int printf(const char *format, ...);
void * memset (void *dest, int val, size_t len);
int putchar(int s);
# 16 "./file_c/utils.c" 2
# 1 "./file_c/uart.h" 1
# 66 "./file_c/uart.h"
void uart_set_cfg(int parity, uint16_t clk_counter);

void uart_send(const char* str, unsigned int len);
void uart_sendchar(const char c);

char uart_getchar();

void uart_mysendstring(const char *);
void uart_wait_tx_done(void);

void uart_getstring(char *);
# 17 "./file_c/utils.c" 2



void exit (int i) {
  eoc(i);
  while (1);
}


void eoc(int i) {
  if (i != 0)
    *(unsigned volatile int*) (( ( 0x10000000 + 0xA100000 ) + 0x7000 ) + 0x14) = 1;
  else
    *(unsigned volatile int*) (( ( 0x10000000 + 0xA100000 ) + 0x7000 ) + 0x14) = 0;


  *(unsigned volatile int*) (( ( 0x10000000 + 0xA100000 ) + 0x7000 ) + 0x04) |= (1 << 0x02);




}


void sleep_busy(volatile int iter)
{
  for (int i=0;i<iter;i++)
    asm volatile ("nop");
}



void cpu_perf_set(unsigned int counterId, unsigned int value) {
  printf("cpu_perf_set: not implemented yet\n");
}

unsigned int cpu_perf_get(unsigned int counterId) {
  uint32_t value = 0;

  switch (counterId) {
  case 0: asm volatile ("csrr %0, 0x780" : "=r" (value)); break;
  case 1: asm volatile ("csrr %0, 0x781" : "=r" (value)); break;
  case 2: asm volatile ("csrr %0, 0x782" : "=r" (value)); break;
  case 3: asm volatile ("csrr %0, 0x783" : "=r" (value)); break;
  case 4: asm volatile ("csrr %0, 0x784" : "=r" (value)); break;
  case 5: asm volatile ("csrr %0, 0x785" : "=r" (value)); break;
  case 6: asm volatile ("csrr %0, 0x786" : "=r" (value)); break;
  case 7: asm volatile ("csrr %0, 0x787" : "=r" (value)); break;
  case 8: asm volatile ("csrr %0, 0x788" : "=r" (value)); break;
  case 9: asm volatile ("csrr %0, 0x789" : "=r" (value)); break;
  case 10: asm volatile ("csrr %0, 0x78A" : "=r" (value)); break;
  case 11: asm volatile ("csrr %0, 0x78B" : "=r" (value)); break;
  case 12: asm volatile ("csrr %0, 0x78C" : "=r" (value)); break;
  case 13: asm volatile ("csrr %0, 0x78D" : "=r" (value)); break;
  case 14: asm volatile ("csrr %0, 0x78E" : "=r" (value)); break;
  case 15: asm volatile ("csrr %0, 0x78F" : "=r" (value)); break;
  default: printf("CSR %d not yet supported\n", counterId); break;
  }
  return value;
}
