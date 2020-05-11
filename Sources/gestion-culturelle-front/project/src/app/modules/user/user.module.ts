import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { UserRoutingModule } from './user-routing.module';
import { UserListComponent } from './user-list/user-list.component';
import { UserAddComponent } from './user-add/user-add.component';
import { FormsModule } from '@angular/forms';
import { UserShowComponent } from './user-show/user-show.component';
import { UserUpdateComponent } from './user-update/user-update.component';
import { UserRoleListComponent } from './user-role-list/user-role-list.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';


@NgModule({
  declarations: [
    UserListComponent,
    UserAddComponent,
    UserShowComponent,
    UserUpdateComponent,
    UserRoleListComponent,
  ],
  imports: [
    CommonModule,
    UserRoutingModule,
    FormsModule,
    FontAwesomeModule
  ],
  exports: [
    UserListComponent,
    UserAddComponent,
  ]
})
export class UserModule { }
