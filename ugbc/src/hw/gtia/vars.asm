; /*****************************************************************************
;  * ugBASIC - an isomorphic BASIC language compiler for retrocomputers        *
;  *****************************************************************************
;  * Copyright 2021-2022 Marco Spedaletti (asimov@mclink.it)
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
;*                      INTERNAL VARIABLES FOR GTIA HARDWARE                   *
;*                                                                             *
;*                             by Marco Spedaletti                             *
;*                                                                             *
;* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

PLOTDEST = $8a ; $8b
PLOTCDEST= $8c ; $8d
PLOTLDEST= $8e ; $8f

PLOTVBASELO:
    .byte <($A000+(0*320)),<($A000+(1*320)),<($A000+(2*320)),<($A000+(3*320))
    .byte <($A000+(4*320)),<($A000+(5*320)),<($A000+(6*320)),<($A000+(7*320))
    .byte <($A000+(8*320)),<($A000+(9*320)),<($A000+(10*320)),<($A000+(11*320))
    .byte <($A000+(12*320)),<($A000+(13*320)),<($A000+(14*320)),<($A000+(15*320))
    .byte <($A000+(16*320)),<($A000+(17*320)),<($A000+(18*320)),<($A000+(19*320))
    .byte <($A000+(20*320)),<($A000+(21*320)),<($A000+(22*320)),<($A000+(23*320))
    .byte <($A000+(24*320))

PLOTVBASEHI:
    .byte >($A000+(0*320)),>($A000+(1*320)),>($A000+(2*320)),>($A000+(3*320))
    .byte >($A000+(4*320)),>($A000+(5*320)),>($A000+(6*320)),>($A000+(7*320))
    .byte >($A000+(8*320)),>($A000+(9*320)),>($A000+(10*320)),>($A000+(11*320))
    .byte >($A000+(12*320)),>($A000+(13*320)),>($A000+(14*320)),>($A000+(15*320))
    .byte >($A000+(16*320)),>($A000+(17*320)),>($A000+(18*320)),>($A000+(19*320))
    .byte >($A000+(20*320)),>($A000+(21*320)),>($A000+(22*320)),>($A000+(23*320))
    .byte >($A000+(24*320))

PLOT8LO:
    .byte <(0*8),<(1*8),<(2*8),<(3*8),<(4*8),<(5*8),<(6*8),<(7*8),<(8*8),<(9*8)
    .byte <(10*8),<(11*8),<(12*8),<(13*8),<(14*8),<(15*8),<(16*8),<(17*8),<(18*8),<(19*8)
    .byte <(20*8),<(21*8),<(22*8),<(23*8),<(24*8),<(25*8),<(26*8),<(27*8),<(28*8),<(29*8)
    .byte <(30*8),<(31*8),<(32*8),<(33*8),<(34*8),<(35*8),<(36*8),<(37*8),<(38*8),<(39*8)

PLOT8HI:
    .byte >(0*8),>(1*8),>(2*8),>(3*8),>(4*8),>(5*8),>(6*8),>(7*8),>(8*8),>(9*8)
    .byte >(10*8),>(11*8),>(12*8),>(13*8),>(14*8),>(15*8),>(16*8),>(17*8),>(18*8),>(19*8)
    .byte >(20*8),>(21*8),>(22*8),>(23*8),>(24*8),>(25*8),>(26*8),>(27*8),>(28*8),>(29*8)
    .byte >(30*8),>(31*8),>(32*8),>(33*8),>(34*8),>(35*8),>(36*8),>(37*8),>(38*8),>(39*8)

PLOT4LO:
    .byte <(0),<(1),<(2),<(3)
    .byte <(4),<(5),<(6),<(7)
    .byte <(8),<(9)
    

PLOT4HI:
    .byte >(0),>(1),>(2),>(3)
    .byte >(4),>(5),>(6),>(7)
    .byte >(8),>(9)

PLOT4VBASELO:
    .byte <($A000+(0*10)),<($A000+(1*10)),<($A000+(2*10)),<($A000+(3*10))
    .byte <($A000+(4*10)),<($A000+(5*10)),<($A000+(6*10)),<($A000+(7*10))
    .byte <($A000+(8*10)),<($A000+(9*10)),<($A000+(10*10)),<($A000+(11*10))
    .byte <($A000+(12*10)),<($A000+(13*10)),<($A000+(14*10)),<($A000+(15*10))
    .byte <($A000+(16*10)),<($A000+(17*10)),<($A000+(18*10)),<($A000+(19*10))
    .byte <($A000+(20*10)),<($A000+(21*10)),<($A000+(22*10)),<($A000+(23*10))
    .byte <($A000+(24*10)),<($A000+(25*10)),<($A000+(26*10)),<($A000+(27*10))
    .byte <($A000+(28*10)),<($A000+(29*10)),<($A000+(30*10)),<($A000+(31*10))
    .byte <($A000+(32*10)),<($A000+(33*10)),<($A000+(34*10)),<($A000+(35*10))
    .byte <($A000+(36*10)),<($A000+(37*10)),<($A000+(38*10)),<($A000+(39*10))
    .byte <($A000+(40*10)),<($A000+(41*10)),<($A000+(42*10)),<($A000+(43*10))
    .byte <($A000+(44*10)),<($A000+(45*10)),<($A000+(46*10)),<($A000+(47*10))

PLOT4VBASEHI:
    .byte >($A000+(0*10)),>($A000+(1*10)),>($A000+(2*10)),>($A000+(3*10))
    .byte >($A000+(4*10)),>($A000+(5*10)),>($A000+(6*10)),>($A000+(7*10))
    .byte >($A000+(8*10)),>($A000+(9*10)),>($A000+(10*10)),>($A000+(11*10))
    .byte >($A000+(12*10)),>($A000+(13*10)),>($A000+(14*10)),>($A000+(15*10))
    .byte >($A000+(16*10)),>($A000+(17*10)),>($A000+(18*10)),>($A000+(19*10))
    .byte >($A000+(20*10)),>($A000+(21*10)),>($A000+(22*10)),>($A000+(23*10))
    .byte >($A000+(24*10)),>($A000+(25*10)),>($A000+(26*10)),>($A000+(27*10))
    .byte >($A000+(28*10)),>($A000+(29*10)),>($A000+(30*10)),>($A000+(31*10))
    .byte >($A000+(32*10)),>($A000+(33*10)),>($A000+(34*10)),>($A000+(35*10))
    .byte >($A000+(36*10)),>($A000+(37*10)),>($A000+(38*10)),>($A000+(39*10))
    .byte >($A000+(40*10)),>($A000+(41*10)),>($A000+(42*10)),>($A000+(43*10))
    .byte >($A000+(44*10)),>($A000+(45*10)),>($A000+(46*10)),>($A000+(47*10))

PLOT5VBASELO:
    .byte <($A000+(0*20)),<($A000+(1*20)),<($A000+(2*20)),<($A000+(3*20))
    .byte <($A000+(4*20)),<($A000+(5*20)),<($A000+(6*20)),<($A000+(7*20))
    .byte <($A000+(8*20)),<($A000+(9*20)),<($A000+(10*20)),<($A000+(11*20))
    .byte <($A000+(12*20)),<($A000+(13*20)),<($A000+(14*20)),<($A000+(15*20))
    .byte <($A000+(16*20)),<($A000+(17*20)),<($A000+(18*20)),<($A000+(19*20))
    .byte <($A000+(20*20)),<($A000+(21*20)),<($A000+(22*20)),<($A000+(23*20))
    .byte <($A000+(24*20)),<($A000+(25*20)),<($A000+(26*20)),<($A000+(27*20))
    .byte <($A000+(28*20)),<($A000+(29*20)),<($A000+(30*20)),<($A000+(31*20))
    .byte <($A000+(32*20)),<($A000+(33*20)),<($A000+(34*20)),<($A000+(35*20))
    .byte <($A000+(36*20)),<($A000+(37*20)),<($A000+(38*20)),<($A000+(39*20))
    .byte <($A000+(40*20)),<($A000+(41*20)),<($A000+(42*20)),<($A000+(43*20))
    .byte <($A000+(44*20)),<($A000+(45*20)),<($A000+(46*20)),<($A000+(47*20))
    .byte <($A000+(48*20)),<($A000+(49*20)),<($A000+(50*20)),<($A000+(51*20))
    .byte <($A000+(52*20)),<($A000+(53*20)),<($A000+(54*20)),<($A000+(55*20))
    .byte <($A000+(56*20)),<($A000+(57*20)),<($A000+(58*20)),<($A000+(59*20))
    .byte <($A000+(60*20)),<($A000+(61*20)),<($A000+(62*20)),<($A000+(63*20))
    .byte <($A000+(64*20)),<($A000+(65*20)),<($A000+(66*20)),<($A000+(67*20))
    .byte <($A000+(68*20)),<($A000+(69*20)),<($A000+(70*20)),<($A000+(71*20))
    .byte <($A000+(72*20)),<($A000+(73*20)),<($A000+(74*20)),<($A000+(75*20))
    .byte <($A000+(76*20)),<($A000+(77*20)),<($A000+(78*20)),<($A000+(79*20))
    .byte <($A000+(80*20)),<($A000+(81*20)),<($A000+(82*20)),<($A000+(83*20))
    .byte <($A000+(84*20)),<($A000+(85*20)),<($A000+(86*20)),<($A000+(87*20))
    .byte <($A000+(88*20)),<($A000+(89*20)),<($A000+(90*20)),<($A000+(91*20))
    .byte <($A000+(92*20)),<($A000+(93*20)),<($A000+(94*20)),<($A000+(95*20))
    .byte <($A000+(96*20)),<($A000+(97*20)),<($A000+(98*20)),<($A000+(99*20))
    .byte <($A000+(100*20)),<($A000+(101*20)),<($A000+(102*20)),<($A000+(103*20))
    .byte <($A000+(104*20)),<($A000+(105*20)),<($A000+(106*20)),<($A000+(107*20))
    .byte <($A000+(108*20)),<($A000+(109*20)),<($A000+(110*20)),<($A000+(111*20))
    .byte <($A000+(112*20)),<($A000+(113*20)),<($A000+(114*20)),<($A000+(115*20))
    .byte <($A000+(112*20)),<($A000+(113*20)),<($A000+(114*20)),<($A000+(115*20))
    .byte <($A000+(116*20)),<($A000+(117*20)),<($A000+(118*20)),<($A000+(119*20))
    .byte <($A000+(120*20)),<($A000+(121*20)),<($A000+(122*20)),<($A000+(123*20))
    .byte <($A000+(124*20)),<($A000+(125*20)),<($A000+(126*20)),<($A000+(127*20))
    .byte <($A000+(128*20)),<($A000+(129*20)),<($A000+(130*20)),<($A000+(131*20))
    .byte <($A000+(132*20)),<($A000+(133*20)),<($A000+(134*20)),<($A000+(135*20))
    .byte <($A000+(136*20)),<($A000+(137*20)),<($A000+(138*20)),<($A000+(139*20))
    .byte <($A000+(140*20)),<($A000+(141*20)),<($A000+(142*20)),<($A000+(143*20))
    .byte <($A000+(144*20)),<($A000+(145*20)),<($A000+(146*20)),<($A000+(147*20))
    .byte <($A000+(148*20)),<($A000+(149*20)),<($A000+(150*20)),<($A000+(151*20))
    .byte <($A000+(152*20)),<($A000+(153*20)),<($A000+(154*20)),<($A000+(155*20))
    .byte <($A000+(156*20)),<($A000+(157*20)),<($A000+(158*20)),<($A000+(159*20))
    .byte <($A000+(160*20)),<($A000+(161*20)),<($A000+(162*20)),<($A000+(163*20))
    .byte <($A000+(164*20)),<($A000+(165*20)),<($A000+(166*20)),<($A000+(167*20))
    .byte <($A000+(168*20)),<($A000+(169*20)),<($A000+(170*20)),<($A000+(171*20))
    .byte <($A000+(172*20)),<($A000+(173*20)),<($A000+(174*20)),<($A000+(175*20))
    .byte <($A000+(176*20)),<($A000+(177*20)),<($A000+(178*20)),<($A000+(179*20))
    .byte <($A000+(180*20)),<($A000+(181*20)),<($A000+(182*20)),<($A000+(183*20))
    .byte <($A000+(184*20)),<($A000+(185*20)),<($A000+(186*20)),<($A000+(187*20))
    .byte <($A000+(188*20)),<($A000+(189*20)),<($A000+(190*20)),<($A000+(191*20))    

PLOT5VBASEHI:
    .byte >($A000+(0*20)),>($A000+(1*20)),>($A000+(2*20)),>($A000+(3*20))
    .byte >($A000+(4*20)),>($A000+(5*20)),>($A000+(6*20)),>($A000+(7*20))
    .byte >($A000+(8*20)),>($A000+(9*20)),>($A000+(10*20)),>($A000+(11*20))
    .byte >($A000+(12*20)),>($A000+(13*20)),>($A000+(14*20)),>($A000+(15*20))
    .byte >($A000+(16*20)),>($A000+(17*20)),>($A000+(18*20)),>($A000+(19*20))
    .byte >($A000+(20*20)),>($A000+(21*20)),>($A000+(22*20)),>($A000+(23*20))
    .byte >($A000+(24*20)),>($A000+(25*20)),>($A000+(26*20)),>($A000+(27*20))
    .byte >($A000+(28*20)),>($A000+(29*20)),>($A000+(30*20)),>($A000+(31*20))
    .byte >($A000+(32*20)),>($A000+(33*20)),>($A000+(34*20)),>($A000+(35*20))
    .byte >($A000+(36*20)),>($A000+(37*20)),>($A000+(38*20)),>($A000+(39*20))
    .byte >($A000+(40*20)),>($A000+(41*20)),>($A000+(42*20)),>($A000+(43*20))
    .byte >($A000+(44*20)),>($A000+(45*20)),>($A000+(46*20)),>($A000+(47*20))
    .byte >($A000+(48*20)),>($A000+(49*20)),>($A000+(50*20)),>($A000+(51*20))
    .byte >($A000+(52*20)),>($A000+(53*20)),>($A000+(54*20)),>($A000+(55*20))
    .byte >($A000+(56*20)),>($A000+(57*20)),>($A000+(58*20)),>($A000+(59*20))
    .byte >($A000+(60*20)),>($A000+(61*20)),>($A000+(62*20)),>($A000+(63*20))
    .byte >($A000+(64*20)),>($A000+(65*20)),>($A000+(66*20)),>($A000+(67*20))
    .byte >($A000+(68*20)),>($A000+(69*20)),>($A000+(70*20)),>($A000+(71*20))
    .byte >($A000+(72*20)),>($A000+(73*20)),>($A000+(74*20)),>($A000+(75*20))
    .byte >($A000+(76*20)),>($A000+(77*20)),>($A000+(78*20)),>($A000+(79*20))
    .byte >($A000+(80*20)),>($A000+(81*20)),>($A000+(82*20)),>($A000+(83*20))
    .byte >($A000+(84*20)),>($A000+(85*20)),>($A000+(86*20)),>($A000+(87*20))
    .byte >($A000+(88*20)),>($A000+(89*20)),>($A000+(90*20)),>($A000+(91*20))
    .byte >($A000+(92*20)),>($A000+(93*20)),>($A000+(94*20)),>($A000+(95*20))
    .byte >($A000+(96*20)),>($A000+(97*20)),>($A000+(98*20)),>($A000+(99*20))
    .byte >($A000+(100*20)),>($A000+(101*20)),>($A000+(102*20)),>($A000+(103*20))
    .byte >($A000+(104*20)),>($A000+(105*20)),>($A000+(106*20)),>($A000+(107*20))
    .byte >($A000+(108*20)),>($A000+(109*20)),>($A000+(110*20)),>($A000+(111*20))
    .byte >($A000+(112*20)),>($A000+(113*20)),>($A000+(114*20)),>($A000+(115*20))
    .byte >($A000+(112*20)),>($A000+(113*20)),>($A000+(114*20)),>($A000+(115*20))
    .byte >($A000+(116*20)),>($A000+(117*20)),>($A000+(118*20)),>($A000+(119*20))
    .byte >($A000+(120*20)),>($A000+(121*20)),>($A000+(122*20)),>($A000+(123*20))
    .byte >($A000+(124*20)),>($A000+(125*20)),>($A000+(126*20)),>($A000+(127*20))
    .byte >($A000+(128*20)),>($A000+(129*20)),>($A000+(130*20)),>($A000+(131*20))
    .byte >($A000+(132*20)),>($A000+(133*20)),>($A000+(134*20)),>($A000+(135*20))
    .byte >($A000+(136*20)),>($A000+(137*20)),>($A000+(138*20)),>($A000+(139*20))
    .byte >($A000+(140*20)),>($A000+(141*20)),>($A000+(142*20)),>($A000+(143*20))
    .byte >($A000+(144*20)),>($A000+(145*20)),>($A000+(146*20)),>($A000+(147*20))
    .byte >($A000+(148*20)),>($A000+(149*20)),>($A000+(150*20)),>($A000+(151*20))
    .byte >($A000+(152*20)),>($A000+(153*20)),>($A000+(154*20)),>($A000+(155*20))
    .byte >($A000+(156*20)),>($A000+(157*20)),>($A000+(158*20)),>($A000+(159*20))
    .byte >($A000+(160*20)),>($A000+(161*20)),>($A000+(162*20)),>($A000+(163*20))
    .byte >($A000+(164*20)),>($A000+(165*20)),>($A000+(166*20)),>($A000+(167*20))
    .byte >($A000+(168*20)),>($A000+(169*20)),>($A000+(170*20)),>($A000+(171*20))
    .byte >($A000+(172*20)),>($A000+(173*20)),>($A000+(174*20)),>($A000+(175*20))
    .byte >($A000+(176*20)),>($A000+(177*20)),>($A000+(178*20)),>($A000+(179*20))
    .byte >($A000+(180*20)),>($A000+(181*20)),>($A000+(182*20)),>($A000+(183*20))
    .byte >($A000+(184*20)),>($A000+(185*20)),>($A000+(186*20)),>($A000+(187*20))
    .byte >($A000+(188*20)),>($A000+(189*20)),>($A000+(190*20)),>($A000+(191*20))    

PLOT6VBASELO:
    .byte <($A000+(0*40)),<($A000+(1*40)),<($A000+(2*40)),<($A000+(3*40))
    .byte <($A000+(4*40)),<($A000+(5*40)),<($A000+(6*40)),<($A000+(7*40))
    .byte <($A000+(8*40)),<($A000+(9*40)),<($A000+(10*40)),<($A000+(11*40))
    .byte <($A000+(12*40)),<($A000+(13*40)),<($A000+(14*40)),<($A000+(15*40))
    .byte <($A000+(16*40)),<($A000+(17*40)),<($A000+(18*40)),<($A000+(19*40))
    .byte <($A000+(20*40)),<($A000+(21*40)),<($A000+(22*40)),<($A000+(23*40))
    .byte <($A000+(24*40)),<($A000+(25*40)),<($A000+(26*40)),<($A000+(27*40))
    .byte <($A000+(28*40)),<($A000+(29*40)),<($A000+(30*40)),<($A000+(31*40))
    .byte <($A000+(32*40)),<($A000+(33*40)),<($A000+(34*40)),<($A000+(35*40))
    .byte <($A000+(36*40)),<($A000+(37*40)),<($A000+(38*40)),<($A000+(39*40))
    .byte <($A000+(40*40)),<($A000+(41*40)),<($A000+(42*40)),<($A000+(43*40))
    .byte <($A000+(44*40)),<($A000+(45*40)),<($A000+(46*40)),<($A000+(47*40))
    .byte <($A000+(48*40)),<($A000+(49*40)),<($A000+(50*40)),<($A000+(51*40))
    .byte <($A000+(52*40)),<($A000+(53*40)),<($A000+(54*40)),<($A000+(55*40))
    .byte <($A000+(56*40)),<($A000+(57*40)),<($A000+(58*40)),<($A000+(59*40))
    .byte <($A000+(60*40)),<($A000+(61*40)),<($A000+(62*40)),<($A000+(63*40))
    .byte <($A000+(64*40)),<($A000+(65*40)),<($A000+(66*40)),<($A000+(67*40))
    .byte <($A000+(68*40)),<($A000+(69*40)),<($A000+(70*40)),<($A000+(71*40))
    .byte <($A000+(72*40)),<($A000+(73*40)),<($A000+(74*40)),<($A000+(75*40))
    .byte <($A000+(76*40)),<($A000+(77*40)),<($A000+(78*40)),<($A000+(79*40))
    .byte <($A000+(80*40)),<($A000+(81*40)),<($A000+(82*40)),<($A000+(83*40))
    .byte <($A000+(84*40)),<($A000+(85*40)),<($A000+(86*40)),<($A000+(87*40))
    .byte <($A000+(88*40)),<($A000+(89*40)),<($A000+(90*40)),<($A000+(91*40))
    .byte <($A000+(92*40)),<($A000+(93*40)),<($A000+(94*40)),<($A000+(95*40))
    .byte <($A000+(96*40)),<($A000+(97*40)),<($A000+(98*40)),<($A000+(99*40))
    .byte <($A000+(100*40)),<($A000+(101*40)),<($A000+(102*40)),<($A000+(103*40))
    .byte <($A000+(104*40)),<($A000+(105*40)),<($A000+(106*40)),<($A000+(107*40))
    .byte <($A000+(108*40)),<($A000+(109*40)),<($A000+(110*40)),<($A000+(111*40))
    .byte <($A000+(112*40)),<($A000+(113*40)),<($A000+(114*40)),<($A000+(115*40))
    .byte <($A000+(112*40)),<($A000+(113*40)),<($A000+(114*40)),<($A000+(115*40))
    .byte <($A000+(116*40)),<($A000+(117*40)),<($A000+(118*40)),<($A000+(119*40))
    .byte <($A000+(120*40)),<($A000+(121*40)),<($A000+(122*40)),<($A000+(123*40))
    .byte <($A000+(124*40)),<($A000+(125*40)),<($A000+(126*40)),<($A000+(127*40))
    .byte <($A000+(128*40)),<($A000+(129*40)),<($A000+(130*40)),<($A000+(131*40))
    .byte <($A000+(132*40)),<($A000+(133*40)),<($A000+(134*40)),<($A000+(135*40))
    .byte <($A000+(136*40)),<($A000+(137*40)),<($A000+(138*40)),<($A000+(139*40))
    .byte <($A000+(140*40)),<($A000+(141*40)),<($A000+(142*40)),<($A000+(143*40))
    .byte <($A000+(144*40)),<($A000+(145*40)),<($A000+(146*40)),<($A000+(147*40))
    .byte <($A000+(148*40)),<($A000+(149*40)),<($A000+(150*40)),<($A000+(151*40))
    .byte <($A000+(152*40)),<($A000+(153*40)),<($A000+(154*40)),<($A000+(155*40))
    .byte <($A000+(156*40)),<($A000+(157*40)),<($A000+(158*40)),<($A000+(159*40))
    .byte <($A000+(160*40)),<($A000+(161*40)),<($A000+(162*40)),<($A000+(163*40))
    .byte <($A000+(164*40)),<($A000+(165*40)),<($A000+(166*40)),<($A000+(167*40))
    .byte <($A000+(168*40)),<($A000+(169*40)),<($A000+(170*40)),<($A000+(171*40))
    .byte <($A000+(172*40)),<($A000+(173*40)),<($A000+(174*40)),<($A000+(175*40))
    .byte <($A000+(176*40)),<($A000+(177*40)),<($A000+(178*40)),<($A000+(179*40))
    .byte <($A000+(180*40)),<($A000+(181*40)),<($A000+(182*40)),<($A000+(183*40))
    .byte <($A000+(184*40)),<($A000+(185*40)),<($A000+(186*40)),<($A000+(187*40))
    .byte <($A000+(188*40)),<($A000+(189*40)),<($A000+(190*40)),<($A000+(191*40))    
    

PLOT6VBASEHI:
    .byte >($A000+(0*40)),>($A000+(1*40)),>($A000+(2*40)),>($A000+(3*40))
    .byte >($A000+(4*40)),>($A000+(5*40)),>($A000+(6*40)),>($A000+(7*40))
    .byte >($A000+(8*40)),>($A000+(9*40)),>($A000+(10*40)),>($A000+(11*40))
    .byte >($A000+(12*40)),>($A000+(13*40)),>($A000+(14*40)),>($A000+(15*40))
    .byte >($A000+(16*40)),>($A000+(17*40)),>($A000+(18*40)),>($A000+(19*40))
    .byte >($A000+(20*40)),>($A000+(21*40)),>($A000+(22*40)),>($A000+(23*40))
    .byte >($A000+(24*40)),>($A000+(25*40)),>($A000+(26*40)),>($A000+(27*40))
    .byte >($A000+(28*40)),>($A000+(29*40)),>($A000+(30*40)),>($A000+(31*40))
    .byte >($A000+(32*40)),>($A000+(33*40)),>($A000+(34*40)),>($A000+(35*40))
    .byte >($A000+(36*40)),>($A000+(37*40)),>($A000+(38*40)),>($A000+(39*40))
    .byte >($A000+(40*40)),>($A000+(41*40)),>($A000+(42*40)),>($A000+(43*40))
    .byte >($A000+(44*40)),>($A000+(45*40)),>($A000+(46*40)),>($A000+(47*40))
    .byte >($A000+(48*40)),>($A000+(49*40)),>($A000+(50*40)),>($A000+(51*40))
    .byte >($A000+(52*40)),>($A000+(53*40)),>($A000+(54*40)),>($A000+(55*40))
    .byte >($A000+(56*40)),>($A000+(57*40)),>($A000+(58*40)),>($A000+(59*40))
    .byte >($A000+(60*40)),>($A000+(61*40)),>($A000+(62*40)),>($A000+(63*40))
    .byte >($A000+(64*40)),>($A000+(65*40)),>($A000+(66*40)),>($A000+(67*40))
    .byte >($A000+(68*40)),>($A000+(69*40)),>($A000+(70*40)),>($A000+(71*40))
    .byte >($A000+(72*40)),>($A000+(73*40)),>($A000+(74*40)),>($A000+(75*40))
    .byte >($A000+(76*40)),>($A000+(77*40)),>($A000+(78*40)),>($A000+(79*40))
    .byte >($A000+(80*40)),>($A000+(81*40)),>($A000+(82*40)),>($A000+(83*40))
    .byte >($A000+(84*40)),>($A000+(85*40)),>($A000+(86*40)),>($A000+(87*40))
    .byte >($A000+(88*40)),>($A000+(89*40)),>($A000+(90*40)),>($A000+(91*40))
    .byte >($A000+(92*40)),>($A000+(93*40)),>($A000+(94*40)),>($A000+(95*40))
    .byte >($A000+(96*40)),>($A000+(97*40)),>($A000+(98*40)),>($A000+(99*40))
    .byte >($A000+(100*40)),>($A000+(101*40)),>($A000+(102*40)),>($A000+(103*40))
    .byte >($A000+(104*40)),>($A000+(105*40)),>($A000+(106*40)),>($A000+(107*40))
    .byte >($A000+(108*40)),>($A000+(109*40)),>($A000+(110*40)),>($A000+(111*40))
    .byte >($A000+(112*40)),>($A000+(113*40)),>($A000+(114*40)),>($A000+(115*40))
    .byte >($A000+(112*40)),>($A000+(113*40)),>($A000+(114*40)),>($A000+(115*40))
    .byte >($A000+(116*40)),>($A000+(117*40)),>($A000+(118*40)),>($A000+(119*40))
    .byte >($A000+(120*40)),>($A000+(121*40)),>($A000+(122*40)),>($A000+(123*40))
    .byte >($A000+(124*40)),>($A000+(125*40)),>($A000+(126*40)),>($A000+(127*40))
    .byte >($A000+(128*40)),>($A000+(129*40)),>($A000+(130*40)),>($A000+(131*40))
    .byte >($A000+(132*40)),>($A000+(133*40)),>($A000+(134*40)),>($A000+(135*40))
    .byte >($A000+(136*40)),>($A000+(137*40)),>($A000+(138*40)),>($A000+(139*40))
    .byte >($A000+(140*40)),>($A000+(141*40)),>($A000+(142*40)),>($A000+(143*40))
    .byte >($A000+(144*40)),>($A000+(145*40)),>($A000+(146*40)),>($A000+(147*40))
    .byte >($A000+(148*40)),>($A000+(149*40)),>($A000+(150*40)),>($A000+(151*40))
    .byte >($A000+(152*40)),>($A000+(153*40)),>($A000+(154*40)),>($A000+(155*40))
    .byte >($A000+(156*40)),>($A000+(157*40)),>($A000+(158*40)),>($A000+(159*40))
    .byte >($A000+(160*40)),>($A000+(161*40)),>($A000+(162*40)),>($A000+(163*40))
    .byte >($A000+(164*40)),>($A000+(165*40)),>($A000+(166*40)),>($A000+(167*40))
    .byte >($A000+(168*40)),>($A000+(169*40)),>($A000+(170*40)),>($A000+(171*40))
    .byte >($A000+(172*40)),>($A000+(173*40)),>($A000+(174*40)),>($A000+(175*40))
    .byte >($A000+(176*40)),>($A000+(177*40)),>($A000+(178*40)),>($A000+(179*40))
    .byte >($A000+(180*40)),>($A000+(181*40)),>($A000+(182*40)),>($A000+(183*40))
    .byte >($A000+(184*40)),>($A000+(185*40)),>($A000+(186*40)),>($A000+(187*40))
    .byte >($A000+(188*40)),>($A000+(189*40)),>($A000+(190*40)),>($A000+(191*40))    


XGR:    .word 0
YGR:    .word 0
LINE:   .byte $ff, $ff

CLIPX1:    .word 0
CLIPY1:    .word 0
CLIPX2:    .word 319
CLIPY2:    .word 199

CURRENTWIDTH:      .word 40
CURRENTHEIGHT:      .word 24
CURRENTTILESWIDTH:      .byte 40
CURRENTTILESHEIGHT:      .byte 24
CURRENTTILES:      .byte 255
TEXTBLOCKREMAIN:      .byte 152
TEXTBLOCKREMAINPW:      .byte 192
CURRENTSL:          .byte 0
TEXTWW:             .byte 3
FONTWIDTH:          .byte 8
FONTHEIGHT:         .byte 8
IMAGEX = $F0
IMAGEY = $F2
IMAGEW = $F4
IMAGEH = $F6
IMAGEH2 = $F8
IMAGET = $F9

XSCROLLPOS:         .byte 0
YSCROLLPOS:         .byte 0
XSCROLL:            .byte 0
YSCROLL:            .byte 0

YSCROLLOFFSET:  .byte 7, 6, 5, 4, 3, 2, 1, 0
XSCROLLOFFSET:  .byte 7, 6, 5, 4, 3, 2, 1, 0