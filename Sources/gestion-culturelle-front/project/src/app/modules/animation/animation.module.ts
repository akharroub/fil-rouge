import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AnimationRoutingModule } from './animation-routing.module';
import { AnimationListComponent } from './animation-list-component/animation-list.component';
import { AnimationAddComponent } from './animation-add-component/animation-add.component';
import { AnimationUpdateComponent } from './animation-update-component/animation-update.component';
import { AnimationShowComponent } from './animation-show-component/animation-show.component';
import { FormsModule } from '@angular/forms';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';



@NgModule({
  declarations: [
      AnimationListComponent,
      AnimationAddComponent,
      AnimationUpdateComponent,
      AnimationShowComponent
    ],
  imports: [
    CommonModule,
    AnimationRoutingModule,
    FormsModule,
    FontAwesomeModule
  ],
  exports: [
    AnimationListComponent,
    AnimationAddComponent,
    AnimationUpdateComponent,
    AnimationShowComponent
  ]
})
export class AnimationModule { }
