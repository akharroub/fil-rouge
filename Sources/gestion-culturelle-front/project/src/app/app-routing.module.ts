import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { HomeComponent } from './home/home.component';
import { LoginComponent } from './modules/login/login/login.component';
import { AuthGuard } from './guard/auth.guard';

import { TypeSalleListComponent } from './modules/typesalle/typeSalle-list/typeSalle-list.component';
import { TypeSalleAddComponent } from './modules/typesalle/typeSalle-add/typeSalle-add.component';
import { TypeSalleUpdateComponent } from './modules/typesalle/typesalle-update/typesalle-update.component';
import { TypeSalleShowComponent } from './modules/typesalle/typesalle-show/typesalle-show.component';
import { SalleListComponent } from './modules/salle/salle-list/salle-list.component';
import { SalleAddComponent } from './modules/salle/salle-add/salle-add.component';
import { SalleUpdateComponent } from './modules/salle/salle-update/salle-update.component';
import { SalleShowComponent } from './modules/salle/salle-show/salle-show.component';
import { AnimationAddComponent } from './modules/animation/animation-add-component/animation-add.component';
import { AnimationUpdateComponent } from './modules/animation/animation-update-component/animation-update.component';
import { AnimationListComponent } from './modules/animation/animation-list-component/animation-list.component';
import { AnimationShowComponent } from './modules/animation/animation-show-component/animation-show.component';
import { ManifestationListComponent } from './modules/manifestation/manifestation-list-component/manifestation-list.component';
import { ManifestationAddComponent } from './modules/manifestation/manifestation-add-component/manifestation-add.component';
import { ManifestationShowComponent } from './modules/manifestation/manifestation-show-component/manifestation-show.component';
import { ManifestationUpdateComponent } from './modules/manifestation/manifestation-update-component/manifestation-update.component';
import { PanierListComponent } from './modules/panier/panier-list-component/panier-list.component';
import { PanierAddComponent } from './modules/panier/panier-add-component/panier-add.component';
import { PanierUpdateComponent } from './modules/panier/panier-update-component/panier-update.component';
import { PanierShowComponent } from './modules/panier/panier-show-component/panier-show.component';
import { RoleAddComponent } from './modules/role/role-add/role-add.component';
import { RoleUpdateComponent } from './modules/role/role-update/role-update.component';
import { RoleShowComponent } from './modules/role/role-show/role-show.component';
import { RoleListComponent } from './modules/role/role-list/role-list.component';
import { AdminListComponent } from './modules/admin/admin-list/admin-list.component';
import { AdminAddComponent } from './modules/admin/admin-add/admin-add.component';
import { AdminUpdateComponent } from './modules/admin/admin-update/admin-update.component';
import { AdminShowComponent } from './modules/admin/admin-show/admin-show.component';
import { VipListComponent } from './modules/vip/vip-list/vip-list.component';
import { VipAddComponent } from './modules/vip/vip-add/vip-add.component';
import { VipUpdateComponent } from './modules/vip/vip-update/vip-update.component';
import { VipShowComponent } from './modules/vip/vip-show/vip-show.component';
import { UserListComponent } from './modules/user/user-list/user-list.component';
import { UserAddComponent } from './modules/user/user-add/user-add.component';
import { UserUpdateComponent } from './modules/user/user-update/user-update.component';
import { UserShowComponent } from './modules/user/user-show/user-show.component';

import { AnimateurListComponent } from './modules/animateur/animateur-list/animateur-list.component';
import { AnimateurAddComponent } from './modules/animateur/animateur-add/animateur-add.component';
import { AnimateurUpdateComponent } from './modules/animateur/animateur-update/animateur-update.component';
import { AnimateurShowComponent } from './modules/animateur/animateur-show/animateur-show.component';
import { ProfilComponent } from './modules/profil/profil/profil.component';
import { InscriptionComponent } from './modules/inscription/inscription/inscription.component';

import { UserRoleListComponent } from './modules/user/user-role-list/user-role-list.component';

import { CommandeAddComponent } from './modules/commande/commande-add/commande-add.component';



const routes: Routes = [
  { path: 'public', pathMatch: 'full', component: HomeComponent },
  { path: 'public/login', component: LoginComponent },

  { path: 'typesalle-list', component: TypeSalleListComponent },
  { path: 'typesalle-ad', component: TypeSalleAddComponent },
  { path: 'typesalle-update/:id', component: TypeSalleUpdateComponent },
  { path: 'typesalle-show/:id', component: TypeSalleShowComponent },

  { path: 'public/salle-list', component: SalleListComponent },
  { path: 'salle-ad', component: SalleAddComponent },
  { path: 'salle-update/:id', component: SalleUpdateComponent},
  { path: 'salle-show/:id', component: SalleShowComponent },

  { path: 'public/manifestation-list', component: ManifestationListComponent },
  { path: 'manifestation-ad', component: ManifestationAddComponent},
  { path: 'manifestation-update/:id', component: ManifestationUpdateComponent },
  { path: 'manifestation-show/:id', component: ManifestationShowComponent },

  { path: 'public/animation-list', component: AnimationListComponent },
  { path: 'animation-ad', component: AnimationAddComponent },
  { path: 'animation-update/:id', component: AnimationUpdateComponent },
  { path: 'animation-show/:id', component: AnimationShowComponent },

  { path: 'panier-list', component: PanierListComponent  },
  { path: 'panier-ad', component: PanierAddComponent },
  { path: 'panier-update/:id', component: PanierUpdateComponent },
  { path: 'panier-show/:id', component: PanierShowComponent },
   {path: 'panier-ad/:id', component: PanierAddComponent },
   {path: 'panier-show', component: PanierShowComponent },

  { path: 'role-list', component: RoleListComponent, canActivate: [AuthGuard] },
  { path: 'role-ad', component: RoleAddComponent, canActivate: [AuthGuard] },
  { path: 'role-update/:id', component: RoleUpdateComponent, canActivate: [AuthGuard] },
  { path: 'role-show/:id', component: RoleShowComponent, canActivate: [AuthGuard] },

  { path: 'admin-list', component: AdminListComponent},
  { path: 'admin-ad', component: AdminAddComponent},
  { path: 'admin-update/:id', component: AdminUpdateComponent},
  { path: 'admin-show/:id', component: AdminShowComponent },

  { path: 'user-list', component: UserListComponent },
  { path: 'user-ad', component: UserAddComponent, canActivate: [AuthGuard] },
  { path: 'user-update/:id', component: UserUpdateComponent, canActivate: [AuthGuard] },
  { path: 'user-show/:id', component: UserShowComponent, canActivate: [AuthGuard] },
  { path: 'user-role-list:id',component: UserRoleListComponent},

  { path: 'animateur-list', component: AnimateurListComponent},
  { path: 'animateur-ad', component: AnimateurAddComponent },
  { path: 'animateur-update/:id', component: AnimateurUpdateComponent },
  { path: 'animateur-show/:id', component: AnimateurShowComponent},
 
  {path: 'role-list', component: RoleListComponent},
  {path: 'role-ad', component: RoleAddComponent },
  {path: 'role-update/:id', component: RoleUpdateComponent  },
  {path: 'role-show/:id', component: RoleShowComponent },
  
  {path: 'admin-list', component: AdminListComponent },
  {path: 'admin-ad', component: AdminAddComponent },
  {path: 'admin-update/:id', component: AdminUpdateComponent },
  {path: 'admin-show/:id', component: AdminShowComponent},

  {path: 'vip-list', component: VipListComponent },
  {path: 'vip-add', component: VipAddComponent },
  {path: 'vip-show/:id', component: VipShowComponent },
  {path: 'vip-update/:id', component: VipUpdateComponent},

  {path: 'commande-ad/:id', component: CommandeAddComponent },
   
  {path: 'public/profil', component: ProfilComponent },

  {path: 'public/inscription', component : InscriptionComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
