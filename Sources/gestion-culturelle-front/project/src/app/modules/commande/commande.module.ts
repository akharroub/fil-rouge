import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CommandeRoutingModule } from './commande-routing.module';
import { CommandeAddComponent } from './commande-add/commande-add.component';
import { FormsModule } from '@angular/forms';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';

@NgModule({
  declarations: [CommandeAddComponent],
  imports: [
    CommonModule,
    CommandeRoutingModule,
    FormsModule,
    FontAwesomeModule
  ],
  exports: [
    CommandeAddComponent
  ]
})
export class CommandeModule { }
