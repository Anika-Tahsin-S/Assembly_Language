; An assembly language program to take 2 inputs and show the product of them.


.MODEL SMALL
 
.STACK 100H
 
.DATA
 
MSG1 DB "Enter the First number: $"
MSG2 DB "Enter the Second number: $"   
MSG3 DB "PRODUCT: $"

VAR1 DB ?
VAR2 DB ?

 
.CODE
MAIN PROC
 
;initialize DS
 
MOV AX,@DATA
MOV DS,AX
 
; enter your code here
 
; single character output
;MOV AH, 2
;MOV DL, '?'
;INT 21H 


 
; SINGLE character input 
; FIRST NUMBER PRINT
LEA DX, MSG1
MOV AH, 9 
INT 21H
MOV AH, 1
INT 21H 

; PRINT THE INPUT ON THE NEXT LINE
;MOV DL, BL
;MOV AH, 2
;INT 21H


; STORED IN VARIABLE
SUB AL, 30H 
MOV VAR1, AL

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

; SINGLE character input 
; SECOND NUMBER INPUT
LEA DX, MSG2
MOV AH, 9 
INT 21H
MOV AH, 1
INT 21H  
       
           
; STORED IN VARIABLE 
SUB AL, 30H
MOV VAR2, AL

       
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

; PRINT PRODUCT
LEA DX, MSG3
MOV AH, 9 
INT 21H 
   
; PRODUCT OF THE NUMBERS
MOV AL, VAR1
MUL VAR2

; Print OUTPUT
MOV AH, 2 
ADD AL, 30H
MOV DL, AL
INT 21H 



;exit to DOS              
MOV AX,4C00H
INT 21H
 
MAIN ENDP
    END MAIN      