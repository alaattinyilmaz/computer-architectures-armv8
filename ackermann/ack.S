	.globl ack
ack:
	SUB SP,SP,#16 // Make room for 2 registers on stack
	STUR X30, [SP, #8] // Store return address on stack
	STUR X19, [SP, #0] // Saved register used to store m for future calls
	CMP X0, #0 // if m == 0 case
	B.EQ mzero
	CMP X1, #0 // if n == 0 case
	B.EQ nzero
	BL else // otherwise
mzero:
	ADD X0, X1, #1 // X0 = n + 1 return
	BR X30
nzero:
	SUB X0, X0, #1 // m is decreased --> m - 1
	mov X1, #1 // n = 1
	BL ack // Call for ack(m-1,1)
	BL done
else:
	ADD X19, X0, XZR // Saving m for second call
	SUB X1, X1, #1 // X1 = n - 1
	BL ack // X0 = ack(m, n-1)
	ADD X1, X0, XZR // n = ack(m,n-1)
	SUB X0, X19, #1 // X0 = m - 1
	BL ack // ack(m-1,ack(m,(n-1)))
	BL done
done:
	LDUR X19, [SP, #0] // Restoring m
	LDUR X30, [SP, #8] // Restoring return address
	ADD SP, SP, #16 // Pop the items
	BR X30 // Return
