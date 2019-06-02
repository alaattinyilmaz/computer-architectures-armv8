	.globl fib
fib:
	mov X9, #1 // first = 1
	mov X10, #1 // second = 1
	mov X11, #1 // next = 1
	mov X12, #1 // i = 1
	b loop
loop:
	cmp X12, X0 // i<n ?
	b.ge forent
	cmp X12, #1 // i<=1 ?
	b.gt else
	mov X11,X12 // next = i
	b iter
else:
	add X11, X9, X10 // next = first + second
	mov X9, X10 // first = second
	mov X10, X11 // second = next
	b iter
iter:
	add X12,X12,#1 // i = i + 1
	b loop
forent:
	mov X0, X11 // X0 = next for return
	br	X30
