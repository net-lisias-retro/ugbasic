; /*****************************************************************************
;  * ugBASIC - an isomorphic BASIC language compiler for retrocomputers        *
;  *****************************************************************************
;  * Copyright 2021-2024 Marco Spedaletti (asimov@mclink.it)
;  *
;  * Licensed under the Apache License, Version 2.0 (the "License");
;  * you may not use this file except in compliance with the License.
;  * You may obtain a copy of the License at
;  *
;  * http://www.apache.org/licenses/LICENSE-2.0
;  *
;  * Unless required by applicable law or agreed to in writing, software
;  * distributed under the License is distributed on an "AS IS" BASIS,
;  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;  * See the License for the specific language governing permissions and
;  * limitations under the License.
;  *----------------------------------------------------------------------------
;  * Concesso in licenza secondo i termini della Licenza Apache, versione 2.0
;  * (la "Licenza"); è proibito usare questo file se non in conformità alla
;  * Licenza. Una copia della Licenza è disponibile all'indirizzo:
;  *
;  * http://www.apache.org/licenses/LICENSE-2.0
;  *
;  * Se non richiesto dalla legislazione vigente o concordato per iscritto,
;  * il software distribuito nei termini della Licenza è distribuito
;  * "COSì COM'è", SENZA GARANZIE O CONDIZIONI DI ALCUN TIPO, esplicite o
;  * implicite. Consultare la Licenza per il testo specifico che regola le
;  * autorizzazioni e le limitazioni previste dalla medesima.
;  ****************************************************************************/
;* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
;*                                                                             *
;*                      INTERNAL VARIABLES FOR TRS-80 COLOR COMPUTER 3         *
;*                                                                             *
;*                             by Marco Spedaletti                             *
;*                                                                             *
;* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

TEXTADDRESS         fdb     $e000
BITMAPADDRESS       fdb     $e000
COLORMAPADDRESS     fdb     $0000
CURRENTMODE         fcb     $0
CURRENTTILEMODE     fcb     1
EVERYSTATUS        fcb     0

TABCOUNT            fcb     4
XCURS               fcb     0
YCURS               fcb     0
EMPTYTILE           fcb     32

COCO3TIMER          fdb     $0
COCO3TIMER2         fdb     $0
TICKSPERSECOND      fcb     $0

TMPPTR equ $10    ; $23
TMPPTR2 equ $12    ; $25

MATHPTR0 equ $14
MATHPTR1 equ $15
MATHPTR2 equ $16
MATHPTR3 equ $17
MATHPTR4 equ $18
MATHPTR5 equ $19
MATHPTR6 equ $20
MATHPTR7 equ $21
MATHPTR8 equ $22
MATHPTRB0 equ $23
MATHPTRB1 equ $24
MATHPTRB2 equ $25
MATHPTRB3 equ $26
MATHPTRB4 equ $27
MATHPTRB5 equ $28
MATHPTRB6 equ $29
MATHPTRB7 equ $2a
MATHPTRB8 equ $2b

DSSTATUS equ $3b
DSSIZE equ $3c
DSADDRLO equ $3d
DSADDRHI equ $3e
DSBANKLO equ $3f
DSBANKHI equ $40

COPYOFTEXTADDRESS equ $41
COPYOFBITMAPADDRESS equ $43
COPYOFCOLORMAPADDRESS equ $45
COPYOFTEXTADDRESS2 equ $47
COPYOFCOLORMAPADDRESS2 equ $49

DIRECTION equ $4a
PORT equ $4b
PATTERN equ $4d
CHARACTERS equ $4a
CLINEX equ $4b
CLINEY equ $4c

BITSTOCONVERT equ $4a

XCURSYS equ $D3
YCURSYS equ $D6

BANKSHADOW fcb  $FF
BANKSHADOWSHADOW fcb $3E

DATAPTR fdb  0

COCO3DCOMMONSAVEDERROR     fcb   $0, $0, $0
COCO3DCOMMONDISKOPEN       fcb   $0, $0
COCO3DCOMMONERRORHANDLER   fcb   $0, $0
COCO3DCOMMONERRORSTACK     fcb   $0, $0

DLOADERROR      fcb  $0
DSAVEERROR      fcb  $0

RAMENABLED      fcb  $1

JOYSTICK0       fcb  $0
JOYSTICK1       fcb  $0

PIA0AD     equ   $FF00
PIA0AC     equ   $FF01
PIA0BD     equ   $FF02
PIA0BC     equ   $FF03

PIA1AD     equ   $FF20
PIA1AC     equ   $FF21
PIA1BD     equ   $FF22
PIA1BC     equ   $FF23
