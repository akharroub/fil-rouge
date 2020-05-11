import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { VipRoutingModule } from './vip-routing.module';
import { VipListComponent } from './vip-list/vip-list.component';
import { VipAddComponent } from './vip-add/vip-add.component';
import { FormsModule } from '@angular/forms';
import { VipUpdateComponent } from './vip-update/vip-update.component';
import { VipShowComponent } from './vip-show/vip-show.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';



@NgModule({
  declarations: [
    VipListComponent, 
    VipAddComponent, 
    VipUpdateComponent, 
    VipShowComponent],

  imports: [
    CommonModule,
    VipRoutingModule,
    FormsModule,
    FontAwesomeModule
  ],
  exports: [
    VipListComponent, 
    VipAddComponent, 
    VipUpdateComponent, 
    VipShowComponent
  ]
})
export class VipModule { }
