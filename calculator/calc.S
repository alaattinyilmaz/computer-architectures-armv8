	.globl calc
calc:
	cmp X0, #43 // oper == '+'
	b.eq addition
	cmp X0, #45 // oper == '-'
	b.eq subtraction
	cmp X0, #42 // oper == '*'
	b.eq multiply
	cmp X0, #33 // oper == '!'
	b.eq fact
	cmp X0, #47 // oper == '/'
	b.eq division
addition:
	add X0, X1, X2 // num1 + num2
	br	X30
subtraction:
	sub X0, X1, X2 // num1 - num2
	br X30
multiply:
	mul X0, X1, X2 // num1 * num2
	br X30
division:
 	SDIV X0, X1, X2 // num1 / num2
	br X30
fact:
	cmp X1, #10 // num 1 digit?
	b.ge facterror
	cmp X1, #0 // num1 <? 0
	b.lt facterror
	mov X9, #1 // i = 1
	mov X10, #1 // factorial = 1
	cmp X1, #0 // num1 == 0?
	b.eq floopent
	b factloop
factloop:
	cmp X9, X1 // i <? num1
	b.gt floopent
	mul X10, X10, X9 // factorial = factorial * i
	add X9, X9, #1 // i++
	b factloop
floopent:
	mov X0, X10 // result = -1
	br X30
facterror:
	mov X10, #0
	sub X9, X10, #1 // X9 = -1
	mov X0, X9 // result = -1
	br X30
