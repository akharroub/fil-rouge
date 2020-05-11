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
  selector: 'app-panier-add',
  templateUrl: './panier-add.component.html',
  styleUrls: ['./panier-add.component.css']
})
export class PanierAddComponent implements OnInit {
  commande: CommandeDto;
  panierDto: PanierDto;
  userDto: User;
  manifestationDto: ManifestationDto;
  quantite: number;
  user: User;
  idUser: number;
  idManif: number;
  commandetmp: CommandeDto;

 // dateValidation: Date;

  constructor(private manifestationService: ManifestationService,
    private panierService: PanierService, private route: ActivatedRoute,
    private router: Router, private authService: AuthService,
    private userService: UserService, ) {
    this.manifestationDto = new ManifestationDto();
    this.userDto = new User();
    this.panierDto = new PanierDto();
    this.commandetmp = new CommandeDto();
  }

  ngOnInit() {
    this.reload();
  }

  reload() {
    let idUser = this.authService.getCurrentUser().id;

    this.userService.getOne(idUser).subscribe(
      res => {
        this.panierDto = res.panier;
        this.userDto = res;
      }
    );

    this.manifestationService.getOne(this.route.snapshot.params['id']).subscribe(
      resu => {
        this.manifestationDto = resu;
      }
    )
  }

  add(): void {
    this.reload();
    this.commandetmp.manifestation = this.manifestationDto;
    this.commandetmp.panier = this.panierDto;
    this.commandetmp.quantite = this.quantite;
    
    this.panierService.add(this.commandetmp).subscribe(
      res => {
        this.panierService.subjectMiseAJour.next(0);
        this.goHome(this.panierDto.id);
      }
    );

  }

  goHome(id: number) {

    this.router.navigateByUrl('/panier-show/'+ id)

  }


}
