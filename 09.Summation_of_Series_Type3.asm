; Type_3. Sum of 1+2+4+7+11+...+154 in AX  
; (1+(1+2+3+4+5+6+7+8+9+10+11+12+13+14+15+16+17))
; (a18 = a17 + 17)
; (1+(n/2)*(1+n)) = 154

.MODEL SMALL
 
.STACK 100H

.DATA 
Output DW ? ; for 16 bit output 

.CODE 
MAIN PROC 

;initialize DS
MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here
; 17 numbers
MOV CX, 17
MOV AX, 0 
MOV BX, 1  


LABEL:
    ADD AX, BX ; 1, 4, 7... 
    ADD BX, 1 ; 4, 7 ....
    MOV Output, AX ; 1  
    LOOP LABEL
    ADD Output, 1 


;exit to DOS             
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 
  