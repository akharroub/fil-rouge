import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AnimateurAddComponent } from './animateur-add/animateur-add.component';
import { AnimateurListComponent } from './animateur-list/animateur-list.component';
import { AnimateurShowComponent } from './animateur-show/animateur-show.component';
import { AnimateurUpdateComponent } from './animateur-update/animateur-update.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';



@NgModule({
  declarations: [
    AnimateurAddComponent, 
    AnimateurListComponent, 
    AnimateurShowComponent, 
    AnimateurUpdateComponent
  ],
  imports: [
    CommonModule,
    FontAwesomeModule
  ]
})
export class AnimateurModule { }
