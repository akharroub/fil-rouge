import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FormsModule } from '@angular/forms';

import { TypeSalleRoutingModule } from './typesalle-routing.module';

import { TypeSalleListComponent } from './typeSalle-list/typeSalle-list.component';
import { TypeSalleAddComponent } from './typeSalle-add/typeSalle-add.component';
import { TypeSalleUpdateComponent } from './typesalle-update/typesalle-update.component';
import { TypeSalleShowComponent } from './typesalle-show/typesalle-show.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';



@NgModule({
  declarations: [
    TypeSalleListComponent,
    TypeSalleAddComponent,
    TypeSalleUpdateComponent,
    TypeSalleShowComponent,
  ],
  imports: [
    CommonModule,
    TypeSalleRoutingModule,
    FormsModule,
    FontAwesomeModule
  ],
  exports: [
    TypeSalleListComponent,
    TypeSalleAddComponent,
    TypeSalleUpdateComponent,
    TypeSalleShowComponent
  ]
})
export class TypeSalleModule { }
