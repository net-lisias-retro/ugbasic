/*****************************************************************************
 * ugBASIC - an isomorphic BASIC language compiler for retrocomputers        *
 *****************************************************************************
 * Copyright 2021-2024 Marco Spedaletti (asimov@mclink.it)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *----------------------------------------------------------------------------
 * Concesso in licenza secondo i termini della Licenza Apache, versione 2.0
 * (la "Licenza"); è proibito usare questo file se non in conformità alla
 * Licenza. Una copia della Licenza è disponibile all'indirizzo:
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Se non richiesto dalla legislazione vigente o concordato per iscritto,
 * il software distribuito nei termini della Licenza è distribuito
 * "COSÌ COM'È", SENZA GARANZIE O CONDIZIONI DI ALCUN TIPO, esplicite o
 * implicite. Consultare la Licenza per il testo specifico che regola le
 * autorizzazioni e le limitazioni previste dalla medesima.
 ****************************************************************************/

/****************************************************************************
 * INCLUDE SECTION 
 ****************************************************************************/

#include "../../ugbc.h"

/****************************************************************************
 * CODE SECTION 
 ****************************************************************************/

/**
 * @brief Emit code for <strong>ANIMATION ...</strong>
 * 
 * @param _environment Current calling environment
 * @param _name Name of the procedure
 */
/* <usermanual>
@keyword ANIMATION

@english

The ''ANIMATION'' command allows you to define an animation starting from a given 
''ATLAS''. The animation can be characterized by a type and parameters, which 
describe its operation. Once defined, the animation can then be used at any time.

In order for this to work, you need to indicate a variable prefix that will be 
associated with the object that will have this animation. This can be indicated with 
the ''USING'' keyword. 

This statement will generate a series of variables: ''prefixFrame'', which will 
contain the next frame to be displayed for the animation; ''prefixFrameDirection'', 
which will be 1 if the animation proceeds from the smallest frame to the largest frame 
and -1 vice versa; ''prefixX'' and ''prefixY'', which will contain the position where 
the animation will be displayed; ''prefixNext'', to signal a ''NEXT'' event;
''prefixAnimation'' that mantains the thread handle for this animation.

It is possible to indicate that a certain number of frames at the beginning of the 
''ATLAS'' should be used as "ease in". This is done with the keyword ''EASEIN'', 
followed by the number of frames and any delay to be applied between each frame.

It is also possible to indicate a certain number of frames from the end as belonging 
to an "end of sequence" (also called "ease out"). With the keyword ''EASEOUT'' it will 
be possible to indicate the number of frames, and the delay between each of them.

Finally, you can indicate the name of an animation that will be executed at the end 
of the current one, where the animation ends naturally or the signal to move to the 
next one is sent. The animation is indicated with the keyword ''NEXT'' and must already 
be defined.

@italian

Il comando ''ANIMATION'' permette di definire una animazione a partire da un ''ATLAS''
dato. L'animazione potrà essere caratterizzata da un tipo e da parametri, che ne 
descrivono il funzionamento. Una volta definita, l'animazione potrà poi essere usata 
in qualsiasi momento.

Per poter funzionare, è necessario indicare un prefisso di variabile che sarà associato 
all'oggetto che avrà questa animazione. Questo è possibile indicarlo con la parola 
chiave ''USING''. Questa istruzione genererà una serie di variabili: ''prefixFrame'', 
che conterrà il prossimo fotogramma da visualizzare per l'animazione; ''prefixFrameDirection'', 
che sarà 1 se l'animazione procede dal fotogramma più piccolo a quello più grande e -1 viceversa; 
''prefixX'' e ''prefixY'', che conterrà la posizione dove l'animazione sarà visualizzata;
''prefixNext'' per segnalare un evento ''NEXT''; ''prefixAnimation'' che mantiene l'handle per
il thread per l'animazione attuale.

È possibile indicare che un certo numero di frame all'inizio di ''ATLAS'' debba essere 
utilizzato come "ease in". Questo si fa con la parola chiave ''EASEIN'',
seguita dal numero di frame e da qualsiasi ritardo da applicare tra ogni frame.

E' possibile, inoltre, indicare un certo numero di fotogrammi dalla fine come 
appartenenti a un "fine sequenza" (chiamato anche "ease out"). Con la parola chiave 
''EASEOUT'' sarà possibile indicare il numero di fotogrammi, e il ritardo tra ognuno di essi.

Infine, si può indicare il nome di una animazione che sarà eseguita al termine di quella 
attuale, laddove la stessa termini in modo naturale o sia inviato il segnale di passare alla 
successiva. L'animazione viene indicata con la parola chiave NEXT e deve essere già definita.

@syntax ANIMATION type name WITH atlas [DELAY delay] [EASEIN ito [DELAY delay]] [EASEOUT ofrom [DELAY delay]] USING prefix [NEXT anim]

@example flyingAirplane := LOAD ATLAS("airplane.png") FRAME SIZE (16, 16)
@example ANIMATION BOUNCE anim WITH flyingAirplane USING airplane

@target all
</usermanual> */
void animation( Environment * _environment, char * _identifier, char * _atlas, char * _prefix, char * _next ) {

    if ( _environment->procedureName ) {
        CRITICAL_cANNOT_DEFINE_ANIMATION_INSIDE_A_PROCEDURE( _identifier );
    }

    Variable * atlas = variable_retrieve( _environment, _atlas );

    if ( atlas->type != VT_IMAGES ) {
        CRITICAL_cANNOT_DEFINE_ANIMATION_WITHOUT_ATLAS( _identifier );
    }

	// DIM [prefix]Animation AS THREAD
    char prefixAnimation[MAX_TEMPORARY_STORAGE]; sprintf( prefixAnimation, "%sAnimation", _prefix );
    Variable * prefixAnimationVar = variable_define( _environment, prefixAnimation, VT_THREAD, 0 );

	// DIM [prefix]frame AS SIGNED BYTE
    char prefixFrame[MAX_TEMPORARY_STORAGE]; sprintf( prefixFrame, "%sFrame", _prefix );
    Variable * prefixFrameVar = variable_define( _environment, prefixFrame, VT_SBYTE, 0 );

	// DIM [prefix]frameDirection AS SIGNED BYTE
    char prefixFrameDirection[MAX_TEMPORARY_STORAGE]; sprintf( prefixFrameDirection, "%sFrameDirection", _prefix );
    Variable * prefixFrameDirectionVar = variable_define( _environment, prefixFrameDirection, VT_SBYTE, 0 );

	// DIM [prefix]X AS POSITION
    char prefixX[MAX_TEMPORARY_STORAGE]; sprintf( prefixX, "%sX", _prefix );
    Variable * prefixXVar = variable_define( _environment, prefixX, VT_POSITION, 0 );

	// DIM [prefix]Y AS POSITION
    char prefixY[MAX_TEMPORARY_STORAGE]; sprintf( prefixY, "%sY", _prefix );
    Variable * prefixYVar = variable_define( _environment, prefixY, VT_POSITION, 0 );

	// DIM [prefix]Next AS SIGNED BYTE
    char prefixNext[MAX_TEMPORARY_STORAGE]; sprintf( prefixNext, "%sNext", _prefix );
    Variable * prefixNextVar = variable_define( _environment, prefixNext, VT_SBYTE, 0 );

	// PARALLEL PROCEDURE [identifier]

    ((struct _Environment *)_environment)->parameters = 0;
    ((struct _Environment *)_environment)->protothread = 1;
    ((struct _Environment *)_environment)->emptyProcedure = 0;
    begin_procedure( _environment, _identifier );

	// 	SHARED  [prefix]Animation
    ((struct _Environment *)_environment)->parametersEach[((struct _Environment *)_environment)->parameters] = strdup( prefixAnimation );
    ((struct _Environment *)_environment)->parametersTypeEach[((struct _Environment *)_environment)->parameters] = VT_THREAD;
    ++((struct _Environment *)_environment)->parameters;

	// 	SHARED [atlas]
    ((struct _Environment *)_environment)->parametersEach[((struct _Environment *)_environment)->parameters] = strdup( _atlas );
    ((struct _Environment *)_environment)->parametersTypeEach[((struct _Environment *)_environment)->parameters] = VT_IMAGES;
    ++((struct _Environment *)_environment)->parameters;

	// 	SHARED [prefix]frame
    ((struct _Environment *)_environment)->parametersEach[((struct _Environment *)_environment)->parameters] = strdup( prefixFrame );
    ((struct _Environment *)_environment)->parametersTypeEach[((struct _Environment *)_environment)->parameters] = VT_SBYTE;
    ++((struct _Environment *)_environment)->parameters;

	// 	SHARED  [prefix]frameDirection
    ((struct _Environment *)_environment)->parametersEach[((struct _Environment *)_environment)->parameters] = strdup( prefixFrameDirection );
    ((struct _Environment *)_environment)->parametersTypeEach[((struct _Environment *)_environment)->parameters] = VT_SBYTE;
    ++((struct _Environment *)_environment)->parameters;

	// 	SHARED  [prefix]X
    ((struct _Environment *)_environment)->parametersEach[((struct _Environment *)_environment)->parameters] = strdup( prefixX );
    ((struct _Environment *)_environment)->parametersTypeEach[((struct _Environment *)_environment)->parameters] = VT_POSITION;
    ++((struct _Environment *)_environment)->parameters;

	// 	SHARED  [prefix]Y
    ((struct _Environment *)_environment)->parametersEach[((struct _Environment *)_environment)->parameters] = strdup( prefixY );
    ((struct _Environment *)_environment)->parametersTypeEach[((struct _Environment *)_environment)->parameters] = VT_POSITION;
    ++((struct _Environment *)_environment)->parameters;

	// 	SHARED  [prefix]Next
    ((struct _Environment *)_environment)->parametersEach[((struct _Environment *)_environment)->parameters] = strdup( prefixNext );
    ((struct _Environment *)_environment)->parametersTypeEach[((struct _Environment *)_environment)->parameters] = VT_SBYTE;
    ++((struct _Environment *)_environment)->parameters;

    shared( _environment );

	// 	[prefix]Frame = 0
    variable_store( _environment, prefixFrame, 0 );
    
	// 	[prefix]FrameDirection = 1
    variable_store( _environment, prefixFrameDirection, 1 );

    if ( _environment->animationEaseInFrames ) {

        char easeInLabel[MAX_TEMPORARY_STORAGE]; sprintf( easeInLabel, "%seasein", _identifier );
        char easeInDoneLabel[MAX_TEMPORARY_STORAGE]; sprintf( easeInDoneLabel, "%seaseindone", _identifier );

        // DO
        cpu_label( _environment, easeInLabel );

    		// 	WAIT [idelay] MS
            wait_milliseconds( _environment, _environment->animationEaseInDelay );

	    	// 	WAIT VBL [prefix]Y + IMAGE HEIGHT( [atlas] )

    		// 	PUT IMAGE playerIdle FRAME framePlayer AT playerX, playerY
            put_image( _environment, atlas->name, prefixXVar->name, prefixYVar->name, NULL, NULL, prefixFrameVar->name, NULL, FLAG_WITH_PALETTE );

    		// 	INC [prefix]Frame
            cpu_inc( _environment, prefixFrameVar->realName );

		    // 	EXIT IF [prefix]Frame = ito
            cpu_compare_and_branch_8bit_const( _environment, prefixFrameVar->realName, _environment->animationEaseInFrames, easeInDoneLabel, 1 );
		
        // LOOP
        cpu_jump( _environment, easeInLabel );

        cpu_label( _environment, easeInDoneLabel );
    }

    switch( _environment->animationType ) {
        case AT_SIMPLE: {

            char simpleLabel[MAX_TEMPORARY_STORAGE]; sprintf( simpleLabel, "%ssimple", _identifier );
            char simpleDoneLabel[MAX_TEMPORARY_STORAGE]; sprintf( simpleDoneLabel, "%ssimpledone", _identifier );

            // DO
            cpu_label( _environment, simpleLabel );

                // 	WAIT [delay] MS
                wait_milliseconds( _environment, _environment->animationDelay );

                // 	WAIT VBL [prefix]Y + IMAGE HEIGHT( [atlas] )

                // 	PUT IMAGE [atlas] FRAME [prefix]Frame AT [prefix]X, [prefix]Y
                put_image( _environment, atlas->name, prefixXVar->name, prefixYVar->name, NULL, NULL, prefixFrameVar->name, NULL, FLAG_WITH_PALETTE );

                // 	INC [prefix]Frame
                cpu_inc( _environment, prefixFrameVar->realName );

                // 	EXIT IF [prefix]Frame = ofrom / last frame
                cpu_compare_and_branch_8bit_const( _environment, prefixFrameVar->realName, _environment->animationEaseOutFrames ? _environment->animationEaseOutFrames : atlas->frameCount, simpleDoneLabel, 1 );
            
            // LOOP
            cpu_jump( _environment, simpleLabel );

            cpu_label( _environment, simpleDoneLabel );

            }
            break;
        case AT_BOUNCE: {

            char bounceLabel[MAX_TEMPORARY_STORAGE]; sprintf( bounceLabel, "%sbounce", _identifier );
            char bounceDoneLabel[MAX_TEMPORARY_STORAGE]; sprintf( bounceDoneLabel, "%sbouncedone", _identifier );

            // DO
            cpu_label( _environment, bounceLabel );

                // 	WAIT [delay] MS
                wait_milliseconds( _environment, _environment->animationDelay );

                // 	WAIT VBL [prefix]Y + IMAGE HEIGHT( [atlas] )

                // 	PUT IMAGE [atlas] FRAME [prefix]Frame AT [prefix]X, [prefix]Y
                put_image( _environment, atlas->name, prefixXVar->name, prefixYVar->name, NULL, NULL, prefixFrameVar->name, NULL, FLAG_WITH_PALETTE );

                // ADD [prefix]Frame, [prefix]FrameDirection
                variable_add_inplace_vars( _environment, prefixFrameVar->name, prefixFrameDirectionVar->name );

                // IF framePlayer = FRAMES( playerIdle ) - 1 THEN
                if_then( _environment, variable_compare_const( _environment, prefixFrameVar->name, atlas->frameCount - 1 )->name );  

                    // 	framePlayerDirection = -1
                    variable_store( _environment, prefixFrameDirectionVar->name, -1 );

                // ELSEIF framePlayer = 3 THEN
                else_if_then_label( _environment );  
                else_if_then( _environment, variable_compare_const( _environment, prefixFrameVar->name, _environment->animationEaseInFrames ? _environment->animationEaseInFrames : 0 )->name );  

                    // 	framePlayerDirection = 1
                    variable_store( _environment, prefixFrameDirectionVar->name, 1 );

                end_if_then( _environment );  
                // ENDIF
            
                // 	EXIT IF [prefix]Next != 0
                cpu_compare_and_branch_8bit_const( _environment, prefixNextVar->realName, 0, bounceDoneLabel, 0 );

            // LOOP
            cpu_jump( _environment, bounceLabel );

            cpu_label( _environment, bounceDoneLabel );

            }

            break;
        case AT_LOOP: {

            char loopLabel[MAX_TEMPORARY_STORAGE]; sprintf( loopLabel, "%sloop", _identifier );
            char loopDoneLabel[MAX_TEMPORARY_STORAGE]; sprintf( loopDoneLabel, "%sloopdone", _identifier );

            // DO
            cpu_label( _environment, loopLabel );

                // 	WAIT [delay] MS
                wait_milliseconds( _environment, _environment->animationDelay );

                // 	WAIT VBL [prefix]Y + IMAGE HEIGHT( [atlas] )

                // 	PUT IMAGE [atlas] FRAME [prefix]Frame AT [prefix]X, [prefix]Y
                put_image( _environment, atlas->name, prefixXVar->name, prefixYVar->name, NULL, NULL, prefixFrameVar->name, NULL, FLAG_WITH_PALETTE );

                // ADD [prefix]Frame, [prefix]FrameDirection
                variable_add_inplace( _environment, prefixFrameVar->name, 1 );

                // IF [prefix]Frame = FRAMES( [atlas] ) THEN
                if_then( _environment, variable_compare_const( _environment, prefixFrameVar->name, atlas->frameCount )->name );  

                    // 	[prefix]Frame = 0
                    variable_store( _environment, prefixFrameDirectionVar->name, 0 );

                // ELSEIF framePlayer = 3 THEN
                end_if_then( _environment );  
                // ENDIF

                // 	EXIT IF [prefix]Next != 0
                cpu_compare_and_branch_8bit_const( _environment, prefixNextVar->realName, 0, loopDoneLabel, 0 );
            
            // LOOP
            cpu_jump( _environment, loopLabel );

            cpu_label( _environment, loopDoneLabel );

            }

            break;
    }

    if ( _environment->animationEaseOutFrames ) {

        char easeOutLabel[MAX_TEMPORARY_STORAGE]; sprintf( easeOutLabel, "%seaseout", _identifier );
        char easeOutDoneLabel[MAX_TEMPORARY_STORAGE]; sprintf( easeOutDoneLabel, "%seaseoutdone", _identifier );

        // DO
        cpu_label( _environment, easeOutLabel );

    		// 	WAIT [odelay] MS
            wait_milliseconds( _environment, _environment->animationEaseOutDelay );

	    	// 	WAIT VBL [prefix]Y + IMAGE HEIGHT( [atlas] )

    		// 	PUT IMAGE playerIdle FRAME framePlayer AT playerX, playerY
            put_image( _environment, atlas->name, prefixXVar->name, prefixYVar->name, NULL, NULL, prefixFrameVar->name, NULL, FLAG_WITH_PALETTE );

    		// 	INC [prefix]Frame
            cpu_inc( _environment, prefixFrameVar->realName );

		    // 	EXIT IF [prefix]Frame = last frame
            cpu_compare_and_branch_8bit_const( _environment, prefixFrameVar->realName, atlas->frameCount, easeOutDoneLabel, 1 );
		
        // LOOP
        cpu_jump( _environment, easeOutLabel );

        cpu_label( _environment, easeOutDoneLabel );
    }

    if ( _next ) {
        ((struct _Environment *)_environment)->parameters = 0;
        kill_procedure( _environment, prefixAnimationVar->name );
        variable_move( _environment, spawn_procedure( _environment, _next, 0 )->name, prefixAnimationVar->name );
    }

    end_procedure( _environment, NULL );

}

