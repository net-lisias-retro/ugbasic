TEXTATDECODE:
    CP 122
    JR NC, TEXTATDECODEX1F
    CP 97
    JR C, TEXTATDECODEX1F
    SUB 96
    JP TEXTATDECODE0
TEXTATDECODEX1F:
TEXTATDECODE0:
    RTS