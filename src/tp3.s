.section .init9

main:
	/* initialisation de l’ecran */
	/*call #lcd_init*/

	/* emballage es arguments */
	MOV #6, R15
	/* MOV #7, R14 */

	call #ex7

	/* deballage de la valeur de retour de mult
	 * qu’on re-emballe comme argument pour l’appel suivant */
	MOV R13, R15

	call #lcd_display_number

/* infinite loop */
done:
	jmp done



/* Exercice 2 : simple multiplication */
mymult:
	SUB R13, R13 /* initialise r13 */
	MOV R14, R12 /* R12 sert de compteur */

multloop:
	ADD R15, R13
	SUB #1, R12
	JNZ multloop

	RET

/* Exercice 3 : multiplication du systeme */
ex3:
	MOV R15,&0x0130 /* OP1 using MPY */
	MOV R14,&0x0138 /* OP2 : start multiplication */
	MOV &0x013A,R13 /* resultat RESLO dans R13 */
	RET

/* Exercice 4 : push et pop */
ex4:
	/* 6 push */
	push #0x0000
	push #0x0001
	push #0x0002
	push #0x0003
	push #0x0004
	push #0x0005
	/* 6 pop */
	pop R15
	pop R15
	pop R15
	pop R15
	pop R15
	pop R15
	RET

/* Exercice 5 : ou SP pointe-t’il ? */
/* SP pointe sur la dernière case remplie */
ex5:
	push #0x0004
	push #0x0004
	push #0x0004
	push #0x0004
	push #0x0004
	RET
/* Exercice 6 : la base de la pile est à la fin de la RAM -> 0x3100 */
ex6:
	POP R15
	RET

/* Exercice 7 : factorielle, prend R15 en entrée */
ex7:
	MOV #1,R14  /* initialise R12 pour stocker le resultat */
ex7loop:
	call #ex3   /* appelle la multiplication systeme sur R15,R14 */
	MOV R13,R14 /* met le résultat de la multiplication dans R14 */
	SUB #1,R15  /* décremente R15 */
	JZ ex7done  /* sort de la récursion en arrivant à 0 */
	call #ex7loop

ex7done:
	MOV R14,R13 /* charge le resultat dans R13 */
	RET	
