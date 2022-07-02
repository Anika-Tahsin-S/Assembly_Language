; Take an array of length 7 and fill up the array with numbers, taken as input from the user. 
; Find the max, min from array.



.MODEL SMALL
 
.STACK 100H

.DATA 

STRING DW 'Input number (0-9): $'

MAX DB 'Maximum number is $'
MIN DB 'Minimum number is $'



.CODE 
MAIN PROC 

;initialize DS

MOV AX,@DATA 
MOV DS,AX 
 
; enter your code here

MOV CX, 5
MOV BH, 9D
MOV BL, 0D


MOV AH, 9
LEA DX, STRING
INT 21H
    
INPUT:
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    

CMP BL, AL
JL MAXIMUM
JMP SKIP

MAXIMUM:
    MOV BL, AL
    
SKIP:
    CMP BH, AL
    JG MINIMUM
    JMP SKIP2

MINIMUM:
    MOV BH, AL

SKIP2:
    LOOP INPUT


;---------------------------------------
; NEW LINE
MOV AH, 2 
MOV DL, 0DH ; CARRIAGE RETURN
INT 21H
MOV DL, 0AH ; LINE FEED
INT 21H
;---------------------------------------


MOV AH, 9
LEA DX, MAX
INT 21H

MOV AH, 2
MOV DL, BL
ADD DL, 30H 
INT 21H  

;---------------------------------------
; NEW LINE
MOV AH, 2 
MOV DL, 0DH ; CARRIAGE RETURN
INT 21H
MOV DL, 0AH ; LINE FEED
INT 21H
;---------------------------------------

MOV AH, 9
LEA DX, MIN
INT 21H

MOV AH, 2
MOV DL, BH
ADD DL, 30H 
INT 21H 

;exit to DOS 
               
MOV AX,4C00H
INT 21H 

MAIN ENDP
    END MAIN 