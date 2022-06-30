; Assembly program triangle of stars ascending order 
; Print stars in as many line the user takes

.MODEL SMALL
 
.STACK 100H

.DATA 

MSG1 DB "Input number of line: $" 
VAR DB ?

.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

; INPUT
    MOV AH, 9  
    LEA DX, MSG1 
    INT 21H
    
    MOV AH, 1
    INT 21H
    SUB AL, 48
    MOV VAR, AL

;---------------------------------------
; NEW LINE
MOV AH, 2 
MOV DL, 0DH ; CARRIAGE RETURN
INT 21H
MOV DL, 0AH ; LINE FEED
INT 21H 
; NEW LINE
MOV AH, 2 
MOV DL, 0DH ; CARRIAGE RETURN
INT 21H
MOV DL, 0AH ; LINE FEED
INT 21H 
;---------------------------------------
    

MOV CX, 0
MOV CL, VAR
MOV BL, 1


LINE1:
    MOV CX, BX ; 1 in moved to CX meaning loop runs 1 time


LINE2:
    CMP BL, VAR
    JG EXIT ; If greater EXIT
    MOV DL, '*'
    MOV AH, 2
    INT 21H

LOOP LINE2

INC BL
 
;---------------------------------------
; NEW LINE
MOV AH, 2 
MOV DL, 0DH ; CARRIAGE RETURN
INT 21H
MOV DL, 0AH ; LINE FEED
INT 21H
;---------------------------------------

LOOP LINE1


;exit to DOS 
EXIT:               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN