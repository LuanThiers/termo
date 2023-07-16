org 0x7e00
jmp 0x0000:start


data:
    string db "00000",0     ;entrada do usuário
    resposta db "00000",0   ;termo(palavra correta)
    
    char0_aux db 0
    char1_aux db 0
    char2_aux db 0
    char3_aux db 0
    char4_aux db 0
    
    verde db 10
    roxo db 5
    branco db 15
    
    flag db 0
    linha db 0
    coluna db 17
    venceu db 0
    parametro_dx db 142

    ;mensagens do tutorial
    title db "APRENDA COMO JOGAR", 0
    tutorial_1 db "1. Voce tera 7 tentativas para             acertar a palavra", 0
    tutorial_2 db "2. As palavras terao sempre 5 letras", 0
    tutorial_3 db "3. Letras na posicao correta serao         marcadas em verde", 0
    tutorial_4 db "4. Letras na posicao errada serao          marcadas em roxo", 0
    tutorial_5 db "5. Letras incorretas serao marcadas        em branco", 0
    tutorial_6 db "1 - Voltar ao Menu", 0
    
    ;strings do jogo
    derrota_msg db "PERDEU TUDO!", 0
    vitoria_msg db "GANHOU TUDO!", 0
    tentativas_msg db "Tentativas: ", 0
    inicio_msg db "1 -> START", 0
    sair_msg db "esc-> Sair", 0
    tutorial_msg db "T-> Tutorial", 0
    strikes_msg db "Strikes: ", 0
    continuar_msg db "1-> Continuar", 0
    menu_msg db "2-> Menu", 0
    nivel1 db "1-> NIVEL 1", 0
    nivel2 db "2-> NIVEL 2", 0
    nivel3 db "3-> NIVEL 3", 0

    t db 16, 16, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11
    e db 16, 16, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 15, 15, 15, 15, 15, 5, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 15, 15, 15, 15, 15, 15, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    r db 16, 16, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 15, 15, 15, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 15, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 15, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 15, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11
    m db 16, 16, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 15, 5, 5, 15, 0, 0, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 0, 15, 15, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 15, 0, 0, 15, 0, 0, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 5, 5, 5, 15, 0, 0, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 5, 5, 5, 15, 0, 0, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 5, 5, 5, 15, 0, 0, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 5, 5, 5, 15, 0, 0, 5, 5, 5, 5, 5, 5, 5, 15, 0, 0, 5, 5, 5, 15, 0, 0, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    o db 16, 16, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 11, 11, 11, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 15, 15, 15, 15, 0, 0, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 15, 0, 0, 0, 0, 0, 0, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11
    
    bloco_comprimento db 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 , 4,4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 , 4,4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 , 4,4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 , 4,4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 , 4
    bloco_largura db 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 , 4
    ;variáveis para as palavras aleatórias
    words1 db "anzol", 0, "beijo", 0, "curva", 0, "dardo", 0,
         db "esqui", 0, "frevo", 0, "gaita", 0, "hotel", 0
        ; db "irado", 0, "jejum", 0, "libra", 0, "mosca", 0,
        ; db "navio", 0, "ontem", 0, "ponte", 0, "quase", 0,
        ; db "ruivo", 0, "susto", 0, "turvo", 0, "urubu", 0,
        ; db "vulto", 0, "voraz", 0, "xerox", 0, "xinga", 0,
        ; db "zebra", 0, 
    
    words2 db "sorvo", 0, "sismo", 0, "toada", 0, "usura", 0,
           db "urgiu", 0, "xisto", 0, "zarpo", 0, "zinco", 0
    
    words3 db "loyal", 0, "maybe", 0, "style", 0, "speak", 0,
           db "psych", 0, "tryer", 0, "above", 0, "acted", 0 
           ;db "alien", 0, "guess", 0, "short", 0, "today", 0


    number_words dw 8
    lenght_words db 6 ;5 letras + 0
    ticks db 0
    
    aviso_roxo db 0
    coluna_roxa db 0
    contador_verde db 0
    coluna_entrada db 0
    tentativas db 55 ;corresponde a 7 na tabela asc
    win_strike db 0 ;numero de vitorias iniciado em 0


start:
    xor ax, ax
    xor dx, dx  
    mov ds, ax
    mov es, ax
    mov byte[win_strike], 0 ;resetando o numero de vitorias
    mov byte[linha], 2
    
    call modoVideo
    call termo


    .loop:
        call getchar

        cmp al, 49 ; vai pro nivel 1
        je jogo

        cmp al, 50 ; vai pro nivel 2
        je jogo

        cmp al, 51 ; vai pro nivel 3
        je jogo

        cmp al, 't' ; vai pro tutorial
        je tutorial

        cmp al , 27 ; sai do jogo
        je fim

        jmp .loop

    ret

termo:
   
    mov byte[parametro_dx], 44
    mov dx, 28
    mov bx, 115
    mov di, 115
    add di, 16
    mov si, t
    call loop_letras

    mov dx, 28
    mov bx, 132
    mov di, 132
    add di, 16
    mov si, e
    call loop_letras

    mov dx, 28
    mov bx, 149
    mov di, 149
    add di, 16
    mov si, r
    call loop_letras

    mov dx, 28
    mov bx, 166
    mov di, 166
    add di, 16
    mov si, m
    call loop_letras


    mov dx, 28
    mov bx, 183
    mov di, 183
    add di, 16
    mov si, o
    call loop_letras

    mov bl, 10
    mov dh, 11
    mov dl, 14
    call setcursor
    mov si, nivel1
    call prints

    mov bl, 14
    mov dh, 13
    mov dl, 14
    call setcursor
    mov si, nivel2
    call prints

    mov bl, 12
    mov dh, 15
    mov dl, 14
    call setcursor
    mov si, nivel3
    call prints

    mov bl, 13
    mov dl, 17
    mov dh, 22
    mov dl, 2
    call setcursor
    
    mov si, sair_msg
    call prints

    mov dh, 22
    mov dl, 26
    call setcursor

    mov si, tutorial_msg
    call prints

    ret

define_nivel:
    cmp al, 49
    je .nivel1

    cmp al, 50
    je .nivel2

    cmp al, 51
    je .nivel3

    .nivel1:
        mov si, words1
        ret
    .nivel2:
        mov si, words2
        ret
    .nivel3:
        mov si, words3
        ret
        
loop_letras:

    mov cx, bx
    inc dx
    cmp dl, [parametro_dx]
    je .done

    .loop1:

        lodsb
        mov ah, 0ch
        inc cx
        int 10h
        cmp cx, di
        je loop_letras
        jmp .loop1

    .done:
        ret

tutorial:
    xor dx, dx
    xor ax, ax
    call clear

    mov dh, 1 ;linha
    mov dl, 11 ;coluna
    call setcursor
    mov si, title
    call prints

    mov dh, 4 ;linha
    mov dl, 2 ;coluna
    call setcursor
    mov si, tutorial_1
    call prints

    mov dh, 7 ;linha
    call setcursor
    mov si, tutorial_2
    call prints

    
    mov dh, 10 ;linha
    call setcursor
    mov si, tutorial_3
    call prints

    mov dh, 13 ;linha
    call setcursor
    mov si, tutorial_4
    call prints

    mov dh, 16 ;linha
    call setcursor
    mov si, tutorial_5
    call prints


    mov dh, 20
    mov dl, 9
    call setcursor
    mov si, tutorial_6
    call prints

    .loop00:
    call getchar
    cmp al, 49 ;se 1 ele volta ao menu
    je start
    jmp .loop00

    ret

jogo:
    call define_nivel
    xor dx, dx
    xor ax, ax
    call clear
    call define_word
    call looping
    ret

looping: 

    mov byte[parametro_dx], 167
    mov dx, 165 ; guarda o valor de inicio da coordenada x (dx)
    mov bx, 118 ; guarda o valor de inicio da coordenada y (cx)
    mov di, 188 ; guarda o valor do final da coordenada y (cx)
    mov si, bloco_comprimento
    call loop_letras

    mov byte[parametro_dx], 145
    mov dx, 143 ; guarda o valor de inicio da coordenada x (dx)
    mov bx, 118 ; guarda o valor de inicio da coordenada y (cx)
    mov di, 188 ; guarda o valor do final da coordenada y (cx)
    mov si, bloco_comprimento
    call loop_letras

    mov byte[parametro_dx], 167 ;guarda o valor final da coordenada x (dx)
    mov dx, 143 ; guarda o valor de inicio da coordenada x (dx)
    mov bx, 118 ; guarda o valor de inicio da coordenada y (cx)
    mov di, 119 ; guarda o valor do final da coordenada y (cx)
    mov si, bloco_comprimento
    call loop_letras

    mov byte[parametro_dx], 167
    mov dx, 143 ; guarda o valor de inicio da coordenada x (dx)
    mov bx, 187 ; guarda o valor de inicio da coordenada y (cx)
    mov di, 188 ; guarda o valor do final da coordenada y (cx)
    mov si, bloco_comprimento
    call loop_letras

    call clear_reg
    mov bl, [branco]

    ;mostrando numero de strikes
    mov dl, 3
    mov dh, 1
    call setcursor
    mov si, strikes_msg
    call prints

    mov al, 48 ;caracter 0
    add al, byte[win_strike] ;adicionando o numero de tentativas vencidas
    call printchar

    ;mostrando mensagem de tentativas
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
        inc byte[linha]

        mov byte[coluna], 17
        mov di, string          ;string do usuário
        
        push dx

        mov dl, 17
        mov dh, byte[linha]
        call setcursor

        call gets
        call endl

        pop dx
        inc dx

        push dx
        call search_green
        call search_purple
        pop dx 

        call delay ;para mostrar o resultado da última tentativa

        cmp byte[contador_verde], 5
        je vitoria

        call reset_flags    ;reiniciando flags 
        cmp byte[tentativas], 48 ;se for 0, perdeu e vai pra derrota
        jne .loop
        jmp derrota

    ret 

vitoria:
    call clear
    mov dh, 10
    mov dl, 13
    call setcursor

    ;mostrando mensagem de vitoria
    mov si, vitoria_msg
    call prints
    call delay
    call delay

    mov bl, [branco]
    mov dh, 18
    mov dl, 5
    call setcursor
    
    mov si, continuar_msg
    call prints

    mov dh, 18
    mov dl, 24
    call setcursor
    
    mov si, menu_msg
    call prints

    ;resetando os contadores
    inc byte[win_strike] ;atualizando o numero de vitorias
    call reset_cont

    .loop0:
        call getchar
        cmp al, 49 ;se 1 ele volta ao jogo
        je jogo
        cmp al, 50 ;se 2 ele volta ao menu
        je start
        jmp .loop0
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

    call reset_cont

    call delay
    call delay
    call delay
    jmp start


modoVideo:
    mov ah, 0
    mov al, 13h
    int 10h

    ;letra maior
    mov ah, 11h
    mov al, 03h

    mov bh, 0
    mov bl, [branco] ;cor
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

            mov dh, 19
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

            mov dh, 19
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
    ;mov si, words           ;colocando as palavras em si
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

reset_flags:
    mov byte[char0_aux], 0
    mov byte[char1_aux], 0
    mov byte[char2_aux], 0
    mov byte[char3_aux], 0
    mov byte[char4_aux], 0
    mov byte[contador_verde], 0
    ret

reset_cont:
    mov byte[tentativas], 55 ;resetando numero de tentativas para 7
    mov byte[aviso_roxo], 0
    mov byte[coluna_roxa], 0
    mov byte[contador_verde], 0
    mov byte[coluna_entrada], 0
    mov byte[flag], 0
    mov byte[linha], 2
    mov byte[venceu], 0
    ret


fim:
    jmp $