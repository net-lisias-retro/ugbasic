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

void target_initialization( Environment * _environment ) {

    variable_import( _environment, "BITMAPADDRESS", VT_ADDRESS );
    variable_global( _environment, "BITMAPADDRESS" );
    variable_import( _environment, "COLORMAPADDRESS", VT_ADDRESS );
    variable_global( _environment, "COLORMAPADDRESS" );
    variable_import( _environment, "EMPTYTILE", VT_BYTE );
    variable_global( _environment, "EMPTYTILE" );    

    bank_define( _environment, "VARIABLES", BT_VARIABLES, 0x5000, NULL );
    bank_define( _environment, "TEMPORARY", BT_TEMPORARY, 0x5100, NULL );
    variable_import( _environment, "FREE_STRING", VT_WORD );
    variable_global( _environment, "FREE_STRING" );    

    outhead0("org 32768");
    variable_define( _environment, "stringsAddress", VT_ADDRESS, 0xa000 );
    variable_global( _environment, "stringsAddress" );
    variable_define( _environment, "bitmap_enabled", VT_BYTE, 0 );
    variable_global( _environment, "bitmap_enabled" );
    variable_define( _environment, "COLORMAPADDRESS", VT_ADDRESS, 0x5800 );
    variable_global( _environment, "COLORMAPADDRESS" );

    setup_text_variables( _environment );

    zx_initialization( _environment );

}

void target_linkage( Environment * _environment ) {

    char commandLine[MAX_TEMPORARY_STORAGE];
    
    sprintf( commandLine, "z88dk-z80asm -l -b %s %s",
        _environment->exeFileName, 
        _environment->asmFileName );
    system( commandLine ); 

    sprintf( commandLine, "z88dk-appmake +zx --org 32768 -b %s",
        _environment->exeFileName );
    system( commandLine ); 

}