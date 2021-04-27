
hello：     文件格式 elf32-littleriscv


Disassembly of section .vectors:

00000000 <_stack_start-0x104000>:
   0:	08c0006f          	j	8c <_stext>
   4:	00000013          	nop
   8:	00000013          	nop
   c:	00000013          	nop
  10:	00000013          	nop
  14:	00000013          	nop
  18:	00000013          	nop
  1c:	00000013          	nop
  20:	00000013          	nop
  24:	00000013          	nop
  28:	00000013          	nop
  2c:	00000013          	nop
  30:	00000013          	nop
  34:	00000013          	nop
  38:	00000013          	nop
  3c:	00000013          	nop
  40:	00000013          	nop
  44:	00000013          	nop
  48:	00000013          	nop
  4c:	00000013          	nop
  50:	00000013          	nop
  54:	00000013          	nop
  58:	0c00006f          	j	118 <ISR_SRAM_ASM>
  5c:	0d40006f          	j	130 <ISR_I2C_ASM>
  60:	0e80006f          	j	148 <ISR_UART_ASM>
  64:	0fc0006f          	j	160 <ISR_GPIO_ASM>
  68:	1100006f          	j	178 <ISR_SPIM0_ASM>
  6c:	1240006f          	j	190 <ISR_SPIM1_ASM>
  70:	1500006f          	j	1c0 <ISR_TA_OVF_ASM>
  74:	1340006f          	j	1a8 <ISR_TA_CMP_ASM>
  78:	1780006f          	j	1f0 <ISR_TB_OVF_ASM>
  7c:	15c0006f          	j	1d8 <ISR_TB_CMP_ASM>
  80:	00c0006f          	j	8c <_stext>
  84:	1840006f          	j	208 <illegal_insn_handler>
  88:	1980006f          	j	220 <ecall_insn_handler>

Disassembly of section .text:

0000008c <_stext>:
      8c:	30501073          	csrw	mtvec,zero
      90:	00000093          	li	ra,0
      94:	00008113          	mv	sp,ra
      98:	00008193          	mv	gp,ra
      9c:	00008213          	mv	tp,ra
      a0:	00008293          	mv	t0,ra
      a4:	00008313          	mv	t1,ra
      a8:	00008393          	mv	t2,ra
      ac:	00008413          	mv	s0,ra
      b0:	00008493          	mv	s1,ra
      b4:	00008513          	mv	a0,ra
      b8:	00008593          	mv	a1,ra
      bc:	00008613          	mv	a2,ra
      c0:	00008693          	mv	a3,ra
      c4:	00008713          	mv	a4,ra
      c8:	00008793          	mv	a5,ra
      cc:	00104117          	auipc	sp,0x104
      d0:	f3410113          	addi	sp,sp,-204 # 104000 <_stack>

000000d4 <_start>:
      d4:	00100717          	auipc	a4,0x100
      d8:	0b470713          	addi	a4,a4,180 # 100188 <_bss_end>
      dc:	00100797          	auipc	a5,0x100
      e0:	0ac78793          	addi	a5,a5,172 # 100188 <_bss_end>
      e4:	00f75863          	bge	a4,a5,f4 <main_entry>

000000e8 <zero_loop>:
      e8:	00072023          	sw	zero,0(a4)
      ec:	00470713          	addi	a4,a4,4
      f0:	fee7dce3          	bge	a5,a4,e8 <zero_loop>

000000f4 <main_entry>:
      f4:	00000513          	li	a0,0
      f8:	00100593          	li	a1,1
      fc:	575010ef          	jal	ra,1e70 <uart_set_cfg>
     100:	00000513          	li	a0,0
     104:	00000593          	li	a1,0
     108:	149000ef          	jal	ra,a50 <main>
     10c:	00050413          	mv	s0,a0
     110:	74d010ef          	jal	ra,205c <uart_wait_tx_done>
     114:	00040513          	mv	a0,s0

00000118 <ISR_SRAM_ASM>:
     118:	fa010113          	addi	sp,sp,-96
     11c:	04112e23          	sw	ra,92(sp)
     120:	118000ef          	jal	ra,238 <store_regs>
     124:	00000097          	auipc	ra,0x0
     128:	14408093          	addi	ra,ra,324 # 268 <end_except>
     12c:	5840006f          	j	6b0 <ISR_SRAM>

00000130 <ISR_I2C_ASM>:
     130:	fa010113          	addi	sp,sp,-96
     134:	04112e23          	sw	ra,92(sp)
     138:	100000ef          	jal	ra,238 <store_regs>
     13c:	00000097          	auipc	ra,0x0
     140:	12c08093          	addi	ra,ra,300 # 268 <end_except>
     144:	57c0006f          	j	6c0 <ISR_I2C>

00000148 <ISR_UART_ASM>:
     148:	fa010113          	addi	sp,sp,-96
     14c:	04112e23          	sw	ra,92(sp)
     150:	0e8000ef          	jal	ra,238 <store_regs>
     154:	00000097          	auipc	ra,0x0
     158:	11408093          	addi	ra,ra,276 # 268 <end_except>
     15c:	5740006f          	j	6d0 <ISR_UART>

00000160 <ISR_GPIO_ASM>:
     160:	fa010113          	addi	sp,sp,-96
     164:	04112e23          	sw	ra,92(sp)
     168:	0d0000ef          	jal	ra,238 <store_regs>
     16c:	00000097          	auipc	ra,0x0
     170:	0fc08093          	addi	ra,ra,252 # 268 <end_except>
     174:	56c0006f          	j	6e0 <ISR_GPIO>

00000178 <ISR_SPIM0_ASM>:
     178:	fa010113          	addi	sp,sp,-96
     17c:	04112e23          	sw	ra,92(sp)
     180:	0b8000ef          	jal	ra,238 <store_regs>
     184:	00000097          	auipc	ra,0x0
     188:	0e408093          	addi	ra,ra,228 # 268 <end_except>
     18c:	5640006f          	j	6f0 <ISR_SPIM0>

00000190 <ISR_SPIM1_ASM>:
     190:	fa010113          	addi	sp,sp,-96
     194:	04112e23          	sw	ra,92(sp)
     198:	0a0000ef          	jal	ra,238 <store_regs>
     19c:	00000097          	auipc	ra,0x0
     1a0:	0cc08093          	addi	ra,ra,204 # 268 <end_except>
     1a4:	55c0006f          	j	700 <ISR_SPIM1>

000001a8 <ISR_TA_CMP_ASM>:
     1a8:	fa010113          	addi	sp,sp,-96
     1ac:	04112e23          	sw	ra,92(sp)
     1b0:	088000ef          	jal	ra,238 <store_regs>
     1b4:	00000097          	auipc	ra,0x0
     1b8:	0b408093          	addi	ra,ra,180 # 268 <end_except>
     1bc:	5640006f          	j	720 <ISR_TA_CMP>

000001c0 <ISR_TA_OVF_ASM>:
     1c0:	fa010113          	addi	sp,sp,-96
     1c4:	04112e23          	sw	ra,92(sp)
     1c8:	070000ef          	jal	ra,238 <store_regs>
     1cc:	00000097          	auipc	ra,0x0
     1d0:	09c08093          	addi	ra,ra,156 # 268 <end_except>
     1d4:	53c0006f          	j	710 <ISR_TA_OVF>

000001d8 <ISR_TB_CMP_ASM>:
     1d8:	fa010113          	addi	sp,sp,-96
     1dc:	04112e23          	sw	ra,92(sp)
     1e0:	058000ef          	jal	ra,238 <store_regs>
     1e4:	00000097          	auipc	ra,0x0
     1e8:	08408093          	addi	ra,ra,132 # 268 <end_except>
     1ec:	5540006f          	j	740 <ISR_TB_CMP>

000001f0 <ISR_TB_OVF_ASM>:
     1f0:	fa010113          	addi	sp,sp,-96
     1f4:	04112e23          	sw	ra,92(sp)
     1f8:	040000ef          	jal	ra,238 <store_regs>
     1fc:	00000097          	auipc	ra,0x0
     200:	06c08093          	addi	ra,ra,108 # 268 <end_except>
     204:	52c0006f          	j	730 <ISR_TB_OVF>

00000208 <illegal_insn_handler>:
     208:	fa010113          	addi	sp,sp,-96
     20c:	04112e23          	sw	ra,92(sp)
     210:	028000ef          	jal	ra,238 <store_regs>
     214:	00000097          	auipc	ra,0x0
     218:	05408093          	addi	ra,ra,84 # 268 <end_except>
     21c:	0980006f          	j	2b4 <illegal_insn_handler_c>

00000220 <ecall_insn_handler>:
     220:	fa010113          	addi	sp,sp,-96
     224:	04112e23          	sw	ra,92(sp)
     228:	010000ef          	jal	ra,238 <store_regs>
     22c:	00000097          	auipc	ra,0x0
     230:	03c08093          	addi	ra,ra,60 # 268 <end_except>
     234:	0900006f          	j	2c4 <ecall_insn_handler_c>

00000238 <store_regs>:
     238:	00312023          	sw	gp,0(sp)
     23c:	00412223          	sw	tp,4(sp)
     240:	00512423          	sw	t0,8(sp)
     244:	00612623          	sw	t1,12(sp)
     248:	00712823          	sw	t2,16(sp)
     24c:	00a12a23          	sw	a0,20(sp)
     250:	00b12c23          	sw	a1,24(sp)
     254:	00c12e23          	sw	a2,28(sp)
     258:	02d12023          	sw	a3,32(sp)
     25c:	02e12223          	sw	a4,36(sp)
     260:	02f12423          	sw	a5,40(sp)
     264:	00008067          	ret

00000268 <end_except>:
     268:	00012183          	lw	gp,0(sp)
     26c:	00412203          	lw	tp,4(sp)
     270:	00812283          	lw	t0,8(sp)
     274:	00c12303          	lw	t1,12(sp)
     278:	01012383          	lw	t2,16(sp)
     27c:	01412503          	lw	a0,20(sp)
     280:	01812583          	lw	a1,24(sp)
     284:	01c12603          	lw	a2,28(sp)
     288:	02012683          	lw	a3,32(sp)
     28c:	02412703          	lw	a4,36(sp)
     290:	02812783          	lw	a5,40(sp)
     294:	05c12083          	lw	ra,92(sp)
     298:	06010113          	addi	sp,sp,96
     29c:	30200073          	mret

000002a0 <_fini>:
     2a0:	00008067          	ret

000002a4 <default_exception_handler_c>:
     2a4:	ff010113          	addi	sp,sp,-16
     2a8:	00812623          	sw	s0,12(sp)
     2ac:	01010413          	addi	s0,sp,16
     2b0:	0000006f          	j	2b0 <default_exception_handler_c+0xc>

000002b4 <illegal_insn_handler_c>:
     2b4:	ff010113          	addi	sp,sp,-16
     2b8:	00812623          	sw	s0,12(sp)
     2bc:	01010413          	addi	s0,sp,16
     2c0:	0000006f          	j	2c0 <illegal_insn_handler_c+0xc>

000002c4 <ecall_insn_handler_c>:
     2c4:	ff010113          	addi	sp,sp,-16
     2c8:	00812623          	sw	s0,12(sp)
     2cc:	01010413          	addi	s0,sp,16
     2d0:	0000006f          	j	2d0 <ecall_insn_handler_c+0xc>

000002d4 <set_pin_function>:
     2d4:	fd010113          	addi	sp,sp,-48
     2d8:	02812623          	sw	s0,44(sp)
     2dc:	03010413          	addi	s0,sp,48
     2e0:	fca42e23          	sw	a0,-36(s0)
     2e4:	fcb42c23          	sw	a1,-40(s0)
     2e8:	1a1077b7          	lui	a5,0x1a107
     2ec:	0007a783          	lw	a5,0(a5) # 1a107000 <_stack+0x1a003000>
     2f0:	fef42623          	sw	a5,-20(s0)
     2f4:	fdc42783          	lw	a5,-36(s0)
     2f8:	00100713          	li	a4,1
     2fc:	00f717b3          	sll	a5,a4,a5
     300:	fff7c713          	not	a4,a5
     304:	fec42783          	lw	a5,-20(s0)
     308:	00f777b3          	and	a5,a4,a5
     30c:	fef42623          	sw	a5,-20(s0)
     310:	fdc42783          	lw	a5,-36(s0)
     314:	fd842703          	lw	a4,-40(s0)
     318:	00f71733          	sll	a4,a4,a5
     31c:	fec42783          	lw	a5,-20(s0)
     320:	00f767b3          	or	a5,a4,a5
     324:	fef42623          	sw	a5,-20(s0)
     328:	1a1077b7          	lui	a5,0x1a107
     32c:	fec42703          	lw	a4,-20(s0)
     330:	00e7a023          	sw	a4,0(a5) # 1a107000 <_stack+0x1a003000>
     334:	00000013          	nop
     338:	02c12403          	lw	s0,44(sp)
     33c:	03010113          	addi	sp,sp,48
     340:	00008067          	ret

00000344 <get_pin_function>:
     344:	fd010113          	addi	sp,sp,-48
     348:	02812623          	sw	s0,44(sp)
     34c:	03010413          	addi	s0,sp,48
     350:	fca42e23          	sw	a0,-36(s0)
     354:	1a1077b7          	lui	a5,0x1a107
     358:	0007a783          	lw	a5,0(a5) # 1a107000 <_stack+0x1a003000>
     35c:	fef42623          	sw	a5,-20(s0)
     360:	fec42703          	lw	a4,-20(s0)
     364:	fdc42783          	lw	a5,-36(s0)
     368:	40f757b3          	sra	a5,a4,a5
     36c:	0017f793          	andi	a5,a5,1
     370:	fef42623          	sw	a5,-20(s0)
     374:	fec42783          	lw	a5,-20(s0)
     378:	00078513          	mv	a0,a5
     37c:	02c12403          	lw	s0,44(sp)
     380:	03010113          	addi	sp,sp,48
     384:	00008067          	ret

00000388 <set_gpio_pin_direction>:
     388:	fd010113          	addi	sp,sp,-48
     38c:	02812623          	sw	s0,44(sp)
     390:	03010413          	addi	s0,sp,48
     394:	fca42e23          	sw	a0,-36(s0)
     398:	fcb42c23          	sw	a1,-40(s0)
     39c:	1a1017b7          	lui	a5,0x1a101
     3a0:	0007a783          	lw	a5,0(a5) # 1a101000 <_stack+0x19ffd000>
     3a4:	fef42623          	sw	a5,-20(s0)
     3a8:	fd842783          	lw	a5,-40(s0)
     3ac:	02079263          	bnez	a5,3d0 <set_gpio_pin_direction+0x48>
     3b0:	fdc42783          	lw	a5,-36(s0)
     3b4:	00100713          	li	a4,1
     3b8:	00f717b3          	sll	a5,a4,a5
     3bc:	fff7c713          	not	a4,a5
     3c0:	fec42783          	lw	a5,-20(s0)
     3c4:	00f777b3          	and	a5,a4,a5
     3c8:	fef42623          	sw	a5,-20(s0)
     3cc:	01c0006f          	j	3e8 <set_gpio_pin_direction+0x60>
     3d0:	fdc42783          	lw	a5,-36(s0)
     3d4:	00100713          	li	a4,1
     3d8:	00f71733          	sll	a4,a4,a5
     3dc:	fec42783          	lw	a5,-20(s0)
     3e0:	00f767b3          	or	a5,a4,a5
     3e4:	fef42623          	sw	a5,-20(s0)
     3e8:	1a1017b7          	lui	a5,0x1a101
     3ec:	fec42703          	lw	a4,-20(s0)
     3f0:	00e7a023          	sw	a4,0(a5) # 1a101000 <_stack+0x19ffd000>
     3f4:	00000013          	nop
     3f8:	02c12403          	lw	s0,44(sp)
     3fc:	03010113          	addi	sp,sp,48
     400:	00008067          	ret

00000404 <get_gpio_pin_direction>:
     404:	fd010113          	addi	sp,sp,-48
     408:	02812623          	sw	s0,44(sp)
     40c:	03010413          	addi	s0,sp,48
     410:	fca42e23          	sw	a0,-36(s0)
     414:	1a1017b7          	lui	a5,0x1a101
     418:	0007a783          	lw	a5,0(a5) # 1a101000 <_stack+0x19ffd000>
     41c:	fef42623          	sw	a5,-20(s0)
     420:	fec42703          	lw	a4,-20(s0)
     424:	fdc42783          	lw	a5,-36(s0)
     428:	00179793          	slli	a5,a5,0x1
     42c:	40f757b3          	sra	a5,a4,a5
     430:	0017f793          	andi	a5,a5,1
     434:	fef42623          	sw	a5,-20(s0)
     438:	fec42783          	lw	a5,-20(s0)
     43c:	00078513          	mv	a0,a5
     440:	02c12403          	lw	s0,44(sp)
     444:	03010113          	addi	sp,sp,48
     448:	00008067          	ret

0000044c <set_gpio_pin_value>:
     44c:	fd010113          	addi	sp,sp,-48
     450:	02812623          	sw	s0,44(sp)
     454:	03010413          	addi	s0,sp,48
     458:	fca42e23          	sw	a0,-36(s0)
     45c:	fcb42c23          	sw	a1,-40(s0)
     460:	1a1017b7          	lui	a5,0x1a101
     464:	00878793          	addi	a5,a5,8 # 1a101008 <_stack+0x19ffd008>
     468:	0007a783          	lw	a5,0(a5)
     46c:	fef42623          	sw	a5,-20(s0)
     470:	fd842783          	lw	a5,-40(s0)
     474:	02079263          	bnez	a5,498 <set_gpio_pin_value+0x4c>
     478:	fdc42783          	lw	a5,-36(s0)
     47c:	00100713          	li	a4,1
     480:	00f717b3          	sll	a5,a4,a5
     484:	fff7c713          	not	a4,a5
     488:	fec42783          	lw	a5,-20(s0)
     48c:	00f777b3          	and	a5,a4,a5
     490:	fef42623          	sw	a5,-20(s0)
     494:	01c0006f          	j	4b0 <set_gpio_pin_value+0x64>
     498:	fdc42783          	lw	a5,-36(s0)
     49c:	00100713          	li	a4,1
     4a0:	00f71733          	sll	a4,a4,a5
     4a4:	fec42783          	lw	a5,-20(s0)
     4a8:	00f767b3          	or	a5,a4,a5
     4ac:	fef42623          	sw	a5,-20(s0)
     4b0:	1a1017b7          	lui	a5,0x1a101
     4b4:	00878793          	addi	a5,a5,8 # 1a101008 <_stack+0x19ffd008>
     4b8:	fec42703          	lw	a4,-20(s0)
     4bc:	00e7a023          	sw	a4,0(a5)
     4c0:	00000013          	nop
     4c4:	02c12403          	lw	s0,44(sp)
     4c8:	03010113          	addi	sp,sp,48
     4cc:	00008067          	ret

000004d0 <get_gpio_pin_value>:
     4d0:	fd010113          	addi	sp,sp,-48
     4d4:	02812623          	sw	s0,44(sp)
     4d8:	03010413          	addi	s0,sp,48
     4dc:	fca42e23          	sw	a0,-36(s0)
     4e0:	1a1017b7          	lui	a5,0x1a101
     4e4:	00478793          	addi	a5,a5,4 # 1a101004 <_stack+0x19ffd004>
     4e8:	0007a783          	lw	a5,0(a5)
     4ec:	fef42623          	sw	a5,-20(s0)
     4f0:	fec42703          	lw	a4,-20(s0)
     4f4:	fdc42783          	lw	a5,-36(s0)
     4f8:	40f757b3          	sra	a5,a4,a5
     4fc:	0017f793          	andi	a5,a5,1
     500:	fef42623          	sw	a5,-20(s0)
     504:	fec42783          	lw	a5,-20(s0)
     508:	00078513          	mv	a0,a5
     50c:	02c12403          	lw	s0,44(sp)
     510:	03010113          	addi	sp,sp,48
     514:	00008067          	ret

00000518 <set_gpio_pin_irq_en>:
     518:	fd010113          	addi	sp,sp,-48
     51c:	02812623          	sw	s0,44(sp)
     520:	03010413          	addi	s0,sp,48
     524:	fca42e23          	sw	a0,-36(s0)
     528:	fcb42c23          	sw	a1,-40(s0)
     52c:	1a1017b7          	lui	a5,0x1a101
     530:	00c78793          	addi	a5,a5,12 # 1a10100c <_stack+0x19ffd00c>
     534:	0007a783          	lw	a5,0(a5)
     538:	fef42623          	sw	a5,-20(s0)
     53c:	fd842783          	lw	a5,-40(s0)
     540:	02079263          	bnez	a5,564 <set_gpio_pin_irq_en+0x4c>
     544:	fdc42783          	lw	a5,-36(s0)
     548:	00100713          	li	a4,1
     54c:	00f717b3          	sll	a5,a4,a5
     550:	fff7c793          	not	a5,a5
     554:	fec42703          	lw	a4,-20(s0)
     558:	00f777b3          	and	a5,a4,a5
     55c:	fef42623          	sw	a5,-20(s0)
     560:	01c0006f          	j	57c <set_gpio_pin_irq_en+0x64>
     564:	fdc42783          	lw	a5,-36(s0)
     568:	00100713          	li	a4,1
     56c:	00f717b3          	sll	a5,a4,a5
     570:	fec42703          	lw	a4,-20(s0)
     574:	00f767b3          	or	a5,a4,a5
     578:	fef42623          	sw	a5,-20(s0)
     57c:	1a1017b7          	lui	a5,0x1a101
     580:	00c78793          	addi	a5,a5,12 # 1a10100c <_stack+0x19ffd00c>
     584:	fec42703          	lw	a4,-20(s0)
     588:	00e7a023          	sw	a4,0(a5)
     58c:	00000013          	nop
     590:	02c12403          	lw	s0,44(sp)
     594:	03010113          	addi	sp,sp,48
     598:	00008067          	ret

0000059c <set_gpio_pin_irq_type>:
     59c:	fd010113          	addi	sp,sp,-48
     5a0:	02812623          	sw	s0,44(sp)
     5a4:	03010413          	addi	s0,sp,48
     5a8:	fca42e23          	sw	a0,-36(s0)
     5ac:	fcb42c23          	sw	a1,-40(s0)
     5b0:	1a1017b7          	lui	a5,0x1a101
     5b4:	01078793          	addi	a5,a5,16 # 1a101010 <_stack+0x19ffd010>
     5b8:	0007a783          	lw	a5,0(a5)
     5bc:	fef42623          	sw	a5,-20(s0)
     5c0:	1a1017b7          	lui	a5,0x1a101
     5c4:	01478793          	addi	a5,a5,20 # 1a101014 <_stack+0x19ffd014>
     5c8:	0007a783          	lw	a5,0(a5)
     5cc:	fef42423          	sw	a5,-24(s0)
     5d0:	fd842783          	lw	a5,-40(s0)
     5d4:	0017f793          	andi	a5,a5,1
     5d8:	02079263          	bnez	a5,5fc <set_gpio_pin_irq_type+0x60>
     5dc:	fdc42783          	lw	a5,-36(s0)
     5e0:	00100713          	li	a4,1
     5e4:	00f717b3          	sll	a5,a4,a5
     5e8:	fff7c793          	not	a5,a5
     5ec:	fec42703          	lw	a4,-20(s0)
     5f0:	00f777b3          	and	a5,a4,a5
     5f4:	fef42623          	sw	a5,-20(s0)
     5f8:	01c0006f          	j	614 <set_gpio_pin_irq_type+0x78>
     5fc:	fdc42783          	lw	a5,-36(s0)
     600:	00100713          	li	a4,1
     604:	00f717b3          	sll	a5,a4,a5
     608:	fec42703          	lw	a4,-20(s0)
     60c:	00f767b3          	or	a5,a4,a5
     610:	fef42623          	sw	a5,-20(s0)
     614:	fd842783          	lw	a5,-40(s0)
     618:	0027f793          	andi	a5,a5,2
     61c:	02079263          	bnez	a5,640 <set_gpio_pin_irq_type+0xa4>
     620:	fdc42783          	lw	a5,-36(s0)
     624:	00100713          	li	a4,1
     628:	00f717b3          	sll	a5,a4,a5
     62c:	fff7c793          	not	a5,a5
     630:	fe842703          	lw	a4,-24(s0)
     634:	00f777b3          	and	a5,a4,a5
     638:	fef42423          	sw	a5,-24(s0)
     63c:	01c0006f          	j	658 <set_gpio_pin_irq_type+0xbc>
     640:	fdc42783          	lw	a5,-36(s0)
     644:	00100713          	li	a4,1
     648:	00f717b3          	sll	a5,a4,a5
     64c:	fe842703          	lw	a4,-24(s0)
     650:	00f767b3          	or	a5,a4,a5
     654:	fef42423          	sw	a5,-24(s0)
     658:	1a1017b7          	lui	a5,0x1a101
     65c:	01078793          	addi	a5,a5,16 # 1a101010 <_stack+0x19ffd010>
     660:	fec42703          	lw	a4,-20(s0)
     664:	00e7a023          	sw	a4,0(a5)
     668:	1a1017b7          	lui	a5,0x1a101
     66c:	01478793          	addi	a5,a5,20 # 1a101014 <_stack+0x19ffd014>
     670:	fe842703          	lw	a4,-24(s0)
     674:	00e7a023          	sw	a4,0(a5)
     678:	00000013          	nop
     67c:	02c12403          	lw	s0,44(sp)
     680:	03010113          	addi	sp,sp,48
     684:	00008067          	ret

00000688 <get_gpio_irq_status>:
     688:	ff010113          	addi	sp,sp,-16
     68c:	00812623          	sw	s0,12(sp)
     690:	01010413          	addi	s0,sp,16
     694:	1a1017b7          	lui	a5,0x1a101
     698:	01878793          	addi	a5,a5,24 # 1a101018 <_stack+0x19ffd018>
     69c:	0007a783          	lw	a5,0(a5)
     6a0:	00078513          	mv	a0,a5
     6a4:	00c12403          	lw	s0,12(sp)
     6a8:	01010113          	addi	sp,sp,16
     6ac:	00008067          	ret

000006b0 <ISR_SRAM>:
     6b0:	ff010113          	addi	sp,sp,-16
     6b4:	00812623          	sw	s0,12(sp)
     6b8:	01010413          	addi	s0,sp,16
     6bc:	0000006f          	j	6bc <ISR_SRAM+0xc>

000006c0 <ISR_I2C>:
     6c0:	ff010113          	addi	sp,sp,-16
     6c4:	00812623          	sw	s0,12(sp)
     6c8:	01010413          	addi	s0,sp,16
     6cc:	0000006f          	j	6cc <ISR_I2C+0xc>

000006d0 <ISR_UART>:
     6d0:	ff010113          	addi	sp,sp,-16
     6d4:	00812623          	sw	s0,12(sp)
     6d8:	01010413          	addi	s0,sp,16
     6dc:	0000006f          	j	6dc <ISR_UART+0xc>

000006e0 <ISR_GPIO>:
     6e0:	ff010113          	addi	sp,sp,-16
     6e4:	00812623          	sw	s0,12(sp)
     6e8:	01010413          	addi	s0,sp,16
     6ec:	0000006f          	j	6ec <ISR_GPIO+0xc>

000006f0 <ISR_SPIM0>:
     6f0:	ff010113          	addi	sp,sp,-16
     6f4:	00812623          	sw	s0,12(sp)
     6f8:	01010413          	addi	s0,sp,16
     6fc:	0000006f          	j	6fc <ISR_SPIM0+0xc>

00000700 <ISR_SPIM1>:
     700:	ff010113          	addi	sp,sp,-16
     704:	00812623          	sw	s0,12(sp)
     708:	01010413          	addi	s0,sp,16
     70c:	0000006f          	j	70c <ISR_SPIM1+0xc>

00000710 <ISR_TA_OVF>:
     710:	ff010113          	addi	sp,sp,-16
     714:	00812623          	sw	s0,12(sp)
     718:	01010413          	addi	s0,sp,16
     71c:	0000006f          	j	71c <ISR_TA_OVF+0xc>

00000720 <ISR_TA_CMP>:
     720:	ff010113          	addi	sp,sp,-16
     724:	00812623          	sw	s0,12(sp)
     728:	01010413          	addi	s0,sp,16
     72c:	0000006f          	j	72c <ISR_TA_CMP+0xc>

00000730 <ISR_TB_OVF>:
     730:	ff010113          	addi	sp,sp,-16
     734:	00812623          	sw	s0,12(sp)
     738:	01010413          	addi	s0,sp,16
     73c:	0000006f          	j	73c <ISR_TB_OVF+0xc>

00000740 <ISR_TB_CMP>:
     740:	ff010113          	addi	sp,sp,-16
     744:	00812623          	sw	s0,12(sp)
     748:	01010413          	addi	s0,sp,16
     74c:	0000006f          	j	74c <ISR_TB_CMP+0xc>

00000750 <flash_write_enable>:
     750:	ff010113          	addi	sp,sp,-16
     754:	00112623          	sw	ra,12(sp)
     758:	00812423          	sw	s0,8(sp)
     75c:	01010413          	addi	s0,sp,16
     760:	00000593          	li	a1,0
     764:	00000513          	li	a0,0
     768:	3dc010ef          	jal	ra,1b44 <spi_setup_dummy>
     76c:	00000693          	li	a3,0
     770:	00000613          	li	a2,0
     774:	00800593          	li	a1,8
     778:	00600513          	li	a0,6
     77c:	338010ef          	jal	ra,1ab4 <spi_setup_cmd_addr>
     780:	00000513          	li	a0,0
     784:	410010ef          	jal	ra,1b94 <spi_set_datalen>
     788:	00000593          	li	a1,0
     78c:	00100513          	li	a0,1
     790:	46c010ef          	jal	ra,1bfc <spi_start_transaction>
     794:	00000013          	nop
     798:	00c12083          	lw	ra,12(sp)
     79c:	00812403          	lw	s0,8(sp)
     7a0:	01010113          	addi	sp,sp,16
     7a4:	00008067          	ret

000007a8 <flash_write_disable>:
     7a8:	ff010113          	addi	sp,sp,-16
     7ac:	00112623          	sw	ra,12(sp)
     7b0:	00812423          	sw	s0,8(sp)
     7b4:	01010413          	addi	s0,sp,16
     7b8:	00000593          	li	a1,0
     7bc:	00000513          	li	a0,0
     7c0:	384010ef          	jal	ra,1b44 <spi_setup_dummy>
     7c4:	00000693          	li	a3,0
     7c8:	00000613          	li	a2,0
     7cc:	00800593          	li	a1,8
     7d0:	00400513          	li	a0,4
     7d4:	2e0010ef          	jal	ra,1ab4 <spi_setup_cmd_addr>
     7d8:	00000513          	li	a0,0
     7dc:	3b8010ef          	jal	ra,1b94 <spi_set_datalen>
     7e0:	00000593          	li	a1,0
     7e4:	00100513          	li	a0,1
     7e8:	414010ef          	jal	ra,1bfc <spi_start_transaction>
     7ec:	00000013          	nop
     7f0:	00c12083          	lw	ra,12(sp)
     7f4:	00812403          	lw	s0,8(sp)
     7f8:	01010113          	addi	sp,sp,16
     7fc:	00008067          	ret

00000800 <flash_in_progress>:
     800:	fe010113          	addi	sp,sp,-32
     804:	00112e23          	sw	ra,28(sp)
     808:	00812c23          	sw	s0,24(sp)
     80c:	02010413          	addi	s0,sp,32
     810:	fe042623          	sw	zero,-20(s0)
     814:	00000593          	li	a1,0
     818:	00000513          	li	a0,0
     81c:	328010ef          	jal	ra,1b44 <spi_setup_dummy>
     820:	00000693          	li	a3,0
     824:	00000613          	li	a2,0
     828:	00800593          	li	a1,8
     82c:	00500513          	li	a0,5
     830:	284010ef          	jal	ra,1ab4 <spi_setup_cmd_addr>
     834:	00800513          	li	a0,8
     838:	35c010ef          	jal	ra,1b94 <spi_set_datalen>
     83c:	00000593          	li	a1,0
     840:	00000513          	li	a0,0
     844:	3b8010ef          	jal	ra,1bfc <spi_start_transaction>
     848:	fec40793          	addi	a5,s0,-20
     84c:	00800593          	li	a1,8
     850:	00078513          	mv	a0,a5
     854:	4d8010ef          	jal	ra,1d2c <spi_read_fifo>
     858:	fec42783          	lw	a5,-20(s0)
     85c:	0017f793          	andi	a5,a5,1
     860:	00078513          	mv	a0,a5
     864:	01c12083          	lw	ra,28(sp)
     868:	01812403          	lw	s0,24(sp)
     86c:	02010113          	addi	sp,sp,32
     870:	00008067          	ret

00000874 <flash_block_erase_64k>:
     874:	fe010113          	addi	sp,sp,-32
     878:	00112e23          	sw	ra,28(sp)
     87c:	00812c23          	sw	s0,24(sp)
     880:	02010413          	addi	s0,sp,32
     884:	fea42623          	sw	a0,-20(s0)
     888:	00000593          	li	a1,0
     88c:	00000513          	li	a0,0
     890:	2b4010ef          	jal	ra,1b44 <spi_setup_dummy>
     894:	01800693          	li	a3,24
     898:	fec42603          	lw	a2,-20(s0)
     89c:	00800593          	li	a1,8
     8a0:	0d800513          	li	a0,216
     8a4:	210010ef          	jal	ra,1ab4 <spi_setup_cmd_addr>
     8a8:	00000513          	li	a0,0
     8ac:	2e8010ef          	jal	ra,1b94 <spi_set_datalen>
     8b0:	00000593          	li	a1,0
     8b4:	00100513          	li	a0,1
     8b8:	344010ef          	jal	ra,1bfc <spi_start_transaction>
     8bc:	00000013          	nop
     8c0:	01c12083          	lw	ra,28(sp)
     8c4:	01812403          	lw	s0,24(sp)
     8c8:	02010113          	addi	sp,sp,32
     8cc:	00008067          	ret

000008d0 <flash_chip_erase>:
     8d0:	ff010113          	addi	sp,sp,-16
     8d4:	00112623          	sw	ra,12(sp)
     8d8:	00812423          	sw	s0,8(sp)
     8dc:	01010413          	addi	s0,sp,16
     8e0:	00000593          	li	a1,0
     8e4:	00000513          	li	a0,0
     8e8:	25c010ef          	jal	ra,1b44 <spi_setup_dummy>
     8ec:	00000693          	li	a3,0
     8f0:	00000613          	li	a2,0
     8f4:	00800593          	li	a1,8
     8f8:	0c700513          	li	a0,199
     8fc:	1b8010ef          	jal	ra,1ab4 <spi_setup_cmd_addr>
     900:	00000513          	li	a0,0
     904:	290010ef          	jal	ra,1b94 <spi_set_datalen>
     908:	00000593          	li	a1,0
     90c:	00100513          	li	a0,1
     910:	2ec010ef          	jal	ra,1bfc <spi_start_transaction>
     914:	00000013          	nop
     918:	00c12083          	lw	ra,12(sp)
     91c:	00812403          	lw	s0,8(sp)
     920:	01010113          	addi	sp,sp,16
     924:	00008067          	ret

00000928 <flash_write_word>:
     928:	fe010113          	addi	sp,sp,-32
     92c:	00112e23          	sw	ra,28(sp)
     930:	00812c23          	sw	s0,24(sp)
     934:	02010413          	addi	s0,sp,32
     938:	fea42623          	sw	a0,-20(s0)
     93c:	feb42423          	sw	a1,-24(s0)
     940:	e11ff0ef          	jal	ra,750 <flash_write_enable>
     944:	00000593          	li	a1,0
     948:	00000513          	li	a0,0
     94c:	1f8010ef          	jal	ra,1b44 <spi_setup_dummy>
     950:	01800693          	li	a3,24
     954:	fec42603          	lw	a2,-20(s0)
     958:	00800593          	li	a1,8
     95c:	00200513          	li	a0,2
     960:	154010ef          	jal	ra,1ab4 <spi_setup_cmd_addr>
     964:	02000513          	li	a0,32
     968:	22c010ef          	jal	ra,1b94 <spi_set_datalen>
     96c:	fe840793          	addi	a5,s0,-24
     970:	02000593          	li	a1,32
     974:	00078513          	mv	a0,a5
     978:	30c010ef          	jal	ra,1c84 <spi_write_fifo>
     97c:	00000593          	li	a1,0
     980:	00100513          	li	a0,1
     984:	278010ef          	jal	ra,1bfc <spi_start_transaction>
     988:	00000013          	nop
     98c:	e75ff0ef          	jal	ra,800 <flash_in_progress>
     990:	00050793          	mv	a5,a0
     994:	fe079ce3          	bnez	a5,98c <flash_write_word+0x64>
     998:	e11ff0ef          	jal	ra,7a8 <flash_write_disable>
     99c:	00000013          	nop
     9a0:	e61ff0ef          	jal	ra,800 <flash_in_progress>
     9a4:	00050793          	mv	a5,a0
     9a8:	fe079ce3          	bnez	a5,9a0 <flash_write_word+0x78>
     9ac:	00000013          	nop
     9b0:	00000013          	nop
     9b4:	01c12083          	lw	ra,28(sp)
     9b8:	01812403          	lw	s0,24(sp)
     9bc:	02010113          	addi	sp,sp,32
     9c0:	00008067          	ret

000009c4 <flash_read_word>:
     9c4:	fe010113          	addi	sp,sp,-32
     9c8:	00112e23          	sw	ra,28(sp)
     9cc:	00812c23          	sw	s0,24(sp)
     9d0:	02010413          	addi	s0,sp,32
     9d4:	fea42623          	sw	a0,-20(s0)
     9d8:	feb42423          	sw	a1,-24(s0)
     9dc:	00000593          	li	a1,0
     9e0:	00400513          	li	a0,4
     9e4:	218010ef          	jal	ra,1bfc <spi_start_transaction>
     9e8:	00000593          	li	a1,0
     9ec:	00000513          	li	a0,0
     9f0:	154010ef          	jal	ra,1b44 <spi_setup_dummy>
     9f4:	01800693          	li	a3,24
     9f8:	fec42603          	lw	a2,-20(s0)
     9fc:	00800593          	li	a1,8
     a00:	00300513          	li	a0,3
     a04:	0b0010ef          	jal	ra,1ab4 <spi_setup_cmd_addr>
     a08:	02000513          	li	a0,32
     a0c:	188010ef          	jal	ra,1b94 <spi_set_datalen>
     a10:	00000593          	li	a1,0
     a14:	00000513          	li	a0,0
     a18:	1e4010ef          	jal	ra,1bfc <spi_start_transaction>
     a1c:	02000593          	li	a1,32
     a20:	fe842503          	lw	a0,-24(s0)
     a24:	308010ef          	jal	ra,1d2c <spi_read_fifo>
     a28:	00000013          	nop
     a2c:	dd5ff0ef          	jal	ra,800 <flash_in_progress>
     a30:	00050793          	mv	a5,a0
     a34:	fe079ce3          	bnez	a5,a2c <flash_read_word+0x68>
     a38:	00000013          	nop
     a3c:	00000013          	nop
     a40:	01c12083          	lw	ra,28(sp)
     a44:	01812403          	lw	s0,24(sp)
     a48:	02010113          	addi	sp,sp,32
     a4c:	00008067          	ret

00000a50 <main>:
     a50:	fb010113          	addi	sp,sp,-80
     a54:	04112623          	sw	ra,76(sp)
     a58:	04812423          	sw	s0,72(sp)
     a5c:	05010413          	addi	s0,sp,80
     a60:	fa042e23          	sw	zero,-68(s0)
     a64:	fc042023          	sw	zero,-64(s0)
     a68:	fc040223          	sb	zero,-60(s0)
     a6c:	fa042c23          	sw	zero,-72(s0)
     a70:	00100513          	li	a0,1
     a74:	78d000ef          	jal	ra,1a00 <spi_setup_master>
     a78:	00c00593          	li	a1,12
     a7c:	00000513          	li	a0,0
     a80:	3f0010ef          	jal	ra,1e70 <uart_set_cfg>
     a84:	fe042623          	sw	zero,-20(s0)
     a88:	0300006f          	j	ab8 <main+0x68>
     a8c:	00100593          	li	a1,1
     a90:	fec42503          	lw	a0,-20(s0)
     a94:	8f5ff0ef          	jal	ra,388 <set_gpio_pin_direction>
     a98:	fec42783          	lw	a5,-20(s0)
     a9c:	0017f793          	andi	a5,a5,1
     aa0:	00078593          	mv	a1,a5
     aa4:	fec42503          	lw	a0,-20(s0)
     aa8:	9a5ff0ef          	jal	ra,44c <set_gpio_pin_value>
     aac:	fec42783          	lw	a5,-20(s0)
     ab0:	00178793          	addi	a5,a5,1
     ab4:	fef42623          	sw	a5,-20(s0)
     ab8:	fec42703          	lw	a4,-20(s0)
     abc:	00700793          	li	a5,7
     ac0:	fce7d6e3          	bge	a5,a4,a8c <main+0x3c>
     ac4:	00000013          	nop
     ac8:	508010ef          	jal	ra,1fd0 <uart_getchar>
     acc:	00050793          	mv	a5,a0
     ad0:	00078713          	mv	a4,a5
     ad4:	07300793          	li	a5,115
     ad8:	fef718e3          	bne	a4,a5,ac8 <main+0x78>
     adc:	00d00593          	li	a1,13
     ae0:	001007b7          	lui	a5,0x100
     ae4:	01078513          	addi	a0,a5,16 # 100010 <numchar+0x10>
     ae8:	450010ef          	jal	ra,1f38 <uart_send>
     aec:	1a1027b7          	lui	a5,0x1a102
     af0:	00478793          	addi	a5,a5,4 # 1a102004 <_stack+0x19ffe004>
     af4:	00400713          	li	a4,4
     af8:	00e7a023          	sw	a4,0(a5)
     afc:	001007b7          	lui	a5,0x100
     b00:	1847a783          	lw	a5,388(a5) # 100184 <myvar>
     b04:	00078593          	mv	a1,a5
     b08:	001007b7          	lui	a5,0x100
     b0c:	02078513          	addi	a0,a5,32 # 100020 <numchar+0x20>
     b10:	35d000ef          	jal	ra,166c <printf>
     b14:	001007b7          	lui	a5,0x100
     b18:	14400713          	li	a4,324
     b1c:	18e7a223          	sw	a4,388(a5) # 100184 <myvar>
     b20:	001007b7          	lui	a5,0x100
     b24:	1847a783          	lw	a5,388(a5) # 100184 <myvar>
     b28:	00078593          	mv	a1,a5
     b2c:	001007b7          	lui	a5,0x100
     b30:	02c78513          	addi	a0,a5,44 # 10002c <numchar+0x2c>
     b34:	339000ef          	jal	ra,166c <printf>
     b38:	01f00593          	li	a1,31
     b3c:	001007b7          	lui	a5,0x100
     b40:	03878513          	addi	a0,a5,56 # 100038 <numchar+0x38>
     b44:	3f4010ef          	jal	ra,1f38 <uart_send>
     b48:	fe042423          	sw	zero,-24(s0)
     b4c:	0100006f          	j	b5c <main+0x10c>
     b50:	fe842783          	lw	a5,-24(s0)
     b54:	00178793          	addi	a5,a5,1
     b58:	fef42423          	sw	a5,-24(s0)
     b5c:	fe842703          	lw	a4,-24(s0)
     b60:	000017b7          	lui	a5,0x1
     b64:	bb778793          	addi	a5,a5,-1097 # bb7 <main+0x167>
     b68:	fee7d4e3          	bge	a5,a4,b50 <main+0x100>
     b6c:	00000593          	li	a1,0
     b70:	01800513          	li	a0,24
     b74:	7d1000ef          	jal	ra,1b44 <spi_setup_dummy>
     b78:	00000693          	li	a3,0
     b7c:	00000613          	li	a2,0
     b80:	00800593          	li	a1,8
     b84:	0ab00513          	li	a0,171
     b88:	72d000ef          	jal	ra,1ab4 <spi_setup_cmd_addr>
     b8c:	00800513          	li	a0,8
     b90:	004010ef          	jal	ra,1b94 <spi_set_datalen>
     b94:	00000593          	li	a1,0
     b98:	00000513          	li	a0,0
     b9c:	060010ef          	jal	ra,1bfc <spi_start_transaction>
     ba0:	fc840793          	addi	a5,s0,-56
     ba4:	00800593          	li	a1,8
     ba8:	00078513          	mv	a0,a5
     bac:	180010ef          	jal	ra,1d2c <spi_read_fifo>
     bb0:	fc842783          	lw	a5,-56(s0)
     bb4:	00078713          	mv	a4,a5
     bb8:	fbc40793          	addi	a5,s0,-68
     bbc:	00070593          	mv	a1,a4
     bc0:	00078513          	mv	a0,a5
     bc4:	1e8000ef          	jal	ra,dac <hex_to_string>
     bc8:	fbc40793          	addi	a5,s0,-68
     bcc:	00800593          	li	a1,8
     bd0:	00078513          	mv	a0,a5
     bd4:	364010ef          	jal	ra,1f38 <uart_send>
     bd8:	00100593          	li	a1,1
     bdc:	001007b7          	lui	a5,0x100
     be0:	05878513          	addi	a0,a5,88 # 100058 <numchar+0x58>
     be4:	354010ef          	jal	ra,1f38 <uart_send>
     be8:	474010ef          	jal	ra,205c <uart_wait_tx_done>
     bec:	fc042423          	sw	zero,-56(s0)
     bf0:	00900593          	li	a1,9
     bf4:	001007b7          	lui	a5,0x100
     bf8:	05c78513          	addi	a0,a5,92 # 10005c <numchar+0x5c>
     bfc:	33c010ef          	jal	ra,1f38 <uart_send>
     c00:	45c010ef          	jal	ra,205c <uart_wait_tx_done>
     c04:	00000593          	li	a1,0
     c08:	00000513          	li	a0,0
     c0c:	739000ef          	jal	ra,1b44 <spi_setup_dummy>
     c10:	00000693          	li	a3,0
     c14:	00000613          	li	a2,0
     c18:	00800593          	li	a1,8
     c1c:	09f00513          	li	a0,159
     c20:	695000ef          	jal	ra,1ab4 <spi_setup_cmd_addr>
     c24:	01800513          	li	a0,24
     c28:	76d000ef          	jal	ra,1b94 <spi_set_datalen>
     c2c:	00000593          	li	a1,0
     c30:	00000513          	li	a0,0
     c34:	7c9000ef          	jal	ra,1bfc <spi_start_transaction>
     c38:	fc840793          	addi	a5,s0,-56
     c3c:	01800593          	li	a1,24
     c40:	00078513          	mv	a0,a5
     c44:	0e8010ef          	jal	ra,1d2c <spi_read_fifo>
     c48:	fc842783          	lw	a5,-56(s0)
     c4c:	00078713          	mv	a4,a5
     c50:	fbc40793          	addi	a5,s0,-68
     c54:	00070593          	mv	a1,a4
     c58:	00078513          	mv	a0,a5
     c5c:	150000ef          	jal	ra,dac <hex_to_string>
     c60:	fbc40793          	addi	a5,s0,-68
     c64:	00a00593          	li	a1,10
     c68:	00078513          	mv	a0,a5
     c6c:	2cc010ef          	jal	ra,1f38 <uart_send>
     c70:	00300593          	li	a1,3
     c74:	001007b7          	lui	a5,0x100
     c78:	06878513          	addi	a0,a5,104 # 100068 <numchar+0x68>
     c7c:	2bc010ef          	jal	ra,1f38 <uart_send>
     c80:	01700593          	li	a1,23
     c84:	001007b7          	lui	a5,0x100
     c88:	06c78513          	addi	a0,a5,108 # 10006c <numchar+0x6c>
     c8c:	2ac010ef          	jal	ra,1f38 <uart_send>
     c90:	3cc010ef          	jal	ra,205c <uart_wait_tx_done>
     c94:	fc042423          	sw	zero,-56(s0)
     c98:	00000593          	li	a1,0
     c9c:	01000513          	li	a0,16
     ca0:	6a5000ef          	jal	ra,1b44 <spi_setup_dummy>
     ca4:	00800693          	li	a3,8
     ca8:	00000613          	li	a2,0
     cac:	00800593          	li	a1,8
     cb0:	09000513          	li	a0,144
     cb4:	601000ef          	jal	ra,1ab4 <spi_setup_cmd_addr>
     cb8:	01000513          	li	a0,16
     cbc:	6d9000ef          	jal	ra,1b94 <spi_set_datalen>
     cc0:	00000593          	li	a1,0
     cc4:	00000513          	li	a0,0
     cc8:	735000ef          	jal	ra,1bfc <spi_start_transaction>
     ccc:	fc840793          	addi	a5,s0,-56
     cd0:	01000593          	li	a1,16
     cd4:	00078513          	mv	a0,a5
     cd8:	054010ef          	jal	ra,1d2c <spi_read_fifo>
     cdc:	fc842783          	lw	a5,-56(s0)
     ce0:	00078713          	mv	a4,a5
     ce4:	fbc40793          	addi	a5,s0,-68
     ce8:	00070593          	mv	a1,a4
     cec:	00078513          	mv	a0,a5
     cf0:	0bc000ef          	jal	ra,dac <hex_to_string>
     cf4:	fbc40793          	addi	a5,s0,-68
     cf8:	00800593          	li	a1,8
     cfc:	00078513          	mv	a0,a5
     d00:	238010ef          	jal	ra,1f38 <uart_send>
     d04:	00300593          	li	a1,3
     d08:	001007b7          	lui	a5,0x100
     d0c:	06878513          	addi	a0,a5,104 # 100068 <numchar+0x68>
     d10:	228010ef          	jal	ra,1f38 <uart_send>
     d14:	a3dff0ef          	jal	ra,750 <flash_write_enable>
     d18:	001007b7          	lui	a5,0x100
     d1c:	08478513          	addi	a0,a5,132 # 100084 <numchar+0x84>
     d20:	1c1000ef          	jal	ra,16e0 <puts>
     d24:	00000513          	li	a0,0
     d28:	b4dff0ef          	jal	ra,874 <flash_block_erase_64k>
     d2c:	00000013          	nop
     d30:	ad1ff0ef          	jal	ra,800 <flash_in_progress>
     d34:	00050793          	mv	a5,a0
     d38:	fe079ce3          	bnez	a5,d30 <main+0x2e0>
     d3c:	001007b7          	lui	a5,0x100
     d40:	09878513          	addi	a0,a5,152 # 100098 <numchar+0x98>
     d44:	19d000ef          	jal	ra,16e0 <puts>
     d48:	001007b7          	lui	a5,0x100
     d4c:	0ac78513          	addi	a0,a5,172 # 1000ac <numchar+0xac>
     d50:	191000ef          	jal	ra,16e0 <puts>
     d54:	123457b7          	lui	a5,0x12345
     d58:	67878593          	addi	a1,a5,1656 # 12345678 <_stack+0x12241678>
     d5c:	00000513          	li	a0,0
     d60:	bc9ff0ef          	jal	ra,928 <flash_write_word>
     d64:	001007b7          	lui	a5,0x100
     d68:	0d078513          	addi	a0,a5,208 # 1000d0 <numchar+0xd0>
     d6c:	175000ef          	jal	ra,16e0 <puts>
     d70:	fb840793          	addi	a5,s0,-72
     d74:	00078593          	mv	a1,a5
     d78:	00000513          	li	a0,0
     d7c:	c49ff0ef          	jal	ra,9c4 <flash_read_word>
     d80:	fb842783          	lw	a5,-72(s0)
     d84:	00078593          	mv	a1,a5
     d88:	001007b7          	lui	a5,0x100
     d8c:	0e078513          	addi	a0,a5,224 # 1000e0 <numchar+0xe0>
     d90:	0dd000ef          	jal	ra,166c <printf>
     d94:	00000793          	li	a5,0
     d98:	00078513          	mv	a0,a5
     d9c:	04c12083          	lw	ra,76(sp)
     da0:	04812403          	lw	s0,72(sp)
     da4:	05010113          	addi	sp,sp,80
     da8:	00008067          	ret

00000dac <hex_to_string>:
     dac:	fd010113          	addi	sp,sp,-48
     db0:	02812623          	sw	s0,44(sp)
     db4:	03010413          	addi	s0,sp,48
     db8:	fca42e23          	sw	a0,-36(s0)
     dbc:	fcb42c23          	sw	a1,-40(s0)
     dc0:	fe042623          	sw	zero,-20(s0)
     dc4:	04c0006f          	j	e10 <hex_to_string+0x64>
     dc8:	00700713          	li	a4,7
     dcc:	fec42783          	lw	a5,-20(s0)
     dd0:	40f707b3          	sub	a5,a4,a5
     dd4:	00279793          	slli	a5,a5,0x2
     dd8:	fd842703          	lw	a4,-40(s0)
     ddc:	00f757b3          	srl	a5,a4,a5
     de0:	00f7f713          	andi	a4,a5,15
     de4:	fec42783          	lw	a5,-20(s0)
     de8:	fdc42683          	lw	a3,-36(s0)
     dec:	00f687b3          	add	a5,a3,a5
     df0:	001006b7          	lui	a3,0x100
     df4:	00068693          	mv	a3,a3
     df8:	00e68733          	add	a4,a3,a4
     dfc:	00074703          	lbu	a4,0(a4)
     e00:	00e78023          	sb	a4,0(a5)
     e04:	fec42783          	lw	a5,-20(s0)
     e08:	00178793          	addi	a5,a5,1
     e0c:	fef42623          	sw	a5,-20(s0)
     e10:	fec42703          	lw	a4,-20(s0)
     e14:	00700793          	li	a5,7
     e18:	fae7d8e3          	bge	a5,a4,dc8 <hex_to_string+0x1c>
     e1c:	fdc42783          	lw	a5,-36(s0)
     e20:	00878793          	addi	a5,a5,8
     e24:	00078023          	sb	zero,0(a5)
     e28:	00000013          	nop
     e2c:	02c12403          	lw	s0,44(sp)
     e30:	03010113          	addi	sp,sp,48
     e34:	00008067          	ret

00000e38 <divu10>:
     e38:	fd010113          	addi	sp,sp,-48
     e3c:	02812623          	sw	s0,44(sp)
     e40:	03010413          	addi	s0,sp,48
     e44:	fca42e23          	sw	a0,-36(s0)
     e48:	fdc42783          	lw	a5,-36(s0)
     e4c:	0017d713          	srli	a4,a5,0x1
     e50:	fdc42783          	lw	a5,-36(s0)
     e54:	0027d793          	srli	a5,a5,0x2
     e58:	00f707b3          	add	a5,a4,a5
     e5c:	fef42623          	sw	a5,-20(s0)
     e60:	fec42783          	lw	a5,-20(s0)
     e64:	0047d793          	srli	a5,a5,0x4
     e68:	fec42703          	lw	a4,-20(s0)
     e6c:	00f707b3          	add	a5,a4,a5
     e70:	fef42623          	sw	a5,-20(s0)
     e74:	fec42783          	lw	a5,-20(s0)
     e78:	0087d793          	srli	a5,a5,0x8
     e7c:	fec42703          	lw	a4,-20(s0)
     e80:	00f707b3          	add	a5,a4,a5
     e84:	fef42623          	sw	a5,-20(s0)
     e88:	fec42783          	lw	a5,-20(s0)
     e8c:	0107d793          	srli	a5,a5,0x10
     e90:	fec42703          	lw	a4,-20(s0)
     e94:	00f707b3          	add	a5,a4,a5
     e98:	fef42623          	sw	a5,-20(s0)
     e9c:	fec42783          	lw	a5,-20(s0)
     ea0:	0037d793          	srli	a5,a5,0x3
     ea4:	fef42623          	sw	a5,-20(s0)
     ea8:	fec42703          	lw	a4,-20(s0)
     eac:	00070793          	mv	a5,a4
     eb0:	00279793          	slli	a5,a5,0x2
     eb4:	00e787b3          	add	a5,a5,a4
     eb8:	00179793          	slli	a5,a5,0x1
     ebc:	00078713          	mv	a4,a5
     ec0:	fdc42783          	lw	a5,-36(s0)
     ec4:	40e787b3          	sub	a5,a5,a4
     ec8:	fef42423          	sw	a5,-24(s0)
     ecc:	fe842783          	lw	a5,-24(s0)
     ed0:	00678793          	addi	a5,a5,6
     ed4:	0047d713          	srli	a4,a5,0x4
     ed8:	fec42783          	lw	a5,-20(s0)
     edc:	00f707b3          	add	a5,a4,a5
     ee0:	00078513          	mv	a0,a5
     ee4:	02c12403          	lw	s0,44(sp)
     ee8:	03010113          	addi	sp,sp,48
     eec:	00008067          	ret

00000ef0 <remu10>:
     ef0:	fe010113          	addi	sp,sp,-32
     ef4:	00812e23          	sw	s0,28(sp)
     ef8:	02010413          	addi	s0,sp,32
     efc:	fea42623          	sw	a0,-20(s0)
     f00:	fec42703          	lw	a4,-20(s0)
     f04:	1999a7b7          	lui	a5,0x1999a
     f08:	99978793          	addi	a5,a5,-1639 # 19999999 <_stack+0x19895999>
     f0c:	02f70733          	mul	a4,a4,a5
     f10:	fec42783          	lw	a5,-20(s0)
     f14:	0017d793          	srli	a5,a5,0x1
     f18:	00f70733          	add	a4,a4,a5
     f1c:	fec42783          	lw	a5,-20(s0)
     f20:	0037d793          	srli	a5,a5,0x3
     f24:	00f707b3          	add	a5,a4,a5
     f28:	01c7d793          	srli	a5,a5,0x1c
     f2c:	fef42623          	sw	a5,-20(s0)
     f30:	001007b7          	lui	a5,0x100
     f34:	17478713          	addi	a4,a5,372 # 100174 <remu10_table>
     f38:	fec42783          	lw	a5,-20(s0)
     f3c:	00f707b3          	add	a5,a4,a5
     f40:	0007c783          	lbu	a5,0(a5)
     f44:	00078513          	mv	a0,a5
     f48:	01c12403          	lw	s0,28(sp)
     f4c:	02010113          	addi	sp,sp,32
     f50:	00008067          	ret

00000f54 <putchar>:
     f54:	fe010113          	addi	sp,sp,-32
     f58:	00112e23          	sw	ra,28(sp)
     f5c:	00812c23          	sw	s0,24(sp)
     f60:	02010413          	addi	s0,sp,32
     f64:	fea42623          	sw	a0,-20(s0)
     f68:	fec42783          	lw	a5,-20(s0)
     f6c:	0ff7f793          	andi	a5,a5,255
     f70:	00078513          	mv	a0,a5
     f74:	0a0010ef          	jal	ra,2014 <uart_sendchar>
     f78:	fec42783          	lw	a5,-20(s0)
     f7c:	00078513          	mv	a0,a5
     f80:	01c12083          	lw	ra,28(sp)
     f84:	01812403          	lw	s0,24(sp)
     f88:	02010113          	addi	sp,sp,32
     f8c:	00008067          	ret

00000f90 <qprintchar>:
     f90:	fe010113          	addi	sp,sp,-32
     f94:	00112e23          	sw	ra,28(sp)
     f98:	00812c23          	sw	s0,24(sp)
     f9c:	02010413          	addi	s0,sp,32
     fa0:	fea42623          	sw	a0,-20(s0)
     fa4:	feb42423          	sw	a1,-24(s0)
     fa8:	fec42783          	lw	a5,-20(s0)
     fac:	02078863          	beqz	a5,fdc <qprintchar+0x4c>
     fb0:	fec42783          	lw	a5,-20(s0)
     fb4:	0007a783          	lw	a5,0(a5)
     fb8:	fe842703          	lw	a4,-24(s0)
     fbc:	0ff77713          	andi	a4,a4,255
     fc0:	00e78023          	sb	a4,0(a5)
     fc4:	fec42783          	lw	a5,-20(s0)
     fc8:	0007a783          	lw	a5,0(a5)
     fcc:	00178713          	addi	a4,a5,1
     fd0:	fec42783          	lw	a5,-20(s0)
     fd4:	00e7a023          	sw	a4,0(a5)
     fd8:	0140006f          	j	fec <qprintchar+0x5c>
     fdc:	fe842783          	lw	a5,-24(s0)
     fe0:	0ff7f793          	andi	a5,a5,255
     fe4:	00078513          	mv	a0,a5
     fe8:	f6dff0ef          	jal	ra,f54 <putchar>
     fec:	00000013          	nop
     ff0:	01c12083          	lw	ra,28(sp)
     ff4:	01812403          	lw	s0,24(sp)
     ff8:	02010113          	addi	sp,sp,32
     ffc:	00008067          	ret

00001000 <qprints>:
    1000:	fd010113          	addi	sp,sp,-48
    1004:	02112623          	sw	ra,44(sp)
    1008:	02812423          	sw	s0,40(sp)
    100c:	02912223          	sw	s1,36(sp)
    1010:	03212023          	sw	s2,32(sp)
    1014:	01312e23          	sw	s3,28(sp)
    1018:	01412c23          	sw	s4,24(sp)
    101c:	03010413          	addi	s0,sp,48
    1020:	fca42e23          	sw	a0,-36(s0)
    1024:	fcb42c23          	sw	a1,-40(s0)
    1028:	fcc42a23          	sw	a2,-44(s0)
    102c:	fcd42823          	sw	a3,-48(s0)
    1030:	00000493          	li	s1,0
    1034:	02000a13          	li	s4,32
    1038:	fd442783          	lw	a5,-44(s0)
    103c:	04f05663          	blez	a5,1088 <qprints+0x88>
    1040:	00000913          	li	s2,0
    1044:	fd842983          	lw	s3,-40(s0)
    1048:	00c0006f          	j	1054 <qprints+0x54>
    104c:	00190913          	addi	s2,s2,1
    1050:	00198993          	addi	s3,s3,1
    1054:	0009c783          	lbu	a5,0(s3)
    1058:	fe079ae3          	bnez	a5,104c <qprints+0x4c>
    105c:	fd442783          	lw	a5,-44(s0)
    1060:	00f94663          	blt	s2,a5,106c <qprints+0x6c>
    1064:	fc042a23          	sw	zero,-44(s0)
    1068:	0100006f          	j	1078 <qprints+0x78>
    106c:	fd442783          	lw	a5,-44(s0)
    1070:	412787b3          	sub	a5,a5,s2
    1074:	fcf42a23          	sw	a5,-44(s0)
    1078:	fd042783          	lw	a5,-48(s0)
    107c:	0027f793          	andi	a5,a5,2
    1080:	00078463          	beqz	a5,1088 <qprints+0x88>
    1084:	03000a13          	li	s4,48
    1088:	fd042783          	lw	a5,-48(s0)
    108c:	0017f793          	andi	a5,a5,1
    1090:	04079a63          	bnez	a5,10e4 <qprints+0xe4>
    1094:	0200006f          	j	10b4 <qprints+0xb4>
    1098:	000a0593          	mv	a1,s4
    109c:	fdc42503          	lw	a0,-36(s0)
    10a0:	ef1ff0ef          	jal	ra,f90 <qprintchar>
    10a4:	00148493          	addi	s1,s1,1
    10a8:	fd442783          	lw	a5,-44(s0)
    10ac:	fff78793          	addi	a5,a5,-1
    10b0:	fcf42a23          	sw	a5,-44(s0)
    10b4:	fd442783          	lw	a5,-44(s0)
    10b8:	fef040e3          	bgtz	a5,1098 <qprints+0x98>
    10bc:	0280006f          	j	10e4 <qprints+0xe4>
    10c0:	fd842783          	lw	a5,-40(s0)
    10c4:	0007c783          	lbu	a5,0(a5)
    10c8:	00078593          	mv	a1,a5
    10cc:	fdc42503          	lw	a0,-36(s0)
    10d0:	ec1ff0ef          	jal	ra,f90 <qprintchar>
    10d4:	00148493          	addi	s1,s1,1
    10d8:	fd842783          	lw	a5,-40(s0)
    10dc:	00178793          	addi	a5,a5,1
    10e0:	fcf42c23          	sw	a5,-40(s0)
    10e4:	fd842783          	lw	a5,-40(s0)
    10e8:	0007c783          	lbu	a5,0(a5)
    10ec:	fc079ae3          	bnez	a5,10c0 <qprints+0xc0>
    10f0:	0200006f          	j	1110 <qprints+0x110>
    10f4:	000a0593          	mv	a1,s4
    10f8:	fdc42503          	lw	a0,-36(s0)
    10fc:	e95ff0ef          	jal	ra,f90 <qprintchar>
    1100:	00148493          	addi	s1,s1,1
    1104:	fd442783          	lw	a5,-44(s0)
    1108:	fff78793          	addi	a5,a5,-1
    110c:	fcf42a23          	sw	a5,-44(s0)
    1110:	fd442783          	lw	a5,-44(s0)
    1114:	fef040e3          	bgtz	a5,10f4 <qprints+0xf4>
    1118:	00048793          	mv	a5,s1
    111c:	00078513          	mv	a0,a5
    1120:	02c12083          	lw	ra,44(sp)
    1124:	02812403          	lw	s0,40(sp)
    1128:	02412483          	lw	s1,36(sp)
    112c:	02012903          	lw	s2,32(sp)
    1130:	01c12983          	lw	s3,28(sp)
    1134:	01812a03          	lw	s4,24(sp)
    1138:	03010113          	addi	sp,sp,48
    113c:	00008067          	ret

00001140 <qprinti>:
    1140:	f9010113          	addi	sp,sp,-112
    1144:	06112623          	sw	ra,108(sp)
    1148:	06812423          	sw	s0,104(sp)
    114c:	06912223          	sw	s1,100(sp)
    1150:	07212023          	sw	s2,96(sp)
    1154:	05312e23          	sw	s3,92(sp)
    1158:	07010413          	addi	s0,sp,112
    115c:	faa42623          	sw	a0,-84(s0)
    1160:	fab42423          	sw	a1,-88(s0)
    1164:	fac42223          	sw	a2,-92(s0)
    1168:	fad42023          	sw	a3,-96(s0)
    116c:	f8e42e23          	sw	a4,-100(s0)
    1170:	f8f42c23          	sw	a5,-104(s0)
    1174:	00080793          	mv	a5,a6
    1178:	f8f40ba3          	sb	a5,-105(s0)
    117c:	00000993          	li	s3,0
    1180:	00000913          	li	s2,0
    1184:	fa842783          	lw	a5,-88(s0)
    1188:	fcf42e23          	sw	a5,-36(s0)
    118c:	fa842783          	lw	a5,-88(s0)
    1190:	02079863          	bnez	a5,11c0 <qprinti+0x80>
    1194:	03000793          	li	a5,48
    1198:	faf40c23          	sb	a5,-72(s0)
    119c:	fa040ca3          	sb	zero,-71(s0)
    11a0:	fb840793          	addi	a5,s0,-72
    11a4:	f9842683          	lw	a3,-104(s0)
    11a8:	f9c42603          	lw	a2,-100(s0)
    11ac:	00078593          	mv	a1,a5
    11b0:	fac42503          	lw	a0,-84(s0)
    11b4:	e4dff0ef          	jal	ra,1000 <qprints>
    11b8:	00050793          	mv	a5,a0
    11bc:	13c0006f          	j	12f8 <qprinti+0x1b8>
    11c0:	fa042783          	lw	a5,-96(s0)
    11c4:	02078463          	beqz	a5,11ec <qprinti+0xac>
    11c8:	fa442703          	lw	a4,-92(s0)
    11cc:	00a00793          	li	a5,10
    11d0:	00f71e63          	bne	a4,a5,11ec <qprinti+0xac>
    11d4:	fa842783          	lw	a5,-88(s0)
    11d8:	0007da63          	bgez	a5,11ec <qprinti+0xac>
    11dc:	00100993          	li	s3,1
    11e0:	fa842783          	lw	a5,-88(s0)
    11e4:	40f007b3          	neg	a5,a5
    11e8:	fcf42e23          	sw	a5,-36(s0)
    11ec:	fb840493          	addi	s1,s0,-72
    11f0:	01f48493          	addi	s1,s1,31
    11f4:	00048023          	sb	zero,0(s1)
    11f8:	fa442703          	lw	a4,-92(s0)
    11fc:	01000793          	li	a5,16
    1200:	08f71863          	bne	a4,a5,1290 <qprinti+0x150>
    1204:	0540006f          	j	1258 <qprinti+0x118>
    1208:	fdc42783          	lw	a5,-36(s0)
    120c:	00f7f793          	andi	a5,a5,15
    1210:	fcf42c23          	sw	a5,-40(s0)
    1214:	fd842703          	lw	a4,-40(s0)
    1218:	00900793          	li	a5,9
    121c:	00e7dc63          	bge	a5,a4,1234 <qprinti+0xf4>
    1220:	f9744783          	lbu	a5,-105(s0)
    1224:	fc678793          	addi	a5,a5,-58
    1228:	fd842703          	lw	a4,-40(s0)
    122c:	00f707b3          	add	a5,a4,a5
    1230:	fcf42c23          	sw	a5,-40(s0)
    1234:	fd842783          	lw	a5,-40(s0)
    1238:	0ff7f793          	andi	a5,a5,255
    123c:	fff48493          	addi	s1,s1,-1
    1240:	03078793          	addi	a5,a5,48
    1244:	0ff7f793          	andi	a5,a5,255
    1248:	00f48023          	sb	a5,0(s1)
    124c:	fdc42783          	lw	a5,-36(s0)
    1250:	0047d793          	srli	a5,a5,0x4
    1254:	fcf42e23          	sw	a5,-36(s0)
    1258:	fdc42783          	lw	a5,-36(s0)
    125c:	fa0796e3          	bnez	a5,1208 <qprinti+0xc8>
    1260:	0380006f          	j	1298 <qprinti+0x158>
    1264:	fdc42503          	lw	a0,-36(s0)
    1268:	c89ff0ef          	jal	ra,ef0 <remu10>
    126c:	00050793          	mv	a5,a0
    1270:	0ff7f793          	andi	a5,a5,255
    1274:	fff48493          	addi	s1,s1,-1
    1278:	03078793          	addi	a5,a5,48
    127c:	0ff7f793          	andi	a5,a5,255
    1280:	00f48023          	sb	a5,0(s1)
    1284:	fdc42503          	lw	a0,-36(s0)
    1288:	bb1ff0ef          	jal	ra,e38 <divu10>
    128c:	fca42e23          	sw	a0,-36(s0)
    1290:	fdc42783          	lw	a5,-36(s0)
    1294:	fc0798e3          	bnez	a5,1264 <qprinti+0x124>
    1298:	04098263          	beqz	s3,12dc <qprinti+0x19c>
    129c:	f9c42783          	lw	a5,-100(s0)
    12a0:	02078863          	beqz	a5,12d0 <qprinti+0x190>
    12a4:	f9842783          	lw	a5,-104(s0)
    12a8:	0027f793          	andi	a5,a5,2
    12ac:	02078263          	beqz	a5,12d0 <qprinti+0x190>
    12b0:	02d00593          	li	a1,45
    12b4:	fac42503          	lw	a0,-84(s0)
    12b8:	cd9ff0ef          	jal	ra,f90 <qprintchar>
    12bc:	00190913          	addi	s2,s2,1
    12c0:	f9c42783          	lw	a5,-100(s0)
    12c4:	fff78793          	addi	a5,a5,-1
    12c8:	f8f42e23          	sw	a5,-100(s0)
    12cc:	0100006f          	j	12dc <qprinti+0x19c>
    12d0:	fff48493          	addi	s1,s1,-1
    12d4:	02d00793          	li	a5,45
    12d8:	00f48023          	sb	a5,0(s1)
    12dc:	f9842683          	lw	a3,-104(s0)
    12e0:	f9c42603          	lw	a2,-100(s0)
    12e4:	00048593          	mv	a1,s1
    12e8:	fac42503          	lw	a0,-84(s0)
    12ec:	d15ff0ef          	jal	ra,1000 <qprints>
    12f0:	00050793          	mv	a5,a0
    12f4:	00f907b3          	add	a5,s2,a5
    12f8:	00078513          	mv	a0,a5
    12fc:	06c12083          	lw	ra,108(sp)
    1300:	06812403          	lw	s0,104(sp)
    1304:	06412483          	lw	s1,100(sp)
    1308:	06012903          	lw	s2,96(sp)
    130c:	05c12983          	lw	s3,92(sp)
    1310:	07010113          	addi	sp,sp,112
    1314:	00008067          	ret

00001318 <qprint>:
    1318:	fc010113          	addi	sp,sp,-64
    131c:	02112e23          	sw	ra,60(sp)
    1320:	02812c23          	sw	s0,56(sp)
    1324:	02912a23          	sw	s1,52(sp)
    1328:	03212823          	sw	s2,48(sp)
    132c:	03312623          	sw	s3,44(sp)
    1330:	04010413          	addi	s0,sp,64
    1334:	fca42623          	sw	a0,-52(s0)
    1338:	fcb42423          	sw	a1,-56(s0)
    133c:	fcc42223          	sw	a2,-60(s0)
    1340:	00000493          	li	s1,0
    1344:	2dc0006f          	j	1620 <qprint+0x308>
    1348:	fc842783          	lw	a5,-56(s0)
    134c:	0007c703          	lbu	a4,0(a5)
    1350:	02500793          	li	a5,37
    1354:	28f71e63          	bne	a4,a5,15f0 <qprint+0x2d8>
    1358:	fc842783          	lw	a5,-56(s0)
    135c:	00178793          	addi	a5,a5,1
    1360:	fcf42423          	sw	a5,-56(s0)
    1364:	00000993          	li	s3,0
    1368:	00098913          	mv	s2,s3
    136c:	fc842783          	lw	a5,-56(s0)
    1370:	0007c783          	lbu	a5,0(a5)
    1374:	2a078e63          	beqz	a5,1630 <qprint+0x318>
    1378:	fc842783          	lw	a5,-56(s0)
    137c:	0007c703          	lbu	a4,0(a5)
    1380:	02500793          	li	a5,37
    1384:	26f70a63          	beq	a4,a5,15f8 <qprint+0x2e0>
    1388:	fc842783          	lw	a5,-56(s0)
    138c:	0007c703          	lbu	a4,0(a5)
    1390:	02d00793          	li	a5,45
    1394:	02f71463          	bne	a4,a5,13bc <qprint+0xa4>
    1398:	fc842783          	lw	a5,-56(s0)
    139c:	00178793          	addi	a5,a5,1
    13a0:	fcf42423          	sw	a5,-56(s0)
    13a4:	00100993          	li	s3,1
    13a8:	0140006f          	j	13bc <qprint+0xa4>
    13ac:	fc842783          	lw	a5,-56(s0)
    13b0:	00178793          	addi	a5,a5,1
    13b4:	fcf42423          	sw	a5,-56(s0)
    13b8:	0029e993          	ori	s3,s3,2
    13bc:	fc842783          	lw	a5,-56(s0)
    13c0:	0007c703          	lbu	a4,0(a5)
    13c4:	03000793          	li	a5,48
    13c8:	fef702e3          	beq	a4,a5,13ac <qprint+0x94>
    13cc:	0340006f          	j	1400 <qprint+0xe8>
    13d0:	00090793          	mv	a5,s2
    13d4:	00279793          	slli	a5,a5,0x2
    13d8:	012787b3          	add	a5,a5,s2
    13dc:	00179793          	slli	a5,a5,0x1
    13e0:	00078913          	mv	s2,a5
    13e4:	fc842783          	lw	a5,-56(s0)
    13e8:	0007c783          	lbu	a5,0(a5)
    13ec:	fd078793          	addi	a5,a5,-48
    13f0:	00f90933          	add	s2,s2,a5
    13f4:	fc842783          	lw	a5,-56(s0)
    13f8:	00178793          	addi	a5,a5,1
    13fc:	fcf42423          	sw	a5,-56(s0)
    1400:	fc842783          	lw	a5,-56(s0)
    1404:	0007c703          	lbu	a4,0(a5)
    1408:	02f00793          	li	a5,47
    140c:	00e7fa63          	bgeu	a5,a4,1420 <qprint+0x108>
    1410:	fc842783          	lw	a5,-56(s0)
    1414:	0007c703          	lbu	a4,0(a5)
    1418:	03900793          	li	a5,57
    141c:	fae7fae3          	bgeu	a5,a4,13d0 <qprint+0xb8>
    1420:	fc842783          	lw	a5,-56(s0)
    1424:	0007c703          	lbu	a4,0(a5)
    1428:	07300793          	li	a5,115
    142c:	04f71463          	bne	a4,a5,1474 <qprint+0x15c>
    1430:	fc442783          	lw	a5,-60(s0)
    1434:	00478713          	addi	a4,a5,4
    1438:	fce42223          	sw	a4,-60(s0)
    143c:	0007a083          	lw	ra,0(a5)
    1440:	00008663          	beqz	ra,144c <qprint+0x134>
    1444:	00008793          	mv	a5,ra
    1448:	00c0006f          	j	1454 <qprint+0x13c>
    144c:	001007b7          	lui	a5,0x100
    1450:	0ec78793          	addi	a5,a5,236 # 1000ec <numchar+0xec>
    1454:	00098693          	mv	a3,s3
    1458:	00090613          	mv	a2,s2
    145c:	00078593          	mv	a1,a5
    1460:	fcc42503          	lw	a0,-52(s0)
    1464:	b9dff0ef          	jal	ra,1000 <qprints>
    1468:	00050793          	mv	a5,a0
    146c:	00f484b3          	add	s1,s1,a5
    1470:	1a40006f          	j	1614 <qprint+0x2fc>
    1474:	fc842783          	lw	a5,-56(s0)
    1478:	0007c703          	lbu	a4,0(a5)
    147c:	06400793          	li	a5,100
    1480:	02f71e63          	bne	a4,a5,14bc <qprint+0x1a4>
    1484:	fc442783          	lw	a5,-60(s0)
    1488:	00478713          	addi	a4,a5,4
    148c:	fce42223          	sw	a4,-60(s0)
    1490:	0007a583          	lw	a1,0(a5)
    1494:	06100813          	li	a6,97
    1498:	00098793          	mv	a5,s3
    149c:	00090713          	mv	a4,s2
    14a0:	00100693          	li	a3,1
    14a4:	00a00613          	li	a2,10
    14a8:	fcc42503          	lw	a0,-52(s0)
    14ac:	c95ff0ef          	jal	ra,1140 <qprinti>
    14b0:	00050793          	mv	a5,a0
    14b4:	00f484b3          	add	s1,s1,a5
    14b8:	15c0006f          	j	1614 <qprint+0x2fc>
    14bc:	fc842783          	lw	a5,-56(s0)
    14c0:	0007c703          	lbu	a4,0(a5)
    14c4:	07500793          	li	a5,117
    14c8:	04f71063          	bne	a4,a5,1508 <qprint+0x1f0>
    14cc:	fc442783          	lw	a5,-60(s0)
    14d0:	00478713          	addi	a4,a5,4
    14d4:	fce42223          	sw	a4,-60(s0)
    14d8:	0007a783          	lw	a5,0(a5)
    14dc:	00078593          	mv	a1,a5
    14e0:	06100813          	li	a6,97
    14e4:	00098793          	mv	a5,s3
    14e8:	00090713          	mv	a4,s2
    14ec:	00000693          	li	a3,0
    14f0:	00a00613          	li	a2,10
    14f4:	fcc42503          	lw	a0,-52(s0)
    14f8:	c49ff0ef          	jal	ra,1140 <qprinti>
    14fc:	00050793          	mv	a5,a0
    1500:	00f484b3          	add	s1,s1,a5
    1504:	1100006f          	j	1614 <qprint+0x2fc>
    1508:	fc842783          	lw	a5,-56(s0)
    150c:	0007c703          	lbu	a4,0(a5)
    1510:	07800793          	li	a5,120
    1514:	04f71063          	bne	a4,a5,1554 <qprint+0x23c>
    1518:	fc442783          	lw	a5,-60(s0)
    151c:	00478713          	addi	a4,a5,4
    1520:	fce42223          	sw	a4,-60(s0)
    1524:	0007a783          	lw	a5,0(a5)
    1528:	00078593          	mv	a1,a5
    152c:	06100813          	li	a6,97
    1530:	00098793          	mv	a5,s3
    1534:	00090713          	mv	a4,s2
    1538:	00000693          	li	a3,0
    153c:	01000613          	li	a2,16
    1540:	fcc42503          	lw	a0,-52(s0)
    1544:	bfdff0ef          	jal	ra,1140 <qprinti>
    1548:	00050793          	mv	a5,a0
    154c:	00f484b3          	add	s1,s1,a5
    1550:	0c40006f          	j	1614 <qprint+0x2fc>
    1554:	fc842783          	lw	a5,-56(s0)
    1558:	0007c703          	lbu	a4,0(a5)
    155c:	05800793          	li	a5,88
    1560:	04f71063          	bne	a4,a5,15a0 <qprint+0x288>
    1564:	fc442783          	lw	a5,-60(s0)
    1568:	00478713          	addi	a4,a5,4
    156c:	fce42223          	sw	a4,-60(s0)
    1570:	0007a783          	lw	a5,0(a5)
    1574:	00078593          	mv	a1,a5
    1578:	04100813          	li	a6,65
    157c:	00098793          	mv	a5,s3
    1580:	00090713          	mv	a4,s2
    1584:	00000693          	li	a3,0
    1588:	01000613          	li	a2,16
    158c:	fcc42503          	lw	a0,-52(s0)
    1590:	bb1ff0ef          	jal	ra,1140 <qprinti>
    1594:	00050793          	mv	a5,a0
    1598:	00f484b3          	add	s1,s1,a5
    159c:	0780006f          	j	1614 <qprint+0x2fc>
    15a0:	fc842783          	lw	a5,-56(s0)
    15a4:	0007c703          	lbu	a4,0(a5)
    15a8:	06300793          	li	a5,99
    15ac:	06f71463          	bne	a4,a5,1614 <qprint+0x2fc>
    15b0:	fc442783          	lw	a5,-60(s0)
    15b4:	00478713          	addi	a4,a5,4
    15b8:	fce42223          	sw	a4,-60(s0)
    15bc:	0007a783          	lw	a5,0(a5)
    15c0:	0ff7f793          	andi	a5,a5,255
    15c4:	fcf40e23          	sb	a5,-36(s0)
    15c8:	fc040ea3          	sb	zero,-35(s0)
    15cc:	fdc40793          	addi	a5,s0,-36
    15d0:	00098693          	mv	a3,s3
    15d4:	00090613          	mv	a2,s2
    15d8:	00078593          	mv	a1,a5
    15dc:	fcc42503          	lw	a0,-52(s0)
    15e0:	a21ff0ef          	jal	ra,1000 <qprints>
    15e4:	00050793          	mv	a5,a0
    15e8:	00f484b3          	add	s1,s1,a5
    15ec:	0280006f          	j	1614 <qprint+0x2fc>
    15f0:	00000013          	nop
    15f4:	0080006f          	j	15fc <qprint+0x2e4>
    15f8:	00000013          	nop
    15fc:	fc842783          	lw	a5,-56(s0)
    1600:	0007c783          	lbu	a5,0(a5)
    1604:	00078593          	mv	a1,a5
    1608:	fcc42503          	lw	a0,-52(s0)
    160c:	985ff0ef          	jal	ra,f90 <qprintchar>
    1610:	00148493          	addi	s1,s1,1
    1614:	fc842783          	lw	a5,-56(s0)
    1618:	00178793          	addi	a5,a5,1
    161c:	fcf42423          	sw	a5,-56(s0)
    1620:	fc842783          	lw	a5,-56(s0)
    1624:	0007c783          	lbu	a5,0(a5)
    1628:	d20790e3          	bnez	a5,1348 <qprint+0x30>
    162c:	0080006f          	j	1634 <qprint+0x31c>
    1630:	00000013          	nop
    1634:	fcc42783          	lw	a5,-52(s0)
    1638:	00078863          	beqz	a5,1648 <qprint+0x330>
    163c:	fcc42783          	lw	a5,-52(s0)
    1640:	0007a783          	lw	a5,0(a5)
    1644:	00078023          	sb	zero,0(a5)
    1648:	00048793          	mv	a5,s1
    164c:	00078513          	mv	a0,a5
    1650:	03c12083          	lw	ra,60(sp)
    1654:	03812403          	lw	s0,56(sp)
    1658:	03412483          	lw	s1,52(sp)
    165c:	03012903          	lw	s2,48(sp)
    1660:	02c12983          	lw	s3,44(sp)
    1664:	04010113          	addi	sp,sp,64
    1668:	00008067          	ret

0000166c <printf>:
    166c:	fb010113          	addi	sp,sp,-80
    1670:	02112623          	sw	ra,44(sp)
    1674:	02812423          	sw	s0,40(sp)
    1678:	03010413          	addi	s0,sp,48
    167c:	fca42e23          	sw	a0,-36(s0)
    1680:	00b42223          	sw	a1,4(s0)
    1684:	00c42423          	sw	a2,8(s0)
    1688:	00d42623          	sw	a3,12(s0)
    168c:	00e42823          	sw	a4,16(s0)
    1690:	00f42a23          	sw	a5,20(s0)
    1694:	01042c23          	sw	a6,24(s0)
    1698:	01142e23          	sw	a7,28(s0)
    169c:	02040793          	addi	a5,s0,32
    16a0:	fcf42c23          	sw	a5,-40(s0)
    16a4:	fd842783          	lw	a5,-40(s0)
    16a8:	fe478793          	addi	a5,a5,-28
    16ac:	fef42423          	sw	a5,-24(s0)
    16b0:	fe842783          	lw	a5,-24(s0)
    16b4:	00078613          	mv	a2,a5
    16b8:	fdc42583          	lw	a1,-36(s0)
    16bc:	00000513          	li	a0,0
    16c0:	c59ff0ef          	jal	ra,1318 <qprint>
    16c4:	fea42623          	sw	a0,-20(s0)
    16c8:	fec42783          	lw	a5,-20(s0)
    16cc:	00078513          	mv	a0,a5
    16d0:	02c12083          	lw	ra,44(sp)
    16d4:	02812403          	lw	s0,40(sp)
    16d8:	05010113          	addi	sp,sp,80
    16dc:	00008067          	ret

000016e0 <puts>:
    16e0:	fd010113          	addi	sp,sp,-48
    16e4:	02112623          	sw	ra,44(sp)
    16e8:	02812423          	sw	s0,40(sp)
    16ec:	03010413          	addi	s0,sp,48
    16f0:	fca42e23          	sw	a0,-36(s0)
    16f4:	fe042623          	sw	zero,-20(s0)
    16f8:	0280006f          	j	1720 <puts+0x40>
    16fc:	fec42783          	lw	a5,-20(s0)
    1700:	00178713          	addi	a4,a5,1
    1704:	fee42623          	sw	a4,-20(s0)
    1708:	00078713          	mv	a4,a5
    170c:	fdc42783          	lw	a5,-36(s0)
    1710:	00e787b3          	add	a5,a5,a4
    1714:	0007c783          	lbu	a5,0(a5)
    1718:	00078513          	mv	a0,a5
    171c:	839ff0ef          	jal	ra,f54 <putchar>
    1720:	fec42783          	lw	a5,-20(s0)
    1724:	fdc42703          	lw	a4,-36(s0)
    1728:	00f707b3          	add	a5,a4,a5
    172c:	0007c783          	lbu	a5,0(a5)
    1730:	fc0796e3          	bnez	a5,16fc <puts+0x1c>
    1734:	00a00513          	li	a0,10
    1738:	81dff0ef          	jal	ra,f54 <putchar>
    173c:	fec42783          	lw	a5,-20(s0)
    1740:	00078513          	mv	a0,a5
    1744:	02c12083          	lw	ra,44(sp)
    1748:	02812403          	lw	s0,40(sp)
    174c:	03010113          	addi	sp,sp,48
    1750:	00008067          	ret

00001754 <strcmp>:
    1754:	fd010113          	addi	sp,sp,-48
    1758:	02812623          	sw	s0,44(sp)
    175c:	03010413          	addi	s0,sp,48
    1760:	fca42e23          	sw	a0,-36(s0)
    1764:	fcb42c23          	sw	a1,-40(s0)
    1768:	fdc42703          	lw	a4,-36(s0)
    176c:	fd842783          	lw	a5,-40(s0)
    1770:	00f767b3          	or	a5,a4,a5
    1774:	0037f793          	andi	a5,a5,3
    1778:	0a079663          	bnez	a5,1824 <strcmp+0xd0>
    177c:	fdc42783          	lw	a5,-36(s0)
    1780:	fef42623          	sw	a5,-20(s0)
    1784:	fd842783          	lw	a5,-40(s0)
    1788:	fef42423          	sw	a5,-24(s0)
    178c:	0580006f          	j	17e4 <strcmp+0x90>
    1790:	fec42783          	lw	a5,-20(s0)
    1794:	0007a703          	lw	a4,0(a5)
    1798:	feff07b7          	lui	a5,0xfeff0
    179c:	eff78793          	addi	a5,a5,-257 # fefefeff <_stack+0xfeeebeff>
    17a0:	00f70733          	add	a4,a4,a5
    17a4:	fec42783          	lw	a5,-20(s0)
    17a8:	0007a783          	lw	a5,0(a5)
    17ac:	fff7c793          	not	a5,a5
    17b0:	00f77733          	and	a4,a4,a5
    17b4:	808087b7          	lui	a5,0x80808
    17b8:	08078793          	addi	a5,a5,128 # 80808080 <_stack+0x80704080>
    17bc:	00f777b3          	and	a5,a4,a5
    17c0:	00078663          	beqz	a5,17cc <strcmp+0x78>
    17c4:	00000793          	li	a5,0
    17c8:	0940006f          	j	185c <strcmp+0x108>
    17cc:	fec42783          	lw	a5,-20(s0)
    17d0:	00478793          	addi	a5,a5,4
    17d4:	fef42623          	sw	a5,-20(s0)
    17d8:	fe842783          	lw	a5,-24(s0)
    17dc:	00478793          	addi	a5,a5,4
    17e0:	fef42423          	sw	a5,-24(s0)
    17e4:	fec42783          	lw	a5,-20(s0)
    17e8:	0007a703          	lw	a4,0(a5)
    17ec:	fe842783          	lw	a5,-24(s0)
    17f0:	0007a783          	lw	a5,0(a5)
    17f4:	f8f70ee3          	beq	a4,a5,1790 <strcmp+0x3c>
    17f8:	fec42783          	lw	a5,-20(s0)
    17fc:	fcf42e23          	sw	a5,-36(s0)
    1800:	fe842783          	lw	a5,-24(s0)
    1804:	fcf42c23          	sw	a5,-40(s0)
    1808:	01c0006f          	j	1824 <strcmp+0xd0>
    180c:	fdc42783          	lw	a5,-36(s0)
    1810:	00178793          	addi	a5,a5,1
    1814:	fcf42e23          	sw	a5,-36(s0)
    1818:	fd842783          	lw	a5,-40(s0)
    181c:	00178793          	addi	a5,a5,1
    1820:	fcf42c23          	sw	a5,-40(s0)
    1824:	fdc42783          	lw	a5,-36(s0)
    1828:	0007c783          	lbu	a5,0(a5)
    182c:	00078c63          	beqz	a5,1844 <strcmp+0xf0>
    1830:	fdc42783          	lw	a5,-36(s0)
    1834:	0007c703          	lbu	a4,0(a5)
    1838:	fd842783          	lw	a5,-40(s0)
    183c:	0007c783          	lbu	a5,0(a5)
    1840:	fcf706e3          	beq	a4,a5,180c <strcmp+0xb8>
    1844:	fdc42783          	lw	a5,-36(s0)
    1848:	0007c783          	lbu	a5,0(a5)
    184c:	00078713          	mv	a4,a5
    1850:	fd842783          	lw	a5,-40(s0)
    1854:	0007c783          	lbu	a5,0(a5)
    1858:	40f707b3          	sub	a5,a4,a5
    185c:	00078513          	mv	a0,a5
    1860:	02c12403          	lw	s0,44(sp)
    1864:	03010113          	addi	sp,sp,48
    1868:	00008067          	ret

0000186c <memset>:
    186c:	fd010113          	addi	sp,sp,-48
    1870:	02812623          	sw	s0,44(sp)
    1874:	03010413          	addi	s0,sp,48
    1878:	fca42e23          	sw	a0,-36(s0)
    187c:	fcb42c23          	sw	a1,-40(s0)
    1880:	fcc42a23          	sw	a2,-44(s0)
    1884:	fdc42783          	lw	a5,-36(s0)
    1888:	fef42623          	sw	a5,-20(s0)
    188c:	0280006f          	j	18b4 <memset+0x48>
    1890:	fec42783          	lw	a5,-20(s0)
    1894:	00178713          	addi	a4,a5,1
    1898:	fee42623          	sw	a4,-20(s0)
    189c:	fd842703          	lw	a4,-40(s0)
    18a0:	0ff77713          	andi	a4,a4,255
    18a4:	00e78023          	sb	a4,0(a5)
    18a8:	fd442783          	lw	a5,-44(s0)
    18ac:	fff78793          	addi	a5,a5,-1
    18b0:	fcf42a23          	sw	a5,-44(s0)
    18b4:	fd442783          	lw	a5,-44(s0)
    18b8:	fc079ce3          	bnez	a5,1890 <memset+0x24>
    18bc:	fdc42783          	lw	a5,-36(s0)
    18c0:	00078513          	mv	a0,a5
    18c4:	02c12403          	lw	s0,44(sp)
    18c8:	03010113          	addi	sp,sp,48
    18cc:	00008067          	ret

000018d0 <strcpy>:
    18d0:	fd010113          	addi	sp,sp,-48
    18d4:	02812623          	sw	s0,44(sp)
    18d8:	03010413          	addi	s0,sp,48
    18dc:	fca42e23          	sw	a0,-36(s0)
    18e0:	fcb42c23          	sw	a1,-40(s0)
    18e4:	fdc42783          	lw	a5,-36(s0)
    18e8:	fef42623          	sw	a5,-20(s0)
    18ec:	fd842783          	lw	a5,-40(s0)
    18f0:	fef42423          	sw	a5,-24(s0)
    18f4:	02c0006f          	j	1920 <strcpy+0x50>
    18f8:	fe842783          	lw	a5,-24(s0)
    18fc:	0007c703          	lbu	a4,0(a5)
    1900:	fec42783          	lw	a5,-20(s0)
    1904:	00e78023          	sb	a4,0(a5)
    1908:	fec42783          	lw	a5,-20(s0)
    190c:	00178793          	addi	a5,a5,1
    1910:	fef42623          	sw	a5,-20(s0)
    1914:	fe842783          	lw	a5,-24(s0)
    1918:	00178793          	addi	a5,a5,1
    191c:	fef42423          	sw	a5,-24(s0)
    1920:	fe842783          	lw	a5,-24(s0)
    1924:	0007c783          	lbu	a5,0(a5)
    1928:	fc0798e3          	bnez	a5,18f8 <strcpy+0x28>
    192c:	fdc42783          	lw	a5,-36(s0)
    1930:	00078513          	mv	a0,a5
    1934:	02c12403          	lw	s0,44(sp)
    1938:	03010113          	addi	sp,sp,48
    193c:	00008067          	ret

00001940 <strlen>:
    1940:	fd010113          	addi	sp,sp,-48
    1944:	02812623          	sw	s0,44(sp)
    1948:	03010413          	addi	s0,sp,48
    194c:	fca42e23          	sw	a0,-36(s0)
    1950:	fdc42783          	lw	a5,-36(s0)
    1954:	fef42623          	sw	a5,-20(s0)
    1958:	fe042423          	sw	zero,-24(s0)
    195c:	fec42783          	lw	a5,-20(s0)
    1960:	00079c63          	bnez	a5,1978 <strlen+0x38>
    1964:	00000793          	li	a5,0
    1968:	0280006f          	j	1990 <strlen+0x50>
    196c:	fe842783          	lw	a5,-24(s0)
    1970:	00178793          	addi	a5,a5,1
    1974:	fef42423          	sw	a5,-24(s0)
    1978:	fec42783          	lw	a5,-20(s0)
    197c:	00178713          	addi	a4,a5,1
    1980:	fee42623          	sw	a4,-20(s0)
    1984:	0007c783          	lbu	a5,0(a5)
    1988:	fe0792e3          	bnez	a5,196c <strlen+0x2c>
    198c:	fe842783          	lw	a5,-24(s0)
    1990:	00078513          	mv	a0,a5
    1994:	02c12403          	lw	s0,44(sp)
    1998:	03010113          	addi	sp,sp,48
    199c:	00008067          	ret

000019a0 <spi_setup_slave>:
    19a0:	ff010113          	addi	sp,sp,-16
    19a4:	00112623          	sw	ra,12(sp)
    19a8:	00812423          	sw	s0,8(sp)
    19ac:	01010413          	addi	s0,sp,16
    19b0:	00000593          	li	a1,0
    19b4:	00400513          	li	a0,4
    19b8:	91dfe0ef          	jal	ra,2d4 <set_pin_function>
    19bc:	00000593          	li	a1,0
    19c0:	00500513          	li	a0,5
    19c4:	911fe0ef          	jal	ra,2d4 <set_pin_function>
    19c8:	00000593          	li	a1,0
    19cc:	00600513          	li	a0,6
    19d0:	905fe0ef          	jal	ra,2d4 <set_pin_function>
    19d4:	00000593          	li	a1,0
    19d8:	00700513          	li	a0,7
    19dc:	8f9fe0ef          	jal	ra,2d4 <set_pin_function>
    19e0:	00000593          	li	a1,0
    19e4:	00300513          	li	a0,3
    19e8:	8edfe0ef          	jal	ra,2d4 <set_pin_function>
    19ec:	00000013          	nop
    19f0:	00c12083          	lw	ra,12(sp)
    19f4:	00812403          	lw	s0,8(sp)
    19f8:	01010113          	addi	sp,sp,16
    19fc:	00008067          	ret

00001a00 <spi_setup_master>:
    1a00:	fe010113          	addi	sp,sp,-32
    1a04:	00112e23          	sw	ra,28(sp)
    1a08:	00812c23          	sw	s0,24(sp)
    1a0c:	02010413          	addi	s0,sp,32
    1a10:	fea42623          	sw	a0,-20(s0)
    1a14:	00000593          	li	a1,0
    1a18:	00f00513          	li	a0,15
    1a1c:	8b9fe0ef          	jal	ra,2d4 <set_pin_function>
    1a20:	00000593          	li	a1,0
    1a24:	00e00513          	li	a0,14
    1a28:	8adfe0ef          	jal	ra,2d4 <set_pin_function>
    1a2c:	00000593          	li	a1,0
    1a30:	00d00513          	li	a0,13
    1a34:	8a1fe0ef          	jal	ra,2d4 <set_pin_function>
    1a38:	00000593          	li	a1,0
    1a3c:	00c00513          	li	a0,12
    1a40:	895fe0ef          	jal	ra,2d4 <set_pin_function>
    1a44:	fec42783          	lw	a5,-20(s0)
    1a48:	00f05863          	blez	a5,1a58 <spi_setup_master+0x58>
    1a4c:	00000593          	li	a1,0
    1a50:	01000513          	li	a0,16
    1a54:	881fe0ef          	jal	ra,2d4 <set_pin_function>
    1a58:	fec42703          	lw	a4,-20(s0)
    1a5c:	00100793          	li	a5,1
    1a60:	00e7d863          	bge	a5,a4,1a70 <spi_setup_master+0x70>
    1a64:	00000593          	li	a1,0
    1a68:	00b00513          	li	a0,11
    1a6c:	869fe0ef          	jal	ra,2d4 <set_pin_function>
    1a70:	fec42703          	lw	a4,-20(s0)
    1a74:	00200793          	li	a5,2
    1a78:	00e7d863          	bge	a5,a4,1a88 <spi_setup_master+0x88>
    1a7c:	00000593          	li	a1,0
    1a80:	00000513          	li	a0,0
    1a84:	851fe0ef          	jal	ra,2d4 <set_pin_function>
    1a88:	fec42703          	lw	a4,-20(s0)
    1a8c:	00300793          	li	a5,3
    1a90:	00e7d863          	bge	a5,a4,1aa0 <spi_setup_master+0xa0>
    1a94:	00000593          	li	a1,0
    1a98:	00100513          	li	a0,1
    1a9c:	839fe0ef          	jal	ra,2d4 <set_pin_function>
    1aa0:	00000013          	nop
    1aa4:	01c12083          	lw	ra,28(sp)
    1aa8:	01812403          	lw	s0,24(sp)
    1aac:	02010113          	addi	sp,sp,32
    1ab0:	00008067          	ret

00001ab4 <spi_setup_cmd_addr>:
    1ab4:	fd010113          	addi	sp,sp,-48
    1ab8:	02812623          	sw	s0,44(sp)
    1abc:	03010413          	addi	s0,sp,48
    1ac0:	fca42e23          	sw	a0,-36(s0)
    1ac4:	fcb42c23          	sw	a1,-40(s0)
    1ac8:	fcc42a23          	sw	a2,-44(s0)
    1acc:	fcd42823          	sw	a3,-48(s0)
    1ad0:	02000713          	li	a4,32
    1ad4:	fd842783          	lw	a5,-40(s0)
    1ad8:	40f707b3          	sub	a5,a4,a5
    1adc:	fdc42703          	lw	a4,-36(s0)
    1ae0:	00f717b3          	sll	a5,a4,a5
    1ae4:	fef42623          	sw	a5,-20(s0)
    1ae8:	1a1027b7          	lui	a5,0x1a102
    1aec:	00878793          	addi	a5,a5,8 # 1a102008 <_stack+0x19ffe008>
    1af0:	fec42703          	lw	a4,-20(s0)
    1af4:	00e7a023          	sw	a4,0(a5)
    1af8:	1a1027b7          	lui	a5,0x1a102
    1afc:	00c78793          	addi	a5,a5,12 # 1a10200c <_stack+0x19ffe00c>
    1b00:	fd442703          	lw	a4,-44(s0)
    1b04:	00e7a023          	sw	a4,0(a5)
    1b08:	fd842783          	lw	a5,-40(s0)
    1b0c:	03f7f693          	andi	a3,a5,63
    1b10:	fd042783          	lw	a5,-48(s0)
    1b14:	00879713          	slli	a4,a5,0x8
    1b18:	000047b7          	lui	a5,0x4
    1b1c:	f0078793          	addi	a5,a5,-256 # 3f00 <__DTOR_END__+0x1c2c>
    1b20:	00f77733          	and	a4,a4,a5
    1b24:	1a1027b7          	lui	a5,0x1a102
    1b28:	01078793          	addi	a5,a5,16 # 1a102010 <_stack+0x19ffe010>
    1b2c:	00e6e733          	or	a4,a3,a4
    1b30:	00e7a023          	sw	a4,0(a5)
    1b34:	00000013          	nop
    1b38:	02c12403          	lw	s0,44(sp)
    1b3c:	03010113          	addi	sp,sp,48
    1b40:	00008067          	ret

00001b44 <spi_setup_dummy>:
    1b44:	fe010113          	addi	sp,sp,-32
    1b48:	00812e23          	sw	s0,28(sp)
    1b4c:	02010413          	addi	s0,sp,32
    1b50:	fea42623          	sw	a0,-20(s0)
    1b54:	feb42423          	sw	a1,-24(s0)
    1b58:	fe842783          	lw	a5,-24(s0)
    1b5c:	01079793          	slli	a5,a5,0x10
    1b60:	00078693          	mv	a3,a5
    1b64:	fec42703          	lw	a4,-20(s0)
    1b68:	000107b7          	lui	a5,0x10
    1b6c:	fff78793          	addi	a5,a5,-1 # ffff <__DTOR_END__+0xdd2b>
    1b70:	00f777b3          	and	a5,a4,a5
    1b74:	00f6e733          	or	a4,a3,a5
    1b78:	1a1027b7          	lui	a5,0x1a102
    1b7c:	01478793          	addi	a5,a5,20 # 1a102014 <_stack+0x19ffe014>
    1b80:	00e7a023          	sw	a4,0(a5)
    1b84:	00000013          	nop
    1b88:	01c12403          	lw	s0,28(sp)
    1b8c:	02010113          	addi	sp,sp,32
    1b90:	00008067          	ret

00001b94 <spi_set_datalen>:
    1b94:	fd010113          	addi	sp,sp,-48
    1b98:	02812623          	sw	s0,44(sp)
    1b9c:	03010413          	addi	s0,sp,48
    1ba0:	fca42e23          	sw	a0,-36(s0)
    1ba4:	1a1027b7          	lui	a5,0x1a102
    1ba8:	01078793          	addi	a5,a5,16 # 1a102010 <_stack+0x19ffe010>
    1bac:	0007a783          	lw	a5,0(a5)
    1bb0:	fef42623          	sw	a5,-20(s0)
    1bb4:	fdc42783          	lw	a5,-36(s0)
    1bb8:	01079793          	slli	a5,a5,0x10
    1bbc:	00078713          	mv	a4,a5
    1bc0:	fec42783          	lw	a5,-20(s0)
    1bc4:	00078693          	mv	a3,a5
    1bc8:	000107b7          	lui	a5,0x10
    1bcc:	fff78793          	addi	a5,a5,-1 # ffff <__DTOR_END__+0xdd2b>
    1bd0:	00f6f7b3          	and	a5,a3,a5
    1bd4:	00f767b3          	or	a5,a4,a5
    1bd8:	fef42623          	sw	a5,-20(s0)
    1bdc:	1a1027b7          	lui	a5,0x1a102
    1be0:	01078793          	addi	a5,a5,16 # 1a102010 <_stack+0x19ffe010>
    1be4:	fec42703          	lw	a4,-20(s0)
    1be8:	00e7a023          	sw	a4,0(a5)
    1bec:	00000013          	nop
    1bf0:	02c12403          	lw	s0,44(sp)
    1bf4:	03010113          	addi	sp,sp,48
    1bf8:	00008067          	ret

00001bfc <spi_start_transaction>:
    1bfc:	fe010113          	addi	sp,sp,-32
    1c00:	00812e23          	sw	s0,28(sp)
    1c04:	02010413          	addi	s0,sp,32
    1c08:	fea42623          	sw	a0,-20(s0)
    1c0c:	feb42423          	sw	a1,-24(s0)
    1c10:	fe842783          	lw	a5,-24(s0)
    1c14:	00878793          	addi	a5,a5,8
    1c18:	00100713          	li	a4,1
    1c1c:	00f71733          	sll	a4,a4,a5
    1c20:	000017b7          	lui	a5,0x1
    1c24:	f0078793          	addi	a5,a5,-256 # f00 <remu10+0x10>
    1c28:	00f776b3          	and	a3,a4,a5
    1c2c:	fec42783          	lw	a5,-20(s0)
    1c30:	00100713          	li	a4,1
    1c34:	00f717b3          	sll	a5,a4,a5
    1c38:	0ff7f713          	andi	a4,a5,255
    1c3c:	1a1027b7          	lui	a5,0x1a102
    1c40:	00e6e733          	or	a4,a3,a4
    1c44:	00e7a023          	sw	a4,0(a5) # 1a102000 <_stack+0x19ffe000>
    1c48:	00000013          	nop
    1c4c:	01c12403          	lw	s0,28(sp)
    1c50:	02010113          	addi	sp,sp,32
    1c54:	00008067          	ret

00001c58 <spi_get_status>:
    1c58:	fe010113          	addi	sp,sp,-32
    1c5c:	00812e23          	sw	s0,28(sp)
    1c60:	02010413          	addi	s0,sp,32
    1c64:	1a1027b7          	lui	a5,0x1a102
    1c68:	0007a783          	lw	a5,0(a5) # 1a102000 <_stack+0x19ffe000>
    1c6c:	fef42623          	sw	a5,-20(s0)
    1c70:	fec42783          	lw	a5,-20(s0)
    1c74:	00078513          	mv	a0,a5
    1c78:	01c12403          	lw	s0,28(sp)
    1c7c:	02010113          	addi	sp,sp,32
    1c80:	00008067          	ret

00001c84 <spi_write_fifo>:
    1c84:	fd010113          	addi	sp,sp,-48
    1c88:	02812623          	sw	s0,44(sp)
    1c8c:	03010413          	addi	s0,sp,48
    1c90:	fca42e23          	sw	a0,-36(s0)
    1c94:	fcb42c23          	sw	a1,-40(s0)
    1c98:	fd842783          	lw	a5,-40(s0)
    1c9c:	4057d793          	srai	a5,a5,0x5
    1ca0:	7ff7f793          	andi	a5,a5,2047
    1ca4:	fef42623          	sw	a5,-20(s0)
    1ca8:	fd842783          	lw	a5,-40(s0)
    1cac:	01f7f793          	andi	a5,a5,31
    1cb0:	00078863          	beqz	a5,1cc0 <spi_write_fifo+0x3c>
    1cb4:	fec42783          	lw	a5,-20(s0)
    1cb8:	00178793          	addi	a5,a5,1
    1cbc:	fef42623          	sw	a5,-20(s0)
    1cc0:	fe042423          	sw	zero,-24(s0)
    1cc4:	0480006f          	j	1d0c <spi_write_fifo+0x88>
    1cc8:	00000013          	nop
    1ccc:	1a1027b7          	lui	a5,0x1a102
    1cd0:	0007a783          	lw	a5,0(a5) # 1a102000 <_stack+0x19ffe000>
    1cd4:	4187d793          	srai	a5,a5,0x18
    1cd8:	0f87f793          	andi	a5,a5,248
    1cdc:	fe0798e3          	bnez	a5,1ccc <spi_write_fifo+0x48>
    1ce0:	fe842783          	lw	a5,-24(s0)
    1ce4:	00279793          	slli	a5,a5,0x2
    1ce8:	fdc42703          	lw	a4,-36(s0)
    1cec:	00f70733          	add	a4,a4,a5
    1cf0:	1a1027b7          	lui	a5,0x1a102
    1cf4:	01878793          	addi	a5,a5,24 # 1a102018 <_stack+0x19ffe018>
    1cf8:	00072703          	lw	a4,0(a4)
    1cfc:	00e7a023          	sw	a4,0(a5)
    1d00:	fe842783          	lw	a5,-24(s0)
    1d04:	00178793          	addi	a5,a5,1
    1d08:	fef42423          	sw	a5,-24(s0)
    1d0c:	fe842703          	lw	a4,-24(s0)
    1d10:	fec42783          	lw	a5,-20(s0)
    1d14:	faf74ae3          	blt	a4,a5,1cc8 <spi_write_fifo+0x44>
    1d18:	00000013          	nop
    1d1c:	00000013          	nop
    1d20:	02c12403          	lw	s0,44(sp)
    1d24:	03010113          	addi	sp,sp,48
    1d28:	00008067          	ret

00001d2c <spi_read_fifo>:
    1d2c:	fd010113          	addi	sp,sp,-48
    1d30:	02812623          	sw	s0,44(sp)
    1d34:	03010413          	addi	s0,sp,48
    1d38:	fca42e23          	sw	a0,-36(s0)
    1d3c:	fcb42c23          	sw	a1,-40(s0)
    1d40:	fd842783          	lw	a5,-40(s0)
    1d44:	4057d793          	srai	a5,a5,0x5
    1d48:	7ff7f793          	andi	a5,a5,2047
    1d4c:	fef42623          	sw	a5,-20(s0)
    1d50:	fd842783          	lw	a5,-40(s0)
    1d54:	01f7f793          	andi	a5,a5,31
    1d58:	00078863          	beqz	a5,1d68 <spi_read_fifo+0x3c>
    1d5c:	fec42783          	lw	a5,-20(s0)
    1d60:	00178793          	addi	a5,a5,1
    1d64:	fef42623          	sw	a5,-20(s0)
    1d68:	fe042423          	sw	zero,-24(s0)
    1d6c:	0480006f          	j	1db4 <spi_read_fifo+0x88>
    1d70:	00000013          	nop
    1d74:	1a1027b7          	lui	a5,0x1a102
    1d78:	0007a783          	lw	a5,0(a5) # 1a102000 <_stack+0x19ffe000>
    1d7c:	4107d793          	srai	a5,a5,0x10
    1d80:	0ff7f793          	andi	a5,a5,255
    1d84:	fe0788e3          	beqz	a5,1d74 <spi_read_fifo+0x48>
    1d88:	1a1027b7          	lui	a5,0x1a102
    1d8c:	02078713          	addi	a4,a5,32 # 1a102020 <_stack+0x19ffe020>
    1d90:	fe842783          	lw	a5,-24(s0)
    1d94:	00279793          	slli	a5,a5,0x2
    1d98:	fdc42683          	lw	a3,-36(s0)
    1d9c:	00f687b3          	add	a5,a3,a5
    1da0:	00072703          	lw	a4,0(a4)
    1da4:	00e7a023          	sw	a4,0(a5)
    1da8:	fe842783          	lw	a5,-24(s0)
    1dac:	00178793          	addi	a5,a5,1
    1db0:	fef42423          	sw	a5,-24(s0)
    1db4:	fe842703          	lw	a4,-24(s0)
    1db8:	fec42783          	lw	a5,-20(s0)
    1dbc:	faf74ae3          	blt	a4,a5,1d70 <spi_read_fifo+0x44>
    1dc0:	00000013          	nop
    1dc4:	00000013          	nop
    1dc8:	02c12403          	lw	s0,44(sp)
    1dcc:	03010113          	addi	sp,sp,48
    1dd0:	00008067          	ret

00001dd4 <reset_timer>:
    1dd4:	ff010113          	addi	sp,sp,-16
    1dd8:	00812623          	sw	s0,12(sp)
    1ddc:	01010413          	addi	s0,sp,16
    1de0:	1a1037b7          	lui	a5,0x1a103
    1de4:	0007a023          	sw	zero,0(a5) # 1a103000 <_stack+0x19fff000>
    1de8:	00000013          	nop
    1dec:	00c12403          	lw	s0,12(sp)
    1df0:	01010113          	addi	sp,sp,16
    1df4:	00008067          	ret

00001df8 <start_timer>:
    1df8:	ff010113          	addi	sp,sp,-16
    1dfc:	00812623          	sw	s0,12(sp)
    1e00:	01010413          	addi	s0,sp,16
    1e04:	1a1037b7          	lui	a5,0x1a103
    1e08:	00478793          	addi	a5,a5,4 # 1a103004 <_stack+0x19fff004>
    1e0c:	00100713          	li	a4,1
    1e10:	00e7a023          	sw	a4,0(a5)
    1e14:	00000013          	nop
    1e18:	00c12403          	lw	s0,12(sp)
    1e1c:	01010113          	addi	sp,sp,16
    1e20:	00008067          	ret

00001e24 <stop_timer>:
    1e24:	ff010113          	addi	sp,sp,-16
    1e28:	00812623          	sw	s0,12(sp)
    1e2c:	01010413          	addi	s0,sp,16
    1e30:	1a1037b7          	lui	a5,0x1a103
    1e34:	00478793          	addi	a5,a5,4 # 1a103004 <_stack+0x19fff004>
    1e38:	0007a023          	sw	zero,0(a5)
    1e3c:	00000013          	nop
    1e40:	00c12403          	lw	s0,12(sp)
    1e44:	01010113          	addi	sp,sp,16
    1e48:	00008067          	ret

00001e4c <get_time>:
    1e4c:	ff010113          	addi	sp,sp,-16
    1e50:	00812623          	sw	s0,12(sp)
    1e54:	01010413          	addi	s0,sp,16
    1e58:	1a1037b7          	lui	a5,0x1a103
    1e5c:	0007a783          	lw	a5,0(a5) # 1a103000 <_stack+0x19fff000>
    1e60:	00078513          	mv	a0,a5
    1e64:	00c12403          	lw	s0,12(sp)
    1e68:	01010113          	addi	sp,sp,16
    1e6c:	00008067          	ret

00001e70 <uart_set_cfg>:
    1e70:	fe010113          	addi	sp,sp,-32
    1e74:	00812e23          	sw	s0,28(sp)
    1e78:	02010413          	addi	s0,sp,32
    1e7c:	fea42623          	sw	a0,-20(s0)
    1e80:	00058793          	mv	a5,a1
    1e84:	fef41523          	sh	a5,-22(s0)
    1e88:	1a1077b7          	lui	a5,0x1a107
    1e8c:	00478793          	addi	a5,a5,4 # 1a107004 <_stack+0x1a003004>
    1e90:	0007a703          	lw	a4,0(a5)
    1e94:	1a1077b7          	lui	a5,0x1a107
    1e98:	00478793          	addi	a5,a5,4 # 1a107004 <_stack+0x1a003004>
    1e9c:	00276713          	ori	a4,a4,2
    1ea0:	00e7a023          	sw	a4,0(a5)
    1ea4:	1a1007b7          	lui	a5,0x1a100
    1ea8:	00c78793          	addi	a5,a5,12 # 1a10000c <_stack+0x19ffc00c>
    1eac:	08300713          	li	a4,131
    1eb0:	00e7a023          	sw	a4,0(a5)
    1eb4:	fea45783          	lhu	a5,-22(s0)
    1eb8:	0087d793          	srli	a5,a5,0x8
    1ebc:	01079793          	slli	a5,a5,0x10
    1ec0:	0107d793          	srli	a5,a5,0x10
    1ec4:	00078713          	mv	a4,a5
    1ec8:	1a1007b7          	lui	a5,0x1a100
    1ecc:	00478793          	addi	a5,a5,4 # 1a100004 <_stack+0x19ffc004>
    1ed0:	0ff77713          	andi	a4,a4,255
    1ed4:	00e7a023          	sw	a4,0(a5)
    1ed8:	fea45703          	lhu	a4,-22(s0)
    1edc:	1a1007b7          	lui	a5,0x1a100
    1ee0:	0ff77713          	andi	a4,a4,255
    1ee4:	00e7a023          	sw	a4,0(a5) # 1a100000 <_stack+0x19ffc000>
    1ee8:	1a1007b7          	lui	a5,0x1a100
    1eec:	00878793          	addi	a5,a5,8 # 1a100008 <_stack+0x19ffc008>
    1ef0:	0a700713          	li	a4,167
    1ef4:	00e7a023          	sw	a4,0(a5)
    1ef8:	1a1007b7          	lui	a5,0x1a100
    1efc:	00c78793          	addi	a5,a5,12 # 1a10000c <_stack+0x19ffc00c>
    1f00:	00300713          	li	a4,3
    1f04:	00e7a023          	sw	a4,0(a5)
    1f08:	1a1007b7          	lui	a5,0x1a100
    1f0c:	00478793          	addi	a5,a5,4 # 1a100004 <_stack+0x19ffc004>
    1f10:	0007a783          	lw	a5,0(a5)
    1f14:	0f07f713          	andi	a4,a5,240
    1f18:	1a1007b7          	lui	a5,0x1a100
    1f1c:	00478793          	addi	a5,a5,4 # 1a100004 <_stack+0x19ffc004>
    1f20:	00276713          	ori	a4,a4,2
    1f24:	00e7a023          	sw	a4,0(a5)
    1f28:	00000013          	nop
    1f2c:	01c12403          	lw	s0,28(sp)
    1f30:	02010113          	addi	sp,sp,32
    1f34:	00008067          	ret

00001f38 <uart_send>:
    1f38:	fd010113          	addi	sp,sp,-48
    1f3c:	02812623          	sw	s0,44(sp)
    1f40:	03010413          	addi	s0,sp,48
    1f44:	fca42e23          	sw	a0,-36(s0)
    1f48:	fcb42c23          	sw	a1,-40(s0)
    1f4c:	0680006f          	j	1fb4 <uart_send+0x7c>
    1f50:	00000013          	nop
    1f54:	1a1007b7          	lui	a5,0x1a100
    1f58:	01478793          	addi	a5,a5,20 # 1a100014 <_stack+0x19ffc014>
    1f5c:	0007a783          	lw	a5,0(a5)
    1f60:	0207f793          	andi	a5,a5,32
    1f64:	fe0788e3          	beqz	a5,1f54 <uart_send+0x1c>
    1f68:	fe042623          	sw	zero,-20(s0)
    1f6c:	0340006f          	j	1fa0 <uart_send+0x68>
    1f70:	fdc42783          	lw	a5,-36(s0)
    1f74:	00178713          	addi	a4,a5,1
    1f78:	fce42e23          	sw	a4,-36(s0)
    1f7c:	0007c703          	lbu	a4,0(a5)
    1f80:	1a1007b7          	lui	a5,0x1a100
    1f84:	00e7a023          	sw	a4,0(a5) # 1a100000 <_stack+0x19ffc000>
    1f88:	fd842783          	lw	a5,-40(s0)
    1f8c:	fff78793          	addi	a5,a5,-1
    1f90:	fcf42c23          	sw	a5,-40(s0)
    1f94:	fec42783          	lw	a5,-20(s0)
    1f98:	00178793          	addi	a5,a5,1
    1f9c:	fef42623          	sw	a5,-20(s0)
    1fa0:	fec42703          	lw	a4,-20(s0)
    1fa4:	03f00793          	li	a5,63
    1fa8:	00e7e663          	bltu	a5,a4,1fb4 <uart_send+0x7c>
    1fac:	fd842783          	lw	a5,-40(s0)
    1fb0:	fc0790e3          	bnez	a5,1f70 <uart_send+0x38>
    1fb4:	fd842783          	lw	a5,-40(s0)
    1fb8:	f8079ce3          	bnez	a5,1f50 <uart_send+0x18>
    1fbc:	00000013          	nop
    1fc0:	00000013          	nop
    1fc4:	02c12403          	lw	s0,44(sp)
    1fc8:	03010113          	addi	sp,sp,48
    1fcc:	00008067          	ret

00001fd0 <uart_getchar>:
    1fd0:	ff010113          	addi	sp,sp,-16
    1fd4:	00812623          	sw	s0,12(sp)
    1fd8:	01010413          	addi	s0,sp,16
    1fdc:	00000013          	nop
    1fe0:	1a1007b7          	lui	a5,0x1a100
    1fe4:	01478793          	addi	a5,a5,20 # 1a100014 <_stack+0x19ffc014>
    1fe8:	0007a783          	lw	a5,0(a5)
    1fec:	0017f713          	andi	a4,a5,1
    1ff0:	00100793          	li	a5,1
    1ff4:	fef716e3          	bne	a4,a5,1fe0 <uart_getchar+0x10>
    1ff8:	1a1007b7          	lui	a5,0x1a100
    1ffc:	0007a783          	lw	a5,0(a5) # 1a100000 <_stack+0x19ffc000>
    2000:	0ff7f793          	andi	a5,a5,255
    2004:	00078513          	mv	a0,a5
    2008:	00c12403          	lw	s0,12(sp)
    200c:	01010113          	addi	sp,sp,16
    2010:	00008067          	ret

00002014 <uart_sendchar>:
    2014:	fe010113          	addi	sp,sp,-32
    2018:	00812e23          	sw	s0,28(sp)
    201c:	02010413          	addi	s0,sp,32
    2020:	00050793          	mv	a5,a0
    2024:	fef407a3          	sb	a5,-17(s0)
    2028:	00000013          	nop
    202c:	1a1007b7          	lui	a5,0x1a100
    2030:	01478793          	addi	a5,a5,20 # 1a100014 <_stack+0x19ffc014>
    2034:	0007a783          	lw	a5,0(a5)
    2038:	0207f793          	andi	a5,a5,32
    203c:	fe0788e3          	beqz	a5,202c <uart_sendchar+0x18>
    2040:	1a1007b7          	lui	a5,0x1a100
    2044:	fef44703          	lbu	a4,-17(s0)
    2048:	00e7a023          	sw	a4,0(a5) # 1a100000 <_stack+0x19ffc000>
    204c:	00000013          	nop
    2050:	01c12403          	lw	s0,28(sp)
    2054:	02010113          	addi	sp,sp,32
    2058:	00008067          	ret

0000205c <uart_wait_tx_done>:
    205c:	ff010113          	addi	sp,sp,-16
    2060:	00812623          	sw	s0,12(sp)
    2064:	01010413          	addi	s0,sp,16
    2068:	00000013          	nop
    206c:	1a1007b7          	lui	a5,0x1a100
    2070:	01478793          	addi	a5,a5,20 # 1a100014 <_stack+0x19ffc014>
    2074:	0007a783          	lw	a5,0(a5)
    2078:	0407f793          	andi	a5,a5,64
    207c:	fe0788e3          	beqz	a5,206c <uart_wait_tx_done+0x10>
    2080:	00000013          	nop
    2084:	00000013          	nop
    2088:	00c12403          	lw	s0,12(sp)
    208c:	01010113          	addi	sp,sp,16
    2090:	00008067          	ret

00002094 <exit>:
    2094:	fe010113          	addi	sp,sp,-32
    2098:	00112e23          	sw	ra,28(sp)
    209c:	00812c23          	sw	s0,24(sp)
    20a0:	02010413          	addi	s0,sp,32
    20a4:	fea42623          	sw	a0,-20(s0)
    20a8:	fec42503          	lw	a0,-20(s0)
    20ac:	008000ef          	jal	ra,20b4 <eoc>
    20b0:	0000006f          	j	20b0 <exit+0x1c>

000020b4 <eoc>:
    20b4:	fe010113          	addi	sp,sp,-32
    20b8:	00812e23          	sw	s0,28(sp)
    20bc:	02010413          	addi	s0,sp,32
    20c0:	fea42623          	sw	a0,-20(s0)
    20c4:	fec42783          	lw	a5,-20(s0)
    20c8:	00078c63          	beqz	a5,20e0 <eoc+0x2c>
    20cc:	1a1077b7          	lui	a5,0x1a107
    20d0:	01478793          	addi	a5,a5,20 # 1a107014 <_stack+0x1a003014>
    20d4:	00100713          	li	a4,1
    20d8:	00e7a023          	sw	a4,0(a5)
    20dc:	0100006f          	j	20ec <eoc+0x38>
    20e0:	1a1077b7          	lui	a5,0x1a107
    20e4:	01478793          	addi	a5,a5,20 # 1a107014 <_stack+0x1a003014>
    20e8:	0007a023          	sw	zero,0(a5)
    20ec:	1a1077b7          	lui	a5,0x1a107
    20f0:	00478793          	addi	a5,a5,4 # 1a107004 <_stack+0x1a003004>
    20f4:	0007a703          	lw	a4,0(a5)
    20f8:	1a1077b7          	lui	a5,0x1a107
    20fc:	00478793          	addi	a5,a5,4 # 1a107004 <_stack+0x1a003004>
    2100:	00476713          	ori	a4,a4,4
    2104:	00e7a023          	sw	a4,0(a5)
    2108:	00000013          	nop
    210c:	01c12403          	lw	s0,28(sp)
    2110:	02010113          	addi	sp,sp,32
    2114:	00008067          	ret

00002118 <sleep_busy>:
    2118:	fd010113          	addi	sp,sp,-48
    211c:	02812623          	sw	s0,44(sp)
    2120:	03010413          	addi	s0,sp,48
    2124:	fca42e23          	sw	a0,-36(s0)
    2128:	fe042623          	sw	zero,-20(s0)
    212c:	0140006f          	j	2140 <sleep_busy+0x28>
    2130:	00000013          	nop
    2134:	fec42783          	lw	a5,-20(s0)
    2138:	00178793          	addi	a5,a5,1
    213c:	fef42623          	sw	a5,-20(s0)
    2140:	fdc42783          	lw	a5,-36(s0)
    2144:	fec42703          	lw	a4,-20(s0)
    2148:	fef744e3          	blt	a4,a5,2130 <sleep_busy+0x18>
    214c:	00000013          	nop
    2150:	00000013          	nop
    2154:	02c12403          	lw	s0,44(sp)
    2158:	03010113          	addi	sp,sp,48
    215c:	00008067          	ret

00002160 <cpu_perf_set>:
    2160:	fe010113          	addi	sp,sp,-32
    2164:	00112e23          	sw	ra,28(sp)
    2168:	00812c23          	sw	s0,24(sp)
    216c:	02010413          	addi	s0,sp,32
    2170:	fea42623          	sw	a0,-20(s0)
    2174:	feb42423          	sw	a1,-24(s0)
    2178:	001007b7          	lui	a5,0x100
    217c:	0f478513          	addi	a0,a5,244 # 1000f4 <numchar+0xf4>
    2180:	d60ff0ef          	jal	ra,16e0 <puts>
    2184:	00000013          	nop
    2188:	01c12083          	lw	ra,28(sp)
    218c:	01812403          	lw	s0,24(sp)
    2190:	02010113          	addi	sp,sp,32
    2194:	00008067          	ret

00002198 <cpu_perf_get>:
    2198:	fd010113          	addi	sp,sp,-48
    219c:	02112623          	sw	ra,44(sp)
    21a0:	02812423          	sw	s0,40(sp)
    21a4:	03010413          	addi	s0,sp,48
    21a8:	fca42e23          	sw	a0,-36(s0)
    21ac:	fe042623          	sw	zero,-20(s0)
    21b0:	fdc42703          	lw	a4,-36(s0)
    21b4:	00f00793          	li	a5,15
    21b8:	0ee7e063          	bltu	a5,a4,2298 <cpu_perf_get+0x100>
    21bc:	fdc42783          	lw	a5,-36(s0)
    21c0:	00279713          	slli	a4,a5,0x2
    21c4:	001007b7          	lui	a5,0x100
    21c8:	13478793          	addi	a5,a5,308 # 100134 <numchar+0x134>
    21cc:	00f707b3          	add	a5,a4,a5
    21d0:	0007a783          	lw	a5,0(a5)
    21d4:	00078067          	jr	a5
    21d8:	780027f3          	csrr	a5,0x780
    21dc:	fef42623          	sw	a5,-20(s0)
    21e0:	0cc0006f          	j	22ac <cpu_perf_get+0x114>
    21e4:	781027f3          	csrr	a5,0x781
    21e8:	fef42623          	sw	a5,-20(s0)
    21ec:	0c00006f          	j	22ac <cpu_perf_get+0x114>
    21f0:	782027f3          	csrr	a5,0x782
    21f4:	fef42623          	sw	a5,-20(s0)
    21f8:	0b40006f          	j	22ac <cpu_perf_get+0x114>
    21fc:	783027f3          	csrr	a5,0x783
    2200:	fef42623          	sw	a5,-20(s0)
    2204:	0a80006f          	j	22ac <cpu_perf_get+0x114>
    2208:	784027f3          	csrr	a5,0x784
    220c:	fef42623          	sw	a5,-20(s0)
    2210:	09c0006f          	j	22ac <cpu_perf_get+0x114>
    2214:	785027f3          	csrr	a5,0x785
    2218:	fef42623          	sw	a5,-20(s0)
    221c:	0900006f          	j	22ac <cpu_perf_get+0x114>
    2220:	786027f3          	csrr	a5,0x786
    2224:	fef42623          	sw	a5,-20(s0)
    2228:	0840006f          	j	22ac <cpu_perf_get+0x114>
    222c:	787027f3          	csrr	a5,0x787
    2230:	fef42623          	sw	a5,-20(s0)
    2234:	0780006f          	j	22ac <cpu_perf_get+0x114>
    2238:	788027f3          	csrr	a5,0x788
    223c:	fef42623          	sw	a5,-20(s0)
    2240:	06c0006f          	j	22ac <cpu_perf_get+0x114>
    2244:	789027f3          	csrr	a5,0x789
    2248:	fef42623          	sw	a5,-20(s0)
    224c:	0600006f          	j	22ac <cpu_perf_get+0x114>
    2250:	78a027f3          	csrr	a5,0x78a
    2254:	fef42623          	sw	a5,-20(s0)
    2258:	0540006f          	j	22ac <cpu_perf_get+0x114>
    225c:	78b027f3          	csrr	a5,0x78b
    2260:	fef42623          	sw	a5,-20(s0)
    2264:	0480006f          	j	22ac <cpu_perf_get+0x114>
    2268:	78c027f3          	csrr	a5,0x78c
    226c:	fef42623          	sw	a5,-20(s0)
    2270:	03c0006f          	j	22ac <cpu_perf_get+0x114>
    2274:	78d027f3          	csrr	a5,0x78d
    2278:	fef42623          	sw	a5,-20(s0)
    227c:	0300006f          	j	22ac <cpu_perf_get+0x114>
    2280:	78e027f3          	csrr	a5,0x78e
    2284:	fef42623          	sw	a5,-20(s0)
    2288:	0240006f          	j	22ac <cpu_perf_get+0x114>
    228c:	78f027f3          	csrr	a5,0x78f
    2290:	fef42623          	sw	a5,-20(s0)
    2294:	0180006f          	j	22ac <cpu_perf_get+0x114>
    2298:	fdc42583          	lw	a1,-36(s0)
    229c:	001007b7          	lui	a5,0x100
    22a0:	11878513          	addi	a0,a5,280 # 100118 <numchar+0x118>
    22a4:	bc8ff0ef          	jal	ra,166c <printf>
    22a8:	00000013          	nop
    22ac:	fec42783          	lw	a5,-20(s0)
    22b0:	00078513          	mv	a0,a5
    22b4:	02c12083          	lw	ra,44(sp)
    22b8:	02812403          	lw	s0,40(sp)
    22bc:	03010113          	addi	sp,sp,48
    22c0:	00008067          	ret

000022c4 <__CTOR_LIST__>:
	...

000022cc <__CTOR_END__>:
	...

Disassembly of section .rodata:

00100000 <numchar>:
  100000:	3130                	fld	fa2,96(a0)
  100002:	3332                	fld	ft6,296(sp)
  100004:	3534                	fld	fa3,104(a0)
  100006:	3736                	fld	fa4,360(sp)
  100008:	3938                	fld	fa4,112(a0)
  10000a:	4241                	li	tp,16
  10000c:	46454443          	fmadd.q	fs0,fa0,ft4,fs0,rmm
  100010:	6568                	flw	fa0,76(a0)
  100012:	6c6c                	flw	fa1,92(s0)
  100014:	6f77206f          	j	172f0a <_stack+0x6ef0a>
  100018:	6c72                	flw	fs8,28(sp)
  10001a:	2164                	fld	fs1,192(a0)
  10001c:	000a                	c.slli	zero,0x2
  10001e:	0000                	unimp
  100020:	796d                	lui	s2,0xffffb
  100022:	6576                	flw	fa0,92(sp)
  100024:	2072                	fld	ft0,280(sp)
  100026:	203d                	jal	100054 <numchar+0x54>
  100028:	6425                	lui	s0,0x9
  10002a:	000a                	c.slli	zero,0x2
  10002c:	796d                	lui	s2,0xffffb
  10002e:	6176                	flw	ft2,92(sp)
  100030:	2072                	fld	ft0,280(sp)
  100032:	203d                	jal	100060 <numchar+0x60>
  100034:	6425                	lui	s0,0x9
  100036:	000a                	c.slli	zero,0x2
  100038:	6552                	flw	fa0,20(sp)
  10003a:	656c                	flw	fa1,76(a0)
  10003c:	7361                	lui	t1,0xffff8
  10003e:	2065                	jal	1000e6 <numchar+0xe6>
  100040:	6f50                	flw	fa2,28(a4)
  100042:	20726577          	0x20726577
  100046:	6f64                	flw	fs1,92(a4)
  100048:	2f206e77          	0x2f206e77
  10004c:	4420                	lw	s0,72(s0)
  10004e:	7665                	lui	a2,0xffff9
  100050:	6369                	lui	t1,0x1a
  100052:	2065                	jal	1000fa <numchar+0xfa>
  100054:	4449                	li	s0,18
  100056:	000a                	c.slli	zero,0x2
  100058:	000a                	c.slli	zero,0x2
  10005a:	0000                	unimp
  10005c:	454a                	lw	a0,144(sp)
  10005e:	4544                	lw	s1,12(a0)
  100060:	44492043          	0x44492043
  100064:	000a                	c.slli	zero,0x2
  100066:	0000                	unimp
  100068:	2020                	fld	fs0,64(s0)
  10006a:	000a                	c.slli	zero,0x2
  10006c:	614d                	addi	sp,sp,176
  10006e:	756e                	flw	fa0,248(sp)
  100070:	6166                	flw	ft2,88(sp)
  100072:	72757463          	bgeu	a0,t2,10079a <_bss_end+0x612>
  100076:	7265                	lui	tp,0xffff9
  100078:	7665442f          	0x7665442f
  10007c:	6369                	lui	t1,0x1a
  10007e:	2065                	jal	100126 <numchar+0x126>
  100080:	4449                	li	s0,18
  100082:	000a                	c.slli	zero,0x2
  100084:	7245                	lui	tp,0xffff1
  100086:	7361                	lui	t1,0xffff8
  100088:	6e69                	lui	t3,0x1a
  10008a:	6c622067          	0x6c622067
  10008e:	206b636f          	jal	t1,1b6294 <_stack+0xb2294>
  100092:	2e30                	fld	fa2,88(a2)
  100094:	2e2e                	fld	ft8,200(sp)
  100096:	0000                	unimp
  100098:	6f44                	flw	fs1,28(a4)
  10009a:	656e                	flw	fa0,216(sp)
  10009c:	6520                	flw	fs0,72(a0)
  10009e:	6172                	flw	ft2,28(sp)
  1000a0:	676e6973          	csrrsi	s2,0x676,28
  1000a4:	6220                	flw	fs0,64(a2)
  1000a6:	6f6c                	flw	fa1,92(a4)
  1000a8:	002e6b63          	bltu	t3,sp,1000be <numchar+0xbe>
  1000ac:	74697257          	0x74697257
  1000b0:	6e69                	lui	t3,0x1a
  1000b2:	78302067          	0x78302067
  1000b6:	3231                	jal	ff9c2 <__DTOR_END__+0xfd6ee>
  1000b8:	36353433          	0x36353433
  1000bc:	74203837          	lui	a6,0x74203
  1000c0:	6461206f          	j	112706 <_stack+0xe706>
  1000c4:	7264                	flw	fs1,100(a2)
  1000c6:	7365                	lui	t1,0xffff9
  1000c8:	2e302073          	csrr	zero,0x2e3
  1000cc:	2e2e                	fld	ft8,200(sp)
  1000ce:	0000                	unimp
  1000d0:	74697257          	0x74697257
  1000d4:	6e69                	lui	t3,0x1a
  1000d6:	6f642067          	0x6f642067
  1000da:	656e                	flw	fa0,216(sp)
  1000dc:	002e                	c.slli	zero,0xb
  1000de:	0000                	unimp
  1000e0:	6552                	flw	fa0,20(sp)
  1000e2:	6461                	lui	s0,0x18
  1000e4:	203a                	fld	ft0,392(sp)
  1000e6:	3025                	jal	ff90e <__DTOR_END__+0xfd63a>
  1000e8:	7838                	flw	fa4,112(s0)
  1000ea:	0000                	unimp
  1000ec:	6e28                	flw	fa0,88(a2)
  1000ee:	6c75                	lui	s8,0x1d
  1000f0:	296c                	fld	fa1,208(a0)
  1000f2:	0000                	unimp
  1000f4:	5f757063          	bgeu	a0,s7,1006d4 <_bss_end+0x54c>
  1000f8:	6570                	flw	fa2,76(a0)
  1000fa:	6672                	flw	fa2,28(sp)
  1000fc:	735f 7465 203a      	0x203a7465735f
  100102:	6f6e                	flw	ft10,216(sp)
  100104:	2074                	fld	fa3,192(s0)
  100106:	6d69                	lui	s10,0x1a
  100108:	6c70                	flw	fa2,92(s0)
  10010a:	6d65                	lui	s10,0x19
  10010c:	6e65                	lui	t3,0x19
  10010e:	6574                	flw	fa3,76(a0)
  100110:	2064                	fld	fs1,192(s0)
  100112:	6579                	lui	a0,0x1e
  100114:	0074                	addi	a3,sp,12
  100116:	0000                	unimp
  100118:	20525343          	fmadd.s	ft6,ft4,ft5,ft4,unknown
  10011c:	6425                	lui	s0,0x9
  10011e:	6e20                	flw	fs0,88(a2)
  100120:	7920746f          	jal	s0,1078b2 <_stack+0x38b2>
  100124:	7465                	lui	s0,0xffff9
  100126:	7320                	flw	fs0,96(a4)
  100128:	7075                	c.lui	zero,0xffffd
  10012a:	6f70                	flw	fa2,92(a4)
  10012c:	7472                	flw	fs0,60(sp)
  10012e:	6465                	lui	s0,0x19
  100130:	000a                	c.slli	zero,0x2
  100132:	0000                	unimp
  100134:	21d8                	fld	fa4,128(a1)
  100136:	0000                	unimp
  100138:	21e4                	fld	fs1,192(a1)
  10013a:	0000                	unimp
  10013c:	21f0                	fld	fa2,192(a1)
  10013e:	0000                	unimp
  100140:	21fc                	fld	fa5,192(a1)
  100142:	0000                	unimp
  100144:	2208                	fld	fa0,0(a2)
  100146:	0000                	unimp
  100148:	2214                	fld	fa3,0(a2)
  10014a:	0000                	unimp
  10014c:	2220                	fld	fs0,64(a2)
  10014e:	0000                	unimp
  100150:	222c                	fld	fa1,64(a2)
  100152:	0000                	unimp
  100154:	2238                	fld	fa4,64(a2)
  100156:	0000                	unimp
  100158:	2244                	fld	fs1,128(a2)
  10015a:	0000                	unimp
  10015c:	2250                	fld	fa2,128(a2)
  10015e:	0000                	unimp
  100160:	225c                	fld	fa5,128(a2)
  100162:	0000                	unimp
  100164:	2268                	fld	fa0,192(a2)
  100166:	0000                	unimp
  100168:	2274                	fld	fa3,192(a2)
  10016a:	0000                	unimp
  10016c:	2280                	fld	fs0,0(a3)
  10016e:	0000                	unimp
  100170:	228c                	fld	fa1,0(a3)
	...

Disassembly of section .data:

00100174 <remu10_table>:
  100174:	0100                	addi	s0,sp,128
  100176:	0202                	c.slli64	tp
  100178:	05040303          	lb	t1,80(s0) # 19050 <__DTOR_END__+0x16d7c>
  10017c:	0605                	addi	a2,a2,1
  10017e:	08080707          	0x8080707
  100182:	0009                	c.nop	2

Disassembly of section .sdata:

00100184 <myvar>:
  100184:	0035                	c.nop	13
	...

Disassembly of section .stack:

00103000 <_stack-0x1000>:
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2441                	jal	280 <end_except+0x18>
   2:	0000                	unimp
   4:	7200                	flw	fs0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <__DYNAMIC+0x14>
   c:	001a                	c.slli	zero,0x6
   e:	0000                	unimp
  10:	1004                	addi	s1,sp,32
  12:	7205                	lui	tp,0xfffe1
  14:	3376                	fld	ft6,376(sp)
  16:	6932                	flw	fs2,12(sp)
  18:	7032                	flw	ft0,44(sp)
  1a:	5f30                	lw	a2,120(a4)
  1c:	326d                	jal	fffff9c6 <_stack+0xffefb9c6>
  1e:	3070                	fld	fa2,224(s0)
  20:	0800                	addi	s0,sp,16
  22:	0a01                	addi	s4,s4,0
  24:	0b              	地址 0x0000000000000024 越界。


Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3120                	fld	fs0,96(a0)
   c:	2e30                	fld	fa2,88(a2)
   e:	2e32                	fld	ft8,264(sp)
  10:	0030                	addi	a2,sp,8
