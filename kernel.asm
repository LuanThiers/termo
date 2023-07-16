org 0x7e00
jmp 0x0000:start


data:
    string db "00000",0
    resposta db "00000",0
    
    char0_aux db 0
    char1_aux db 0
    char2_aux db 0
    char3_aux db 0
    char4_aux db 0
    
    termoo db "TERMOO", 0
    
    verde db 10
    roxo db 5
    branco db 15
    asterisco db 42
    
    flag db 0
    linha db 0
    coluna db 17
    venceu db 0
    derrota_msg db "PERDEU TUDO!", 0
    vitoria_msg db "GANHOU TUDO!", 0
    tentativas_msg db "Tentativas: ", 0
    inicio_msg db "1 - START", 0
    sair_msg db "2 - SAIR", 0
    tutorial_msg db "3 - TUTORIAL", 0

    words db "anzol", 0, "beijo", 0, "curva", 0, "dardo", 0
    number_words dw 4
    lenght_words db 6 ;5 letras + 0
    ticks db 0
    
    aviso_roxo db 0
    coluna_roxa db 0
    contador_verde db 0
    coluna_entrada db 0
    tentativas db 55 ;corresponde a 7 na tabela asc

    a_green db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            db 11, 11, 11, 11, 11, 15,  0,  0,  0,  0,  0,  0, 11, 11, 11, 11,
            db 11, 11, 11, 11, 15,  0,  0,  0,  0,  0,  0,  0,  0, 11, 11, 11,
            db 11, 11, 11, 11, 15,  0,  0, 11, 11, 11, 15,  0,  0, 11, 11, 11,
            db 11, 11, 11, 11, 15,  0,  0, 11, 11, 11, 15,  0,  0, 11, 11, 11,
            db 11, 11, 11, 11, 15,  0,  0, 15, 15, 15, 15,  0,  0, 11, 11, 11,
            db 11, 11, 11, 11, 15,  0,  0,  0,  0,  0,  0,  0,  0, 11, 11, 11,
            db 11, 11, 11, 11, 15,  0,  0,  0,  0,  0,  0,  0,  0, 11, 11, 11,
            db 11, 11, 11, 11, 15,  0,  0, 11, 11, 11, 15,  0,  0, 11, 11, 11,
            db 11, 11, 11, 11, 15,  0,  0, 11, 11, 11, 15,  0,  0, 11, 11, 11,
            db 11, 11, 11, 11, 15,  0,  0, 11, 11, 11, 15,  0,  0, 11, 11, 11,
            db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
            db 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,

start:
    xor ax, ax
    xor dx, dx  
    mov ds, ax
    mov es, ax

    call modoVideo

    mov dh, 4
    mov dl, 17
    call setcursor
    call termo
    

    mov dh, 10
    mov dl, 17
    call setcursor

    call getchar

    cmp al, 49
    je jogo


termo:
    call delay
    mov al, 'T'
    call printchar

    call delay
    mov al, 'E'
    call printchar

    call delay
    mov al, 'R'
    call printchar

    call delay
    mov al, 'M'
    call printchar

    call delay
    mov al, 'O'
    call printchar

    call delay

    mov dh, 18
    mov dl, 2
    call setcursor
    
    mov si, inicio_msg
    call prints

    mov dh, 18
    mov dl, 14
    call setcursor

    mov si, sair_msg
    call prints

    mov dh, 18
    mov dl, 26
    call setcursor

    mov si, tutorial_msg
    call prints

    ret


loop_letras:

    mov cx, 0
    inc dx
    cmp dx, 16
    je .done

    .loop1:

        lodsb
        mov ah, 0ch
        inc cx
        int 10h
        cmp cx, 16
        je loop_letras
        jmp .loop1

    .done:
        ret


jogo:
    xor dx, dx
    xor ax, ax
    call clear
    call define_word
    call looping
    ret

looping: 
    call clear_reg

    mov dl, 25
    mov dh, 1
    call setcursor
    mov si, tentativas_msg
    call prints


    .loop:
        ;setando o cursor pra printar tentativas
        mov dl, 37
        mov dh, 1
        call setcursor

        ;printa tentativas
        mov bl, [branco]
        mov al, byte[tentativas]
        call printchar
        dec byte[tentativas]

        inc byte[linha]
        mov byte[coluna], 17
        mov di, string          ;string do usuário
        
        push dx

        mov dl, 17
        mov dh, byte[linha]
        call setcursor

        call gets
        call endl

        ;inc byte[flag]

        pop dx
        inc dx

        push dx
        call search_green
        call search_purple
        pop dx 

        call delay ;para mostrar o resultado da última tentativa

        cmp byte[contador_verde], 5
        je vitoria

        call reint_flags    ;reiniciando flags 
        cmp byte[tentativas], 48 ;se for 0, perdeu e vai pra derrota
        jne .loop
        jmp derrota

    ret 

vitoria:
    call clear
    mov dh, 10
    mov dl, 13
    call setcursor

    mov si, vitoria_msg
    call prints

    call getchar
    jmp fim

derrota:
    call clear
    mov dh, 10
    mov dl, 13
    call setcursor

    mov bl, [roxo]
    mov si, derrota_msg
    call prints

    call getchar
    jmp fim

modoVideo:
    mov ah, 0
    mov al, 13h
    int 10h

    ;letra maior
    mov ah, 11h
    mov al, 03h

    mov ah, 4Ch
    int 21h

    mov bh, 0
    mov bl, 15 ;cor
    int 10h
    
    ret

clear:   
    ;seta cursor para canto esquerdo             
    mov dx, 0  
    call setcursor

    ; printa 2000 blank chars
    mov cx, 2000 
    mov bh, 0
    mov al, 0x20 ; blank char
    mov ah, 0x9
    int 0x10
    
    ; reseta cursor para canto esquerdo
    mov dx, 0 
    call setcursor
    ret


gets:
    mov byte[coluna_entrada], 17
    xor cx, cx ;contador = 0
    mov al,0
    .loop:
        call getchar

        cmp al,0x08
        je .backspace

        cmp al, 0x0d ;0x0d = 13 = enter
        je .pre_done

        jmp .checa_limite

        .pre_done:
            cmp cx, 5
            je .done

            jmp .loop
            
        .checa_limite:

            cmp cx, 5
                je .loop
            
            inc cx
            stosb

            mov dh, 15
            mov dl, byte[coluna_entrada]
            call setcursor

            call printchar
            inc byte[coluna_entrada]
            jmp .loop

        .backspace:
            cmp cl,0
            je .loop
            dec di
            dec cl
            mov byte[di],0
            dec byte[coluna_entrada]
            call delchar
            jmp .loop
            
        .done:

            call delchar
            call delchar
            call delchar
            call delchar
            call delchar

            mov dh, 15
            mov dl, byte[coluna_entrada]
            call setcursor
            call printchar
            inc byte[coluna_entrada]
            mov al, 0
            stosb

            
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

search_green:

    mov si, string     ;caracteres em al
    mov dx, 0           ;dx como indice de string

    mov di, resposta    ;voltando ponteiro para o início de resposta
    mov cx, 0           ;cx como indice de resposta

    .loop:

        lodsb
        cmp dx, 5
        je .end
        cmp al, byte[di]
        je .green
        inc dx
        inc cx
        inc di
        jmp .loop

        .end:
            ret
        
        .green:

            cmp cx, 0
            je .char0
            cmp cx, 1
            je .char1
            cmp cx, 2
            je .char2
            cmp cx, 3
            je .char3
            cmp cx, 4
            je .char4

            .char0:
                mov byte[char0_aux], 42
                jmp .endgreen
            .char1:
                mov byte[char1_aux], 42
                jmp .endgreen
            .char2:
                mov byte[char2_aux], 42
                jmp .endgreen
            .char3:
                mov byte[char3_aux], 42
                jmp .endgreen
            .char4:
                mov byte[char4_aux], 42
                jmp .endgreen

            .endgreen:
                inc dx
                inc cx
                inc di
                jmp .loop


search_purple:
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
            call endl
            ret


compare_char: 
    cmp cx,5          ;cabou caracteres de resposta
    je .endcomp
    
    cmp al, byte[di]  ;al = caracter de string, di = caracter de resposta
    je .definecolor
    jmp .rodaloop 
    

    .endcomp:           ;se acabou e não printou letra verde ou 

        cmp byte[aviso_roxo], 1
        je .retorno

        mov bh, 0       ;amarelo, printa a letra branca
        mov bl, [branco] 

        push dx
        xor dx, dx
        mov dl, byte[coluna]
        mov dh, byte[linha]
        call setcursor

        call printchar

        xor dx, dx
        inc byte[coluna]
        pop dx
        
        ret
    
    .retorno:
        mov byte[aviso_roxo], 0
        ret

    .rodaloop:
        inc di            ;próximo caracter de string
        inc cx            ;incrementa contador de resposta
        jmp compare_char 


    .definecolor:
        cmp dx, cx           ;se contadores são iguais: posição certa(verde)
        je .green           
        
        cmp cx, 0            ;se não está na posição certa, PODE ser roxo
        je .checkasteristico0
        cmp cx, 1            
        je .checkasteristico1
        cmp cx, 2
        je .checkasteristico2
        cmp cx, 3
        je .checkasteristico3
        cmp cx, 4 
        je .checkasteristico4

        .checkasteristico0:
            cmp byte[char0_aux], 42  ;se for * é pq é verde e já foi colocado
            je .rodaloop
            mov byte[char0_aux], 42
            jmp .purple
        
        .checkasteristico1:
            cmp byte[char1_aux], 42  ;se for * é pq é verde e já foi colocado
            je .rodaloop
            mov byte[char1_aux], 42
            jmp .purple
        
        .checkasteristico2:
            cmp byte[char2_aux], 42  ;se for * é pq é verde e já foi colocado
            je .rodaloop
            mov byte[char2_aux], 42
            jmp .purple
        
        .checkasteristico3:
            cmp byte[char3_aux], 42  ;se for * é pq é verde e já foi colocado
            je .rodaloop
            mov byte[char3_aux], 42
            jmp .purple
        
        .checkasteristico4:
            cmp byte[char4_aux], 42  ;se for * é pq é verde e já foi colocado
            je .rodaloop
            mov byte[char4_aux], 42
            jmp .purple


        .purple:

            cmp byte[aviso_roxo], 0
            je .printar_purple
            jmp .rodaloop

        .printar_purple:

            mov bh, 0
            mov bl, [roxo]
            
            push dx
            xor dx, dx
            mov dl, byte[coluna]
            mov dh, byte[linha]
            call setcursor
            call printchar

            inc byte[coluna]
            pop dx

            mov byte[aviso_roxo], 1

            jmp .rodaloop  

        .green:
            mov bh, 0
            mov bl, [verde]

            cmp byte[aviso_roxo], 1
            je .letra_verde_dupla

            push dx
            xor dx, dx
            mov dl, byte[coluna]
            mov dh, byte[linha]
            call setcursor

            call printchar
            inc byte[coluna]
            pop dx

            inc byte[contador_verde]

            ret

        .letra_verde_dupla:
            
            mov byte[aviso_roxo], 0
            push dx
            xor dx, dx
            dec byte[coluna]
            mov dl, byte[coluna]
            mov dh, byte[linha]
            call setcursor

            call printchar
            inc byte[coluna]
            pop dx

            ret
         
delay:
   mov ah, 86h
   mov cx,5
   mov dx,400
   int 15h
    ret

setcursor:
    mov ah, 2
    mov bh, 0
    int 10h
    ret


clock:
    mov ah, 0   ;lê relógio (conta ticks a partir de 00h) e salva em cx:dx
    int 1ah 
    mov [ticks], dx
    ret

define_word:
    call clock

    xor dx, dx
    xor ax, ax
    xor cx, cx

    mov ax, [ticks]
    mov cx, [number_words]
    div cx                  ;divide ax por cx e coloca resto em dx
    mov [ticks], dx         ;em ticks vai ter o índice da palavra que será usada

    xor cx, cx
    mov si, words           ;colocando as palavras em si
    mov ax, [ticks]
    mul byte[lenght_words]  ;multiplica o índice pelo tamanho das palavras para achar índice da 1 letra da palavra(ax)
    mov dx, ax              ;coloca em dx o índice que quer chegar
    sub dx, 1               ;voltando uma posição para não perder o primeiro caracter das palavras

    .loop:
        lodsb
        cmp cx, dx
        je .end
        inc cx
        jmp .loop
        .end:
            mov di, resposta        ;vai armazenar a resposta
            call strcpy
            ;mov si, resposta
            ;call prints

    ret


strcpy:
    xor cx, cx
    .loop1:
        lodsb
        stosb
        cmp cx, 6       ;se chegou em 6, copiou tudo que precisava pra resposta
        je .endloop1
        inc cx
        jmp .loop1

    .endloop1:
        ret

clear_reg:
    xor ax, ax
    xor dx, dx
    xor cx, cx
    ret

reint_flags:
    mov byte[char0_aux], 0
    mov byte[char1_aux], 0
    mov byte[char2_aux], 0
    mov byte[char3_aux], 0
    mov byte[char4_aux], 0
    mov byte[contador_verde], 0
    ret


fim:
    jmp $