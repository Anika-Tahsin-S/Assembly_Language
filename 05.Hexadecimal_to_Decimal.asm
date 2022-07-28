.MODEL SMALL
 
.STACK 100H
 
.DATA
 
MSG1 DB "Enter a Hex number: $"
MSG2 DB "In decimal it is: 1$"

 
.CODE
MAIN PROC
 
;initialize DS
 
MOV AX,@DATA
MOV DS,AX
 
; enter your code here 
; Output MSG1
MOV AH, 9
LEA DX, MSG1
INT 21H

; Input single character
MOV AH, 1
INT 21H

MOV BL, AL
SUB BL, 17D

MOV AH, 2
INT 21H

;---------------------------------------
; NEW LINE
MOV AH, 2 
MOV DL, 0DH ; CARRIAGE RETURN
INT 21H
MOV DL, 0AH ; LINE FEED
INT 21H
;---------------------------------------

; Output MSG1
MOV AH, 9
LEA DX, MSG2
INT 21H

MOV DL, BL
MOV AH, 2
INT 21H
 
;exit to DOS               
MOV AX,4C00H
INT 21H
 
MAIN ENDP
    END MAIN      