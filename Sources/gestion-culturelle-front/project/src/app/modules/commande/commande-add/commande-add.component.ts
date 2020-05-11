import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { CommandeDto } from '../../../model/commandeDto';
import { PanierDto } from '../../../model/panierDto';
import { ManifestationDto } from '../../../model/manifestationDto';
import { User } from '../../../model/user';
import { CommandeService } from '../../../service/commande.service';
import { PanierService } from '../../../service/panier.service';
import { ManifestationService } from '../../../service/manifestation.service';
import { AuthService } from '../../../service/auth.service';
import { UserService } from '../../../service/user.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-commande-add',
  templateUrl: './commande-add.component.html',
  styleUrls: ['./commande-add.component.css']
})
export class CommandeAddComponent implements OnInit {
  commande: CommandeDto;
 
  panierDto: PanierDto;
  userDto: User;
  manifestationDto: ManifestationDto;
  quantite: number;
  user: Observable<User>;
  idUser: number;
  idManif: number;
  tmp: CommandeDto;
  json = localStorage.getItem('current_user');
  objJson = JSON.parse(this.json);

  constructor(private manifestationService: ManifestationService, private commandeService: CommandeService,
    private panierService: PanierService, private route: ActivatedRoute,
    private router: Router, private authService: AuthService, private userService: UserService,
  ) { this.commande = new CommandeDto(); this.manifestationDto = new ManifestationDto(); this.userDto = new User(); this.panierDto = new PanierDto();}

  ngOnInit() {

// console.log ("IdUser" + this.idUser);
   // console.log(this.json);
  //  console.log(this.objJson);
  //  console.log("mon id : " + this.objJson.id);
    this.reload();

   
  }

  reload() {
    let idUser = this.authService.getCurrentUser().id;

    this.userService.getOne(idUser).subscribe(
      res => {
        this.panierDto = res.panier;
        this.userDto = res;
        console.log("panier"+res.panier);
      }
    );
   
    /* this.idUser =  this.authService.getCurrentUser().id;
    this.userService.getOne(this.idUser).subscribe(
      res => {
        console.log("panier"+res.panier);
        this.panierDto = res.panier;
        this.userDto = res;
        
      }
    ); */

    this.manifestationService.getOne(this.route.snapshot.params['id']).subscribe(
      resu => {
        this.manifestationDto = resu;
        console.log("manifestation "+resu);

      }
    )
  }

  add(): void {
    this.reload();
    this.tmp = new CommandeDto();
    this.tmp.manifestation=this.manifestationDto;
    this.tmp.panier=this.panierDto;
    this.tmp.quantite=this.quantite; 
   /* console.log("Add IdUser " + this.idUser); */
    /*     console.log("Add IdPanier " + this.panier.id); */
    /* console.log("Add IdManif " + this.idManif); */
    /*this.tmp.panier.id=this.panierDto.id;*/
  /*   this.tmp.manifestation = this.manifestationDto;
    this.tmp.quantite = this.quantite; */
    console.log(this.tmp);
    /*     this.commande.panier = this.panier; */

    this.commandeService.add(this.tmp).subscribe(
      res => {
        this.commandeService.subjectMiseAJour.next(0);
        this.goHome();
      }
    );

  }




  goHome() {

    this.router.navigate(['/public/manifestation-list']);

  }



}
