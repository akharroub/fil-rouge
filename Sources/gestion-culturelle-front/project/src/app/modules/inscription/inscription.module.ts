import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { InscriptionRoutingModule } from './inscription-routing.module';
import { InscriptionComponent } from './inscription/inscription.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';


@NgModule({
  declarations: [
    InscriptionComponent
  ],
  imports: [
    CommonModule,
    InscriptionRoutingModule,
    FormsModule,
    FontAwesomeModule
  ],
  exports: [
    InscriptionComponent
  ]
})
export class InscriptionModule { }
