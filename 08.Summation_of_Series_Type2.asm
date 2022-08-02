; Type_2. Put the sum of 100 + 95 + 90 + ... + 5 in AX.
; 100 + 95 + 90 .... + 5 = 1050 
; (n(a1+a2))/2 = 1050

.MODEL SMALL
 
.STACK 100H

.DATA 

OUTPUT DW ? ; for 16 bit output

.CODE 
MAIN PROC 

;initialize DS
MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here
; 100/5 = 20
MOV CX, 20
MOV AX, 0
MOV BX, 100

CALC:
    ADD AX, BX ; 20
    SUB BX, 5  ; 15
    MOV OUTPUT, AX
    LOOP CALC


;exit to DOS       
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  