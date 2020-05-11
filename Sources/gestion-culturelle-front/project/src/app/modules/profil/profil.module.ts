import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { ProfilRoutingModule } from './profil-routing.module';
import { ProfilComponent } from './profil/profil.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';


@NgModule({
  declarations: [
    ProfilComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ProfilRoutingModule,
    FontAwesomeModule
  ],
  exports: [
    ProfilComponent
  ]
})
export class ProfilModule { }
