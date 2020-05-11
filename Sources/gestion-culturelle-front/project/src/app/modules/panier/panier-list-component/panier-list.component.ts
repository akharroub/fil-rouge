import { Component, OnInit } from '@angular/core';
import { PanierService } from '../../../service/panier.service';
import { Router } from '@angular/router';
import { PanierDto } from '../../../model/panierDto';
import { ManifestationDto } from '../../../model/manifestationDto';
import { ManifestationService } from '../../../service/manifestation.service';
import { AuthService } from 'src/app/service/auth.service';
import { RoleDto } from 'src/app/model/roleDto';
import { faInfoCircle, faEdit, faTrashAlt, faHome, faPlusSquare } from '@fortawesome/free-solid-svg-icons';
import { CommandeService } from 'src/app/service/commande.service';


@Component({
  selector: 'app-panier-list',
  templateUrl: './panier-list.component.html',
  styleUrls: ['./panier-list.component.css']
})
export class PanierListComponent implements OnInit {

  faInfoCircle =faInfoCircle;
  faEdit = faEdit;
  faTrashAlt = faTrashAlt;
  faHome = faHome;
  faPlusSquare = faPlusSquare;

  paniers: PanierDto[];
  manifestations: ManifestationDto[];
  isConnected: boolean;
  isClient: boolean;
  user : String;
  role : RoleDto;
  
  constructor(private panierService: PanierService, private commandeService : CommandeService,
     private manifestationService : ManifestationService,  private authService: AuthService
      ,private router: Router) { }

  ngOnInit() {

    this.isConnected = this.authService.isConnected();
    if(this.authService.getCurrentUser()){
this.isClient=this.authService.getCurrentUser().role.label==='CLIENT';
this.user = this.authService.getCurrentUser().nom;
this.role = this.authService.getCurrentUser().role;
    }
    this.panierService.subjectMiseAJour.subscribe(
      res=> {
        this.panierService.getAll().subscribe(
          donnees =>{
			  this.paniers = donnees; 
          }
        );
      }
    );

    this.panierService.getAll().subscribe(
      resultat =>{
          this.paniers = resultat; 
               }
    );

    this.manifestationService.subjectMiseAJour.subscribe(
      res=> {
        this.manifestationService.getAll().subscribe(
          donnees =>{
			  this.manifestations = donnees; 
          }
        );
      }
    );

    this.manifestationService.getAll().subscribe(
      resultat =>{
          this.manifestations = resultat; 
        
      }
    );
  }

  

  /* delete(id:number) {
    this.panierService.deleteCommande(id).subscribe(
      res=>{
        this.commandeService.subjectMiseAJour.next(0);
        console.log('delete Ok ');
      }
    )
  }  */
  
  redirectToUpdate(id:number){
    this.router.navigateByUrl('/panier-update/'+id)
  }
   

  redirectToShow(id:number) {
    this.router.navigateByUrl('/panier-show/'+id)
  }
}
