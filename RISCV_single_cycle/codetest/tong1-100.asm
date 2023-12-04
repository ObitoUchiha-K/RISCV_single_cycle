addi x1,x0,0
addi x2,x0,1
addi x5,x0,101
loop: add x1,x1,x2
addi x2,x2,1
beq x2,x5,next
jal x4,loop
next: 
sw x1,4(x0)