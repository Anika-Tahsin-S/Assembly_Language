; Type_1. Sum of 1+4+7+...+148 in AX
; (n(a1+a2))/2 = 3725

.MODEL SMALL
 
.STACK 100H

.DATA 
Output DW ? ; for 16 bit output

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; 148/3 = 50 numbers
MOV CX, 50
MOV AX, 0 
MOV BX, 1  

LABEL:
    ADD AX, BX ; 1, 4, 7... 
    ADD BX, 3 ; 4, 7 ....
    MOV Output, AX ; 1  
    LOOP LABEL 


;exit to DOS               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  
