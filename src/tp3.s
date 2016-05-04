.section .init9

main:
	/* initialisation de l’ecran */
	call #lcd_init

	/* emballage es arguments */
	MOV #6, R15
	MOV #7, R14

	call #mult

	/* deballage de la valeur de retour de mult
	 * qu’on re-emballe comme argument pour l’appel suivant */
	MOV R13, R15

	call #lcd_display_number

/* infinite loop */
done:
	jmp done

mult:
	SUB R13, R13 /* initialise r13 */
	MOV R14, R12 /* R12 sert de compteur */

multloop:
	ADD R15, R13
	SUB #1, R12
	JNZ multloop

	ret
