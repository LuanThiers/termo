org 0x7e00
jmp 0x0000:start

data:
	string1 times 16 db
	string2 times 16 db
	string3 times 16 db
	string4 times 16 db
	string5 times 16 db

start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    
    call modoVideo

    ;tentativa 1
    mov di, string1
    call gets

    ;tentativa 2
    mov di, string2
    call gets

    ;tentativa 3
    mov di, string3
    call gets

    ;tentativa 4
    mov di, string4
    call gets

    ;tentativa 5
    mov di, string5
    call gets
    
    call fim


modoVideo:
    mov ah, 0
    mov al, 13h
    int 10h

    ;letra maior
    mov ah, 0xb
    mov al, 0

    mov bh, 0
    mov bl, 5 ;cor
    int 10h
    
    ret

gets:
    xor cx, cx ;contador = 0
    mov al,0
    .loop:
        call getchar
        inc cx
        stosb
        call printchar
        cmp al, 0x0d ;0x0d = 13 = enter
            je .done

        jmp .loop
    .done:
        call printchar
        dec di
        mov al, 0
        stosb
        call endl
        ret

getchar:
    mov ah, 0x00
    int 16h
    ret

printchar:
    mov ah, 0xe
    int 10h
    ret

endl:
    mov al, 0x0a
    call printchar
    mov al, 0x0d
    call printchar

    ret


fim:
    jmp $

times 510 - ($ - $$) db 0
dw 0xaa55