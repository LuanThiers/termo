org 0x7e00
jmp 0x0000:start


data:
	string db "00000",0
    resposta db "navio",0

start:
    xor ax, ax
    xor dx, dx 
    mov ds, ax
    mov es, ax
    
    call modoVideo

    ;tentativa 1
    call looping 
    
    call fim

looping: 
    .loop:
        mov di, string	
	mov bl, 15
        push dx
        call gets
        pop dx
        inc dx
        push dx
        call compare_string
        call endl 
        pop dx 
        cmp dx, 7
            jne .loop
    ret 

modoVideo:
    mov ah, 0
    mov al, 13h
    int 10h

    ;letra maior
    mov ah, 0xb
    mov al, 0

    mov bh, 0
    mov bl, 15 ;cor
    int 10h
    
    ret

gets:
    xor cx, cx ;contador = 0
    mov al,0
    .loop:
        call getchar

        cmp al,0x08
        je .backspace

        inc cx
        stosb
        call printchar
        cmp al, 0x0d ;0x0d = 13 = enter
        je .done

        jmp .loop

        .backspace:
            cmp cl,0
            je .loop
            dec di
            dec cl
            mov byte[di],0
            call delchar
            jmp .loop
            
        .done:
            call printchar
            dec di
            mov al, 0
            stosb
            ;call endl
            ret

prints:
    lodsb
    cmp al, 0
    je .end 
    call printchar
    jmp prints
    
    .end:
        ret


getchar:
    mov ah, 0x00
    int 16h
    ret

printchar:
    mov ah, 0xe
    int 10h
    ret

delchar:
    mov al, 0x08
    call printchar
    mov al, ''
    call printchar
    mov al,0x08
    call printchar

    ret


endl:
    mov al, 0x0a
    call printchar
    mov al, 0x0d
    call printchar

    ret

compare_string:
    mov si, string     ;caracteres em al
    mov dx, 0           ;dx como indice de string

    .loop_string:
        cmp dx, 5     ;cabou string
        je .end
        
        mov di, resposta    ;voltando ponteiro para o início de resposta
        mov cx, 0           ;cx como indice de resposta
        lodsb               ;pega próximo caracter de string e coloca em al
        call compare_char   ;comparar 1 caracter de string com resposta
        inc dx              ;incrementa contador de string  
        
        jmp .loop_string

        .end:
            ret


compare_char: 
    cmp cx,5          ;cabou caracteres de resposta
    je .endcomp
    
    cmp al, byte[di]  ;al = caracter de string, di = caracter de resposta
    je .definecolor   ;se forem iguais, a letra tá na palavra: será verde ou amarelo
    inc di            ;próximo caracter de string
    inc cx            ;incrementa contador de resposta
    
    jmp compare_char  
    

    .endcomp:           ;se acabou e não printou letra verde ou 
        mov bh, 0       ;amarelo, printa a letra branca
        mov bl, 15 
        call printchar
        ret

    .definecolor:
        cmp dx,cx           ;se contadores forem iguais, está na posição 
        je .verde           ;certa: será verde
        jmp .amarelo

        .verde:
            mov bh, 0
            mov bl, 10 ;cor verde
            call printchar
            ret

        .amarelo:
            mov bh, 0
            mov bl, 5 ;cor amarela
            call printchar
            ret

setcursor:
    mov ah, 2
    mov bh, 0
    int 10h
    ret

fim:
    jmp $


times 510 - ($ - $$) db 0
dw 0xaa55 ; assinatura de boot