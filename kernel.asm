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
    light_magenta db 13
    
    flag db 0
    linha db 0
    coluna db 17
    venceu db 0
    parametro_dx db 142
    lup db 0 ;contador de delay

    flag_nivel1 db 0
    flag_nivel2 db 0
    flag_nivel3 db 0

    ;mensagens do tutorial
    title db "APRENDA COMO JOGAR", 0
    tutorial_1 db "1. Voce tera 7 tentativas para             acertar a palavra", 0
    tutorial_2 db "2. As palavras terao sempre 5 letras", 0
    tutorial_3 db "3. Letras na posicao correta serao         marcadas em verde", 0
    tutorial_4 db "4. Letras na posicao errada serao          marcadas em roxo", 0
    tutorial_5 db "5. Letras incorretas serao marcadas        em branco", 0
    tutorial_6 db "[1] Voltar ao Menu", 0
    
    ;strings do jogo
    qual_palavra db "A palavra certa era:", 0
    proxima_fase db "Quer continuar o desafio?", 0
    derrota_msg db "PERDEU TUDO!", 0
    vitoria_msg db "GANHOU TUDO!", 0
    tentativas_msg db "Tentativas: ", 0
    sair_msg db "[esc] Sair", 0
    tutorial_msg db "[T] Tutorial", 0
    strikes_msg db "Strikes: ", 0
    continuar_msg db "[1] Continuar", 0
    menu_msg db "[2] Menu", 0
    nivel1 db "[1] NIVEL 1", 0
    nivel2 db "[2] NIVEL 2", 0
    nivel3 db "[3] NIVEL 3", 0
    nivel_msg db "Nivel ", 0

    termoo db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
           db 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
           db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
           db 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0,
           db 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 7, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 15, 15, 15, 15, 7,
           db 12, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 4, 15, 15, 15, 15, 12, 4, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 7, 4, 15, 15, 15, 15, 12, 4, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 4, 4, 12, 12, 12, 4, 4, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 4, 15, 15, 15, 7, 4, 4, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 4, 4, 4, 4, 4, 4, 4, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 4, 15, 15, 15, 7, 4, 4, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 4, 4, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 7, 7, 7, 15, 15, 15, 7, 7,
           db 15, 15, 15, 15, 7, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 4, 15, 15,
           db 15, 7, 4, 4, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 4, 
           db 4, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 4, 4, 4, 4, 4, 4, 4, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 12, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15,
           db 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15,
           db 15, 7, 4, 4, 4, 4, 4, 4, 6, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 4, 4, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 7, 0, 0, 15, 15, 15, 15, 15, 15,
           db 15, 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 4, 12, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15,
           db 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 7, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 15, 15, 15, 15, 7, 7, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0,
           db 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 15, 15, 15, 7, 0, 0, 0, 0, 0, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0,
           db 15, 15, 15, 7, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 0, 0, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 15, 15, 15, 7, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 15, 15, 15, 7, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15,
           db 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 7, 7, 7, 7, 0, 0,
           db 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 7, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0,
           db 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 7, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 15, 
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15,
           db 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15,
           db 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 7, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
           db 7, 7, 7, 7, 7, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 15, 15,
           db 15, 15, 15, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7,
           db 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
           db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    
    bloco_comprimento db 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
                      db 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
                      db 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
                      db 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
                      db 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
    
    bloco_largura db 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 , 4

    ;variáveis para as palavras aleatórias
    words1  db "anzol", 0, "beijo", 0, "curva", 0, "dardo", 0,
            db "esqui", 0, "frevo", 0, "gaita", 0, "hotel", 0,
            db "irado", 0, "jejum", 0, "libra", 0, "mosca", 0,
            db "navio", 0, "ontem", 0, "ponte", 0, "quase", 0,
            db "ruivo", 0, "susto", 0, "turvo", 0, "luisa", 0,
            db "vulto", 0, "voraz", 0, "xerox", 0, "xinga", 0,
        
    
    words2  db "zinco", 0, "xisto", 0, "anexo", 0, "usura", 0,
            db "sagaz", 0, "sutil", 0, "sanar", 0, "moral", 0,
            db "etnia", 0, "lapso", 0, "expor", 0, "haver", 0,
            db "tange", 0, "sobre", 0, "audaz", 0, "vigor", 0,
            db "assim", 0, "nobre", 0, "lorde", 0, "plena", 0,
            db "desde", 0, "honra", 0, "dever", 0, "prole", 0,


    words3  db "loyal", 0, "maybe", 0, "style", 0, "speak", 0,
            db "psych", 0, "tryer", 0, "above", 0, "acted", 0,
            db "alien", 0, "guess", 0, "short", 0, "today", 0,
            db "right", 0, "bread", 0, "chair", 0, "floor", 0,
            db "glass", 0, "grass", 0, "horse", 0, "house", 0,
            db "money", 0, "night", 0, "party", 0, "point", 0, 
    


    number_words dw 24
    lenght_words db 6 ;5 letras + 0
    ticks db 0
    
    aviso_roxo db 0
    coluna_roxa db 0
    contador_verde db 0
    coluna_entrada db 0
    tentativas db 55 ;corresponde a 7 na tabela asc
    win_strike db 0 ;numero de vitorias iniciado em 0
    nivel db 0

start:
    xor ax, ax
    xor dx, dx  
    mov ds, ax
    mov es, ax
    mov byte[win_strike], 0 ;resetando o numero de vitorias
    mov byte[linha], 2
    
    mov byte[flag_nivel1], 0
    mov byte[flag_nivel2], 0
    mov byte[flag_nivel3], 0


    call modoVideo
    call termo

    .loop:
        call getchar

        cmp al, 49 ; vai pro nivel 1
        je define_nivel

        cmp al, 50 ; vai pro nivel 2
        je define_nivel

        cmp al, 51 ; vai pro nivel 3
        je define_nivel

        cmp al, 't' ; vai pro tutorial
        je tutorial

        cmp al , 27 ; sai do jogo
        je fim

        jmp .loop

    ret

termo:
   
    mov byte[parametro_dx], 60
    mov dx, 28
    mov bx, 75
    mov di, 75
    add di, 160
    mov si, termoo
    call loop_letras

    mov bl, 10
    mov dh, 11
    mov dl, 14
    call setcursor
    mov si, nivel1
    mov al, 2 ;tempo do delay do atraso
    call atraso
    call prints

    mov bl, 14
    mov dh, 13
    mov dl, 14
    call setcursor
    mov si, nivel2
    mov al, 2 ;tempo do delay do atraso
    call atraso
    call prints

    mov bl, 12
    mov dh, 15
    mov dl, 14
    call setcursor
    mov si, nivel3
    mov al, 2 ;tempo do delay do atraso
    call atraso
    call prints

    mov bl, 13
    mov dh, 22
    mov dl, 2
    call setcursor
    
    mov si, sair_msg
    mov al, 2 ;tempo do delay do atraso
    call atraso
    call prints

    mov dh, 22
    mov dl, 26
    call setcursor

    mov si, tutorial_msg
    call prints

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
    ;call define_nivel
    xor dx, dx
    xor ax, ax
    call clear
    call define_word
    call looping
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
        mov byte[nivel], 1
        mov byte[flag_nivel1], 1
        mov byte[flag_nivel2], 0
        mov byte[flag_nivel3], 0
        jmp jogo
        
    .nivel2:
        mov si, words2
        mov byte[nivel], 2
        mov byte[flag_nivel1], 0
        mov byte[flag_nivel2], 1
        mov byte[flag_nivel3], 0
        jmp jogo

    .nivel3:
        mov si, words3
        mov byte[nivel], 3
        mov byte[flag_nivel1], 0
        mov byte[flag_nivel2], 0
        mov byte[flag_nivel3], 1
        jmp jogo

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

looping: 

    call print_bloco
    call clear_reg

    ;mostrando o nivel atual
    cmp byte[nivel], 1
    je .verde
    cmp byte[nivel], 2
    je .amarelo
    cmp byte[nivel], 3
    je .vermelho

    .verde:
        mov bl, 10
        jmp .checkpoint
    .amarelo:
        mov bl, 14
        jmp .checkpoint
    .vermelho:
        mov bl, 12
        jmp .checkpoint

    .checkpoint:
        mov dl, 3 ;coluna
        mov dh, 1 ;linha
        call setcursor
        mov si, nivel_msg
        call prints
        mov al, 48 ;caracter 0
        add al, byte[nivel]
        call printchar

    ;mostrando numero de strikes
    mov bl, [branco]
    mov dl, 3
    mov dh, 3
    call setcursor
    mov si, strikes_msg
    call prints

    mov bl, [light_magenta]
    mov al, 48 ;caracter 0
    add ax, [win_strike] ;adicionando o numero de tentativas vencidas
    call printchar

    ;mostrando mensagem de tentativas
    mov bl, [branco]
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
        mov bl, [light_magenta]
        mov al, byte[tentativas]
        call printchar
        dec byte[tentativas]

        inc byte[linha]
        inc byte[linha]
        mov byte[coluna], 17
        
        mov di, string          ;string do usuário
        push dx

        ;lendo a string do usuário
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
        call reset_flags    ;reiniciando flags 

        cmp byte[contador_verde], 5
        je vitoria

        mov byte[contador_verde], 0
        cmp byte[tentativas], 48 ;se for 0, perdeu e vai pra derrota
        jne .loop
        jmp derrota

    ret 

print_bloco:
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

search_green:
    mov si, string     ;caracteres em al
    mov dx, 0           ;dx como indice de string

    mov di, resposta    ;voltando ponteiro para o início de resposta
    mov cx, 0           ;cx como indice de resposta

    .loop:
        lodsb
        cmp dx, 5
        je .end
        cmp al, byte[di] ;se for igual, como estão no mesmo índice, é verde
        je .green
        inc dx
        inc cx
        inc di
        jmp .loop

        .end:
            ret
        
        .green: ;vai colocar asterisco na posição que deve ser verde
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

        call delay

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

        call delay

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


vitoria:
    call delay

    call clear
    mov dh, 10
    mov dl, 15
    call setcursor

    ;mostrando mensagem de vitoria
    mov bl, 10
    mov si, vitoria_msg
    call prints
    call delay
    
    mov al, 3
    call atraso

    mov bl, 15
    mov dh, 14
    mov dl, 8
    call setcursor
    mov si, proxima_fase
    call prints

    mov bl, 13
    mov dh, 20
    mov dl, 5
    call setcursor
    
    mov si, continuar_msg
    call prints

    mov dh, 20
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
        je confere_nivel
        cmp al, 50 ;se 2 ele volta ao menu
        je start
        jmp .loop0

ret

confere_nivel:
    cmp byte[flag_nivel1], 1
    je .nivel1

    cmp byte[flag_nivel2], 1
    je .nivel2

    cmp byte[flag_nivel3], 1
    je .nivel3

    .nivel1:
        mov si, words1
        jmp jogo
    .nivel2:
        mov si, words2
        jmp jogo
    .nivel3:
        mov si, words3
        jmp jogo

ret

derrota:
    call delay
    call clear
    mov dh, 10
    mov dl, 13
    call setcursor

    mov bl, [roxo]
    mov si, derrota_msg
    call prints

    mov al, 3
    call atraso
    
    mov dh, 13
    mov dl, 9
    call setcursor

    mov bl, 7
    mov si, qual_palavra
    call prints

    mov dh, 15
    mov dl, 17
    call setcursor

    mov bl, 13
    mov si, resposta
    call prints

    call reset_cont

    mov al, 11 ;tempo do delay
    call atraso

    jmp start

ret

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
    mov bl, 14
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

tostring:             
    push di
    .loop1:
        cmp ax, 0
        je .endloop1
        xor dx, dx
        mov bx, 10
        div bx           
        xchg ax, dx       
        add ax, 48        
        stosb
        xchg ax, dx
        jmp .loop1
    .endloop1:
        pop si
        cmp si, di
        jne .done
        mov al, 48
        stosb
    .done:
        mov al, 0
        stosb
        call reverse
        ret

reverse:             
    mov di, si
    xor cx, cx          
    .loop1:            
        lodsb
        cmp al, 0
        je .endloop1
        inc cl
        push ax
        jmp .loop1
    .endloop1:
    .loop2:            
        cmp cl, 0
        je .endloop2
        dec cl
        pop ax
        stosb
        jmp .loop2

    .endloop2:
        ret



endl:
    mov al, 0x0a
    call printchar
    mov al, 0x0d
    call printchar

    ret
         
delay:

   push cx
   push dx

   mov ah, 86h
   mov cx, 2
   mov dx, 400
   int 15h

   pop dx
   pop cx

ret

atraso:
    mov byte[lup], 0
    .loop:
        inc byte[lup]
        call delay
        cmp byte[lup], al
        jbe .loop

ret

setcursor:
    mov ah, 2
    mov bh, 0
    int 10h
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