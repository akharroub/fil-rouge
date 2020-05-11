import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ManifestationRoutingModule } from './manifestation-routing.module';
import { ManifestationShowComponent } from './manifestation-show-component/manifestation-show.component';
import { ManifestationAddComponent } from './manifestation-add-component/manifestation-add.component';
import { ManifestationUpdateComponent } from './manifestation-update-component/manifestation-update.component';
import { FormsModule } from '@angular/forms';
import { ManifestationListComponent } from './manifestation-list-component/manifestation-list.component';
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';


@NgModule({
  declarations: [
    ManifestationShowComponent,
    ManifestationAddComponent,
    ManifestationListComponent,
    ManifestationUpdateComponent],

  imports: [
    CommonModule,
    ManifestationRoutingModule,
    FormsModule,
    FontAwesomeModule
  ],
  exports: [
    ManifestationShowComponent,
    ManifestationAddComponent,
    ManifestationListComponent,
    ManifestationUpdateComponent
  ]
})
export class ManifestationModule { }
