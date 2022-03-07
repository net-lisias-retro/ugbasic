; /*****************************************************************************
;  * ugBASIC - an isomorphic BASIC language compiler for retrocomputers        *
;  *****************************************************************************
;  * Copyright 2021-2022 Marco Spedaletti (asimov@mclink.it)
;  *
;  * Licensed under the Apache License, Version 2.0 (the "License");
;  * you may not use this file eXcept in compliance with the License.
;  * You may obtain a copy of the License at
;  *
;  * http://www.apache.org/licenses/LICENSE-2.0
;  *
;  * Unless required by applicable law or agreed to in writing, software
;  * distributed under the License is distributed on an "AS IS" BASIS,
;  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either eXpress or implied.
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
;*                           STARTUP ROUTINE ON SID                            *
;*                                                                             *
;*                             by Marco Spedaletti                             *
;*                                                                             *
;* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

IMF_INSTRUMENT_ACOUSTIC_GRAND_PIANO			= $01
IMF_INSTRUMENT_BRIGHT_ACOUSTIC_PIANO			= $02
IMF_INSTRUMENT_ELECTRIC_GRAND_PIANO			= $03
IMF_INSTRUMENT_HONKY_TONK_PIANO				= $04
IMF_INSTRUMENT_ELECTRIC_PIANO1				= $05
IMF_INSTRUMENT_ELECTRIC_PIANO2				= $06
IMF_INSTRUMENT_HARPSICHORD					= $07
IMF_INSTRUMENT_CLAVI						= $08
IMF_INSTRUMENT_CELESTA						= $09
IMF_INSTRUMENT_GLOCKENSPIEL					= $0A
IMF_INSTRUMENT_MUSIC_BOX					= $0B
IMF_INSTRUMENT_VIBRAPHONE					= $0C
IMF_INSTRUMENT_MARIMBA						= $0D
IMF_INSTRUMENT_XYLOPHONE					= $0E
IMF_INSTRUMENT_TUBULAR_BELLS				= $0F
IMF_INSTRUMENT_DULCIMER						= $10
IMF_INSTRUMENT_DRAWBAR_ORGAN				= $11
IMF_INSTRUMENT_PERCUSSIVE_ORGAN				= $12
IMF_INSTRUMENT_ROCK_ORGAN					= $13
IMF_INSTRUMENT_CHURCH_ORGAN					= $14
IMF_INSTRUMENT_REED_ORGAN					= $15
IMF_INSTRUMENT_ACCORDION					= $16
IMF_INSTRUMENT_HARMONICA					= $17
IMF_INSTRUMENT_TANGO_ACCORDION				= $18
IMF_INSTRUMENT_ACOUSTIC_GUITAR_NYLON			= $19
IMF_INSTRUMENT_ACOUSTIC_GUITAR_STEEL			= $1A
IMF_INSTRUMENT_ELECTRIC_GUITAR_JAZZ			= $1B
IMF_INSTRUMENT_ELECTRIC_GUITAR_CLEAN			= $1C
IMF_INSTRUMENT_ELECTRIC_GUITAR_MUTED			= $1D
IMF_INSTRUMENT_OVERDRIVEN_GUITAR			= $1E
IMF_INSTRUMENT_DISTORTION_GUITAR			= $1F
IMF_INSTRUMENT_GUITAR_HARMONICS				= $20
IMF_INSTRUMENT_ACOUSTIC_BASS				= $21
IMF_INSTRUMENT_ELECTRIC_BASS_FINGER			= $22
IMF_INSTRUMENT_ELECTRIC_BASS_PICK			= $23
IMF_INSTRUMENT_FRETLESS_BASS				= $24
IMF_INSTRUMENT_SLAP_BASS_1					= $25
IMF_INSTRUMENT_SLAP_BASS_2					= $26
IMF_INSTRUMENT_SYNTH_BASS_1					= $27
IMF_INSTRUMENT_SYNTH_BASS_2					= $28
IMF_INSTRUMENT_VIOLIN						= $29
IMF_INSTRUMENT_VIOLA						= $2A
IMF_INSTRUMENT_CELLO						= $2B
IMF_INSTRUMENT_CONTRABASS					= $2C
IMF_INSTRUMENT_TREMOLO_STRINGS				= $2D
IMF_INSTRUMENT_PIZZICATO_STRINGS			= $2E
IMF_INSTRUMENT_ORCHESTRAL_HARP				= $2F
IMF_INSTRUMENT_TIMPANI						= $30
IMF_INSTRUMENT_STRING_ENSEMBLE_1			= $31
IMF_INSTRUMENT_STRING_ENSEMBLE_2			= $32
IMF_INSTRUMENT_SYNTHSTRINGS_1				= $33
IMF_INSTRUMENT_SYNTHSTRINGS_2				= $34
IMF_INSTRUMENT_CHOIR_AAHS					= $35
IMF_INSTRUMENT_VOICE_OOHS					= $36
IMF_INSTRUMENT_SYNTH_VOICE					= $37
IMF_INSTRUMENT_ORCHESTRA_HIT				= $38
IMF_INSTRUMENT_TRUMPET						= $39
IMF_INSTRUMENT_TROMBONE						= $3A
IMF_INSTRUMENT_TUBA							= $3B
IMF_INSTRUMENT_MUTED_TRUMPET				= $3C
IMF_INSTRUMENT_FRENCH_HORN					= $3D
IMF_INSTRUMENT_BRASS_SECTION				= $3E
IMF_INSTRUMENT_SYNTHBRASS_1					= $3F
IMF_INSTRUMENT_SYNTHBRASS_2					= $40
IMF_INSTRUMENT_SOPRANO_SAX					= $41
IMF_INSTRUMENT_ALTO_SAX						= $42
IMF_INSTRUMENT_TENOR_SAX					= $43
IMF_INSTRUMENT_BARITONE_SAX					= $44
IMF_INSTRUMENT_OBOE							= $45
IMF_INSTRUMENT_ENGLISH_HORN					= $46
IMF_INSTRUMENT_BASSOON						= $47
IMF_INSTRUMENT_CLARINET						= $48
IMF_INSTRUMENT_PICCOLO						= $49
IMF_INSTRUMENT_FLUTE						= $4A
IMF_INSTRUMENT_RECORDER						= $4B
IMF_INSTRUMENT_PAN_FLUTE					= $4C
IMF_INSTRUMENT_BLOWN_BOTTLE					= $4D
IMF_INSTRUMENT_SHAKUHACHI					= $4E
IMF_INSTRUMENT_WHISTLE						= $4F
IMF_INSTRUMENT_OCARINA						= $50
IMF_INSTRUMENT_LEAD_1_SQUARE				= $51
IMF_INSTRUMENT_LEAD_2_SAWTOOTH				= $52
IMF_INSTRUMENT_LEAD_3_CALLIOPE				= $53
IMF_INSTRUMENT_LEAD_4_CHIFF					= $54
IMF_INSTRUMENT_LEAD_5_CHARANG				= $55
IMF_INSTRUMENT_LEAD_6_VOICE					= $56
IMF_INSTRUMENT_LEAD_7_FIFTHS				= $57
IMF_INSTRUMENT_LEAD_8_BASS_LEAD				= $58
IMF_INSTRUMENT_PAD_1_NEW_AGE				= $59
IMF_INSTRUMENT_PAD_2_WARM					= $5A
IMF_INSTRUMENT_PAD_3_POLYSYNTH				= $5B
IMF_INSTRUMENT_PAD_4_CHOIR					= $5C
IMF_INSTRUMENT_PAD_5_BOWED					= $5D
IMF_INSTRUMENT_PAD_6_METALLIC				= $5E
IMF_INSTRUMENT_PAD_7_HALO					= $5F
IMF_INSTRUMENT_PAD_8_SWEEP					= $60
IMF_INSTRUMENT_FX_1_RAIN					= $61
IMF_INSTRUMENT_FX_2_SOUNDTRACK				= $62
IMF_INSTRUMENT_FX_3_CRYSTAL					= $63
IMF_INSTRUMENT_FX_4_ATMOSPHERE				= $64
IMF_INSTRUMENT_FX_5_BRIGHTNESS				= $65
IMF_INSTRUMENT_FX_6_GOBLINS					= $66
IMF_INSTRUMENT_FX_7_ECHOES					= $67
IMF_INSTRUMENT_FX_8_SCI_FI					= $68
IMF_INSTRUMENT_SITAR						= $69
IMF_INSTRUMENT_BANJO						= $6A
IMF_INSTRUMENT_SHAMISEN						= $6B
IMF_INSTRUMENT_KOTO							= $6C
IMF_INSTRUMENT_KALIMBA						= $6D
IMF_INSTRUMENT_BAG_PIPE						= $6E
IMF_INSTRUMENT_FIDDLE						= $6F
IMF_INSTRUMENT_SHANAI						= $70
IMF_INSTRUMENT_TINKLE_BELL					= $71
IMF_INSTRUMENT_AGOGO						= $72
IMF_INSTRUMENT_STEEL_DRUMS					= $73
IMF_INSTRUMENT_WOODBLOCK					= $74
IMF_INSTRUMENT_TAIKO_DRUM					= $75
IMF_INSTRUMENT_MELODIC_TOM					= $76
IMF_INSTRUMENT_SYNTH_DRUM					= $77
IMF_INSTRUMENT_REVERSE_CYMBAL				= $78
IMF_INSTRUMENT_GUITAR_FRET_NOISE			= $79
IMF_INSTRUMENT_BREATH_NOISE					= $7A
IMF_INSTRUMENT_SEASHORE						= $7B
IMF_INSTRUMENT_BIRD_TWEET					= $7C
IMF_INSTRUMENT_TELEPHONE_RING				= $7D
IMF_INSTRUMENT_HELICOPTER					= $7E
IMF_INSTRUMENT_APPLAUSE						= $7F
IMF_INSTRUMENT_GUNSHOT						= $80

SIDSTARTUP:
    RTS

SIDSTART:
    AND #3
    CMP #0
    BEQ SIDSTART0
    CMP #1
    BEQ SIDSTART1
    JMP SIDSTART2

SIDSTART0:
    ; 65, 129
    LDA #33
    STA $D404
    LDA #97
    STA $D405
    LDA #200
    STA $D406
    JMP SIDSTARTVOL

SIDSTART1:
    ; 65, 129
    LDA #33
    STA $D40B
    LDA #97
    STA $D40C
    LDA #200
    STA $D40D
    JMP SIDSTARTVOL

SIDSTART2:
    ; 65, 129
    LDA #33
    STA $D412
    LDA #97
    STA $D413
    LDA #200
    STA $D414
    JMP SIDSTARTVOL

SIDSTARTVOL:
    LDA #15
    STA $D418
    RTS

SIDSETFREQ:
    AND #3
    CMP #0
    BEQ SIDSETFREQ0
    CMP #1
    BEQ SIDSETFREQ1
    JMP SIDSETFREQ2

SIDSETFREQ0:
    STX $D400
    STY $D401
    RTS    

SIDSETFREQ1:
    STX $D407
    STY $D408
    RTS    

SIDSETFREQ2:
    STX $D40E
    STY $D40F
    RTS

SIDPROGFREQ:
    AND #3
    CMP #0
    BEQ SIDPROGFREQ0
    CMP #1
    BEQ SIDPROGFREQ1
    JMP SIDPROGFREQ2

SIDPROGFREQ0:
    STX $D400
    STY $D401
    LDA SIDSHADOW
    ORA #$1
    STA SIDSHADOW
    STA $D404
    RTS

SIDPROGFREQ1:
    STX $D407
    STY $D408
    LDA SIDSHADOW+1
    ORA #$1
    STA SIDSHADOW+1
    STA $D40B
    RTS

SIDPROGFREQ2:
    STX $D40E
    STY $D40F
    LDA SIDSHADOW+2
    ORA #$1
    STA SIDSHADOW+2
    STA $D412
    RTS

SIDPROGPULSE:
    AND #3
    CMP #0
    BEQ SIDPROGPULSE0
    CMP #1
    BEQ SIDPROGPULSE1
    JMP SIDPROGPULSE2

SIDPROGPULSE0:
    STX $D402
    STY $D403
    LDA #$40
    STA SIDSHADOW
    STA $D404
    RTS

SIDPROGPULSE1:
    STX $D409
    STY $D40A
    LDA #$40
    STA SIDSHADOW+1
    STA $D40B
    RTS

SIDPROGPULSE2:
    STX $D410
    STY $D411
    LDA #$40
    STA SIDSHADOW+2
    STA $D412
    RTS

SIDPROGCTR:
    AND #3
    CMP #0
    BEQ SIDPROGCTR0
    CMP #1
    BEQ SIDPROGCTR1
    JMP SIDPROGCTR2

SIDPROGCTR0:
    STX SIDSHADOW
    STX $D404
    RTS

SIDPROGCTR1:
    STX SIDSHADOW+1
    STX $D40B
    RTS

SIDPROGCTR2:
    STX SIDSHADOW+2
    STX $D412
    RTS

SIDPROGAD:
    AND #3
    CMP #0
    BEQ SIDPROGAD0
    CMP #1
    BEQ SIDPROGAD1
    JMP SIDPROGAD2

SIDPROGAD0:
    TXA
    ASL
    ASL
    ASL
    ASL
    STA MATHPTR0
    TYA
    AND #$0F
    ORA MATHPTR0
    STA $D405
    RTS

SIDPROGAD1:
    TXA
    ASL
    ASL
    ASL
    ASL
    STA MATHPTR0
    TYA
    AND #$0F
    ORA MATHPTR0
    STA $D40C
    RTS

SIDPROGAD2:
    TXA
    ASL
    ASL
    ASL
    ASL
    STA MATHPTR0
    TYA
    AND #$0F
    ORA MATHPTR0
    STA $D413
    RTS

SIDPROGSR:
    AND #3
    CMP #0
    BEQ SIDPROGSR0
    CMP #1
    BEQ SIDPROGSR1
    JMP SIDPROGSR2

SIDPROGSR0:
    TXA
    ASL
    ASL
    ASL
    ASL
    STA MATHPTR0
    TYA
    AND #$0F
    ORA MATHPTR0
    STA $D406
    RTS

SIDPROGSR1:
    TXA
    ASL
    ASL
    ASL
    ASL
    STA MATHPTR0
    TYA
    AND #$0F
    ORA MATHPTR0
    STA $D40D
    RTS

SIDPROGSR2:
    TXA
    ASL
    ASL
    ASL
    ASL
    STA MATHPTR0
    TYA
    AND #$0F
    ORA MATHPTR0
    STA $D414
    RTS

SIDSTOP:
    AND #3
    CMP #0
    BEQ SIDSTOP0
    CMP #1
    BEQ SIDSTOP1
    JMP SIDSTOP2

SIDSTOP0:
    LDA SIDSHADOW
    AND #$FE
    STA SIDSHADOW
    STA $D404
    RTS

SIDSTOP1:
    LDA SIDSHADOW+1
    AND #$FE
    STA SIDSHADOW+1
    STA $D40B
    RTS

SIDSTOP2:
    LDA SIDSHADOW+2
    AND #$FE
    STA SIDSHADOW+2
    STA $D412
    RTS
