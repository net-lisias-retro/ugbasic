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

// TODO: goto_number - jump to line number

/**
 * @brief Emit ASM code for <b>GOTO label</b>
 * 
 * This function can be used to issue a code equivalent to the unconditional 
 * jump to an alphanumeric label, previously or subsequently defined, with 
 * the syntax of the labels.
 * 
 * @param _environment Current calling environment
 * @param _label Label where to jump to
 */
/* <usermanual>
    @keyword GOTO
    
    @english
    Do an unconditional jump to an alphanumeric label, previously or 
    subsequently defined, with the syntax of the labels.
    
    @italian
    Fare un salto incondizionato a un'etichetta, definita in precedenza o
    successivamente.

    @syntax GOTO [label]

    @example GOTO nuovaEtichetta

    @target all

 </usermanual> */
void goto_label( Environment * _environment, char * _label ) {

    outline1("; GOTO %s", _label);

    cpu_jump( _environment, _label );

}