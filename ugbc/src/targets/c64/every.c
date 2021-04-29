/*****************************************************************************
 * ugBASIC - an isomorphic BASIC language compiler for retrocomputers        *
 *****************************************************************************
 * Copyright 2021 Marco Spedaletti (asimov@mclink.it)
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
 * @brief Emit ASM code for <b>EVERY ... TICKS GOSUB ...</b>
 * 
 * @param _environment 
 * @param _timing 
 * @param _label 
 */
/* <usermanual>
@keyword EVERY ... TICKS GOSUB ...

@english

@italian

@syntax EVERY [expression] TICKS GOSUB [label]

@example EVERY period TICKS GOSUB updateGameStatus

@target c64
</usermanual> */
void every_ticks_gosub( Environment * _environment, char * _timing, char * _label ) {

    outline2("; EVERY %s TICKS GOSUB %s", _timing, _label );

    Variable * timing = variable_retrieve( _environment, _timing );

    if ( _environment->everyStatus ) {
        CRITICAL("Cannot call EVERY ... TICKS more than one time.");
    }

    _environment->everyStatus = variable_temporary( _environment, VT_BYTE, "(every status)");
    _environment->everyStatus->locked = 1;
    _environment->everyCounter = variable_temporary( _environment, VT_WORD, "(every counter)");
    _environment->everyCounter->locked = 1;
    _environment->everyTiming = variable_cast( _environment, timing->name, VT_WORD );
    _environment->everyTiming->locked = 1;

    char skipEveryRoutineLabel[16]; sprintf(skipEveryRoutineLabel, "setg%d", UNIQUE_ID );
    char everyRoutineLabel[16]; sprintf(everyRoutineLabel, "etg%d", UNIQUE_ID );
    char endOfEveryRoutineLabel[16]; sprintf(endOfEveryRoutineLabel, "eetg%d", UNIQUE_ID );
    
    cpu_jump( _environment, skipEveryRoutineLabel );
    
    cpu_label( _environment, everyRoutineLabel );
    
    cpu_di( _environment );

    cpu_bveq( _environment, _environment->everyStatus->realName, endOfEveryRoutineLabel );

    cpu_dec( _environment, _environment->everyCounter->realName );

    cpu_bvneq( _environment, _environment->everyCounter->realName, endOfEveryRoutineLabel );

    cpu_call( _environment, _label );

    variable_move_naked( _environment, _environment->everyTiming->name, _environment->everyCounter->name );

    cpu_label( _environment, endOfEveryRoutineLabel );

    cpu_ei( _environment );

    vic2_next_raster( _environment );

    cpu_label( _environment, skipEveryRoutineLabel );

    vic2_raster_at( _environment, everyRoutineLabel, "0", "42" );

}

/**
 * @brief Emit ASM code for <b>EVERY ON</b>
 * 
 * @param _environment Current calling environment
 */
/* <usermanual>
@keyword EVERY ON

@english

@italian

@syntax EVERY ON

@example EVERY ON
</usermanual> */
void every_on( Environment * _environment ) {
   
    outline0("; EVERY ON");

    if ( ! _environment->everyStatus ) {
        CRITICAL("EVERY ON without EVERY definition");
    }

    variable_store( _environment, _environment->everyStatus->name, 0xff );

}

/**
 * @brief Emit ASM code for <b>EVERY OFF</b>
 * 
 * @param _environment Current calling environment
 */
/* <usermanual>
@keyword EVERY OFF

@english

@italian

@syntax EVERY OFF

@example EVERY OFF
</usermanual> */
void every_off( Environment * _environment ) {
   
    outline0("; EVERY OFF");

    if ( ! _environment->everyStatus ) {
        CRITICAL("EVERY OFF without EVERY definition");
    }

    variable_store( _environment, _environment->everyStatus->name, 0x0 );

}
