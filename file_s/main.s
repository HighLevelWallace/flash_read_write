	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	flash_write_enable
	.type	flash_write_enable, @function
flash_write_enable:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a1,0
	li	a0,0
	call	spi_setup_dummy
	li	a3,0
	li	a2,0
	li	a1,8
	li	a0,6
	call	spi_setup_cmd_addr
	li	a0,0
	call	spi_set_datalen
	li	a1,0
	li	a0,1
	call	spi_start_transaction
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	flash_write_enable, .-flash_write_enable
	.align	2
	.globl	flash_write_disable
	.type	flash_write_disable, @function
flash_write_disable:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a1,0
	li	a0,0
	call	spi_setup_dummy
	li	a3,0
	li	a2,0
	li	a1,8
	li	a0,4
	call	spi_setup_cmd_addr
	li	a0,0
	call	spi_set_datalen
	li	a1,0
	li	a0,1
	call	spi_start_transaction
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	flash_write_disable, .-flash_write_disable
	.align	2
	.globl	flash_in_progress
	.type	flash_in_progress, @function
flash_in_progress:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
	li	a1,0
	li	a0,0
	call	spi_setup_dummy
	li	a3,0
	li	a2,0
	li	a1,8
	li	a0,5
	call	spi_setup_cmd_addr
	li	a0,8
	call	spi_set_datalen
	li	a1,0
	li	a0,0
	call	spi_start_transaction
	addi	a5,s0,-20
	li	a1,8
	mv	a0,a5
	call	spi_read_fifo
	lw	a5,-20(s0)
	andi	a5,a5,1
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	flash_in_progress, .-flash_in_progress
	.align	2
	.globl	flash_block_erase_64k
	.type	flash_block_erase_64k, @function
flash_block_erase_64k:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	li	a1,0
	li	a0,0
	call	spi_setup_dummy
	li	a3,24
	lw	a2,-20(s0)
	li	a1,8
	li	a0,216
	call	spi_setup_cmd_addr
	li	a0,0
	call	spi_set_datalen
	li	a1,0
	li	a0,1
	call	spi_start_transaction
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	flash_block_erase_64k, .-flash_block_erase_64k
	.align	2
	.globl	flash_chip_erase
	.type	flash_chip_erase, @function
flash_chip_erase:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	li	a1,0
	li	a0,0
	call	spi_setup_dummy
	li	a3,0
	li	a2,0
	li	a1,8
	li	a0,199
	call	spi_setup_cmd_addr
	li	a0,0
	call	spi_set_datalen
	li	a1,0
	li	a0,1
	call	spi_start_transaction
	nop
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	flash_chip_erase, .-flash_chip_erase
	.align	2
	.globl	flash_write_word
	.type	flash_write_word, @function
flash_write_word:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	call	flash_write_enable
	li	a1,0
	li	a0,0
	call	spi_setup_dummy
	li	a3,24
	lw	a2,-20(s0)
	li	a1,8
	li	a0,2
	call	spi_setup_cmd_addr
	li	a0,32
	call	spi_set_datalen
	addi	a5,s0,-24
	li	a1,32
	mv	a0,a5
	call	spi_write_fifo
	li	a1,0
	li	a0,1
	call	spi_start_transaction
	nop
.L8:
	call	flash_in_progress
	mv	a5,a0
	bne	a5,zero,.L8
	call	flash_write_disable
	nop
.L9:
	call	flash_in_progress
	mv	a5,a0
	bne	a5,zero,.L9
	nop
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	flash_write_word, .-flash_write_word
	.align	2
	.globl	flash_read_word
	.type	flash_read_word, @function
flash_read_word:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	li	a1,0
	li	a0,4
	call	spi_start_transaction
	li	a1,0
	li	a0,0
	call	spi_setup_dummy
	li	a3,24
	lw	a2,-20(s0)
	li	a1,8
	li	a0,3
	call	spi_setup_cmd_addr
	li	a0,32
	call	spi_set_datalen
	li	a1,0
	li	a0,0
	call	spi_start_transaction
	li	a1,32
	lw	a0,-24(s0)
	call	spi_read_fifo
	nop
.L11:
	call	flash_in_progress
	mv	a5,a0
	bne	a5,zero,.L11
	nop
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	flash_read_word, .-flash_read_word
	.globl	numchar
	.section	.rodata
	.align	2
	.type	numchar, @object
	.size	numchar, 16
numchar:
	.ascii	"0123456789ABCDEF"
	.globl	myvar
	.section	.sdata,"aw"
	.align	2
	.type	myvar, @object
	.size	myvar, 4
myvar:
	.word	53
	.section	.rodata
	.align	2
.LC0:
	.string	"hello world!\n"
	.align	2
.LC1:
	.string	"myver = %d\n"
	.align	2
.LC2:
	.string	"myvar = %d\n"
	.align	2
.LC3:
	.string	"Release Power down / Device ID\n"
	.align	2
.LC4:
	.string	"\n"
	.align	2
.LC5:
	.string	"JEDEC ID\n"
	.align	2
.LC6:
	.string	"  \n"
	.align	2
.LC7:
	.string	"Manufacturer/Device ID\n"
	.align	2
.LC8:
	.string	"Erasing block 0..."
	.align	2
.LC9:
	.string	"Done erasing block."
	.align	2
.LC10:
	.string	"Writing 0x12345678 to address 0..."
	.align	2
.LC11:
	.string	"Writing done."
	.align	2
.LC12:
	.string	"Read: %08x"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-80
	sw	ra,76(sp)
	sw	s0,72(sp)
	addi	s0,sp,80
	sw	zero,-68(s0)
	sw	zero,-64(s0)
	sb	zero,-60(s0)
	sw	zero,-72(s0)
	li	a0,1
	call	spi_setup_master
	li	a1,12
	li	a0,0
	call	uart_set_cfg
	sw	zero,-20(s0)
	j	.L13
.L14:
	li	a1,1
	lw	a0,-20(s0)
	call	set_gpio_pin_direction
	lw	a5,-20(s0)
	andi	a5,a5,1
	mv	a1,a5
	lw	a0,-20(s0)
	call	set_gpio_pin_value
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L13:
	lw	a4,-20(s0)
	li	a5,7
	ble	a4,a5,.L14
	nop
.L15:
	call	uart_getchar
	mv	a5,a0
	mv	a4,a5
	li	a5,115
	bne	a4,a5,.L15
	li	a1,13
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	uart_send
	li	a5,437264384
	addi	a5,a5,4
	li	a4,4
	sw	a4,0(a5)
	lui	a5,%hi(myvar)
	lw	a5,%lo(myvar)(a5)
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	lui	a5,%hi(myvar)
	li	a4,324
	sw	a4,%lo(myvar)(a5)
	lui	a5,%hi(myvar)
	lw	a5,%lo(myvar)(a5)
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	printf
	li	a1,31
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	uart_send
	sw	zero,-24(s0)
	j	.L16
.L17:
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L16:
	lw	a4,-24(s0)
	li	a5,4096
	addi	a5,a5,-1097
	ble	a4,a5,.L17
	li	a1,0
	li	a0,24
	call	spi_setup_dummy
	li	a3,0
	li	a2,0
	li	a1,8
	li	a0,171
	call	spi_setup_cmd_addr
	li	a0,8
	call	spi_set_datalen
	li	a1,0
	li	a0,0
	call	spi_start_transaction
	addi	a5,s0,-56
	li	a1,8
	mv	a0,a5
	call	spi_read_fifo
	lw	a5,-56(s0)
	mv	a4,a5
	addi	a5,s0,-68
	mv	a1,a4
	mv	a0,a5
	call	hex_to_string
	addi	a5,s0,-68
	li	a1,8
	mv	a0,a5
	call	uart_send
	li	a1,1
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	uart_send
	call	uart_wait_tx_done
	sw	zero,-56(s0)
	li	a1,9
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	uart_send
	call	uart_wait_tx_done
	li	a1,0
	li	a0,0
	call	spi_setup_dummy
	li	a3,0
	li	a2,0
	li	a1,8
	li	a0,159
	call	spi_setup_cmd_addr
	li	a0,24
	call	spi_set_datalen
	li	a1,0
	li	a0,0
	call	spi_start_transaction
	addi	a5,s0,-56
	li	a1,24
	mv	a0,a5
	call	spi_read_fifo
	lw	a5,-56(s0)
	mv	a4,a5
	addi	a5,s0,-68
	mv	a1,a4
	mv	a0,a5
	call	hex_to_string
	addi	a5,s0,-68
	li	a1,10
	mv	a0,a5
	call	uart_send
	li	a1,3
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	uart_send
	li	a1,23
	lui	a5,%hi(.LC7)
	addi	a0,a5,%lo(.LC7)
	call	uart_send
	call	uart_wait_tx_done
	sw	zero,-56(s0)
	li	a1,0
	li	a0,16
	call	spi_setup_dummy
	li	a3,8
	li	a2,0
	li	a1,8
	li	a0,144
	call	spi_setup_cmd_addr
	li	a0,16
	call	spi_set_datalen
	li	a1,0
	li	a0,0
	call	spi_start_transaction
	addi	a5,s0,-56
	li	a1,16
	mv	a0,a5
	call	spi_read_fifo
	lw	a5,-56(s0)
	mv	a4,a5
	addi	a5,s0,-68
	mv	a1,a4
	mv	a0,a5
	call	hex_to_string
	addi	a5,s0,-68
	li	a1,8
	mv	a0,a5
	call	uart_send
	li	a1,3
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	uart_send
	call	flash_write_enable
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	puts
	li	a0,0
	call	flash_block_erase_64k
	nop
.L18:
	call	flash_in_progress
	mv	a5,a0
	bne	a5,zero,.L18
	lui	a5,%hi(.LC9)
	addi	a0,a5,%lo(.LC9)
	call	puts
	lui	a5,%hi(.LC10)
	addi	a0,a5,%lo(.LC10)
	call	puts
	li	a5,305418240
	addi	a1,a5,1656
	li	a0,0
	call	flash_write_word
	lui	a5,%hi(.LC11)
	addi	a0,a5,%lo(.LC11)
	call	puts
	addi	a5,s0,-72
	mv	a1,a5
	li	a0,0
	call	flash_read_word
	lw	a5,-72(s0)
	mv	a1,a5
	lui	a5,%hi(.LC12)
	addi	a0,a5,%lo(.LC12)
	call	printf
	li	a5,0
	mv	a0,a5
	lw	ra,76(sp)
	lw	s0,72(sp)
	addi	sp,sp,80
	jr	ra
	.size	main, .-main
	.align	2
	.globl	hex_to_string
	.type	hex_to_string, @function
hex_to_string:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	j	.L21
.L22:
	li	a4,7
	lw	a5,-20(s0)
	sub	a5,a4,a5
	slli	a5,a5,2
	lw	a4,-40(s0)
	srl	a5,a4,a5
	andi	a4,a5,15
	lw	a5,-20(s0)
	lw	a3,-36(s0)
	add	a5,a3,a5
	lui	a3,%hi(numchar)
	addi	a3,a3,%lo(numchar)
	add	a4,a3,a4
	lbu	a4,0(a4)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L21:
	lw	a4,-20(s0)
	li	a5,7
	ble	a4,a5,.L22
	lw	a5,-36(s0)
	addi	a5,a5,8
	sb	zero,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	hex_to_string, .-hex_to_string
	.ident	"GCC: (GNU) 10.2.0"
