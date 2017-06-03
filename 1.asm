data segment
message db 'a string for testing$'
data ends
code segment
          assume ds:data, cs:code
   start:mov ax,data
          mov ds,ax
          mov di,offset message
          mov cx,20
  lop:cmp BYTE PTR[di],'s'
          jz trans
          inc di 
          dec cx
          jz exit
          jmp lop
   trans:sub BYTE PTR[DI],20h
   exit:mov dx,offset message
          mov ah,9
          int 21h
          mov ah,4ch
          int 21h 
code ends
end start