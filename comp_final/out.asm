.data
 newline:
.asciiz "\n" 
 word: 
 .space 21 
  msg2: .asciiz "please enter a value: " 
 .text 
main:
move $t0 $sp
addiu $sp $sp -40
sw $ra 0($sp)
addiu $sp $sp -4
li $v0, 4
la $a0, msg2
 syscall 
li $v0, 5 
 syscall 
 move $a0, $v0 
sw $a0 0($t0)
li $a0 0
sw $a0 4($t0)
lw $a0 4($t0)
sw $a0 0($sp)
addiu $sp $sp -4
li $a0 2
lw $t1 4($sp)
sub $a0 $a0 $t1
addiu $sp $sp 4
bgtz $a0 lbl0
li $a0 0
b lbl1
lbl0:li $a0 1
lbl1:sw $a0 8($t0)
label3:
lw $a0 8($t0)
li $t1 0
bne $a0 $t1 label4
b label5
label4:
lw $a0 4($t0)
sw $a0 0($sp)
addiu $sp $sp -4
li $a0 1
lw $t1 4($sp)
add $a0 $a0 $t1
addiu $sp $sp 4
sw $a0 12($t0)
lw $a0 12($t0)
sw $a0 4($t0)
lw $a0 0($t0)
sw $a0 0($sp)
addiu $sp $sp -4
li $a0 1
lw $t1 4($sp)
add $a0 $a0 $t1
addiu $sp $sp 4
sw $a0 16($t0)
lw $a0 16($t0)
sw $a0 0($t0)
lw $a0 4($t0)
sw $a0 0($sp)
addiu $sp $sp -4
li $a0 2
lw $t1 4($sp)
sub $a0 $a0 $t1
addiu $sp $sp 4
bgtz $a0 lbl2
li $a0 0
b lbl3
lbl2:li $a0 1
lbl3:sw $a0 8($t0)
b label3
label5:
lw $a0 0($t0)
sw $a0 20($t0)
move $t1 $sp
addiu $sp $sp -4
lw $a0 0($t0)
sw $a0 0($sp)
addiu $sp $sp -4
li $a0 1
sw $a0 0($sp)
addiu $sp $sp -4
jal foo
b label_main
foo:
sw $ra 0($t1)
lw $a0 20($t0)
sw $a0 0($t0)
li $v0, 1
lw $a0 0($t0)
syscall
li $v0, 4 
 la $a0 newline 
 syscall
lw $a0 0($t0)
sw $a0 0($sp)
addiu $sp $sp -4
li $a0 0
lw $t1 4($sp)
sub $a0 $a0 $t1
addiu $sp $sp 4
bltz $a0 lbl4
li $a0 0
b lbl5
lbl4:li $a0 1
lbl5:sw $a0 24($t0)
lw $a0 24($t0)
li $t1 0
bne $a0 $t1 label0
b label1
label0:
lw $a0 0($t0)
sw $a0 0($sp)
addiu $sp $sp -4
li $a0 1
lw $t1 4($sp)
sub $a0 $t1 $a0
addiu $sp $sp 4
sw $a0 28($t0)
lw $a0 28($t0)
sw $a0 0($t0)
lw $a0 0($t0)
sw $a0 20($t0)
move $t1 $sp
addiu $sp $sp -4
lw $a0 0($t0)
sw $a0 0($sp)
addiu $sp $sp -4
li $a0 1
sw $a0 0($sp)
addiu $sp $sp -4
jal foo
b label2
label1:
label2:
li $a0 9
sw $a0 32($t0)
move $v0 $a0
lw $a0 4($sp)
addiu $sp $sp 4
mul $a0 $a0 4
addu $sp $sp $a0
lw $ra 4($sp)
addiu $sp $sp 4
jr $ra
label_main:lw $ra 4($sp)
addiu $sp $sp 4
addiu $sp $sp 40
jr $ra
