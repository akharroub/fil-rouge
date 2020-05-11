import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { CommandeDto } from '../../../model/commandeDto';
import { PanierDto } from '../../../model/panierDto';
import { User } from '../../../model/user';
import { CommandeService } from '../../../service/commande.service';
import { PanierService } from '../../../service/panier.service';
import { AuthService } from '../../../service/auth.service';
import { UserService } from '../../../service/user.service';
import { RoleDto } from '../../../model/roleDto';


@Component({
  selector: 'app-panier-show',
  templateUrl: './panier-show.component.html',
  styleUrls: ['./panier-show.component.css']
})
export class PanierShowComponent implements OnInit {

  listCommandes: CommandeDto[];
  panierDto: PanierDto;
  userDto: User;
  id: number;
  idPanier: number;
  user: String;
  role: RoleDto;
  isClient: boolean;
  isConnected: boolean;
  date = new Date ();

  constructor(private commandeService: CommandeService,
    private panierService: PanierService, private route: ActivatedRoute,
    private router: Router, private authService: AuthService, private userService: UserService,
  ) { this.userDto = new User(); this.panierDto = new PanierDto(); }


  ngOnInit() {
    this.isConnected = this.authService.isConnected();
    if (this.authService.getCurrentUser()) {
      this.isClient = this.authService.getCurrentUser().role.label === 'CLIENT';
      this.user = this.authService.getCurrentUser().nom;
      this.role = this.authService.getCurrentUser().role;
    }
    this.reload();
  }

  reload() {
    let idUser = this.authService.getCurrentUser().id;

    this.userService.getOne(idUser).subscribe(
      res => {
        this.panierDto = res.panier;
        this.userDto = res;
        this.idPanier = res.panier.id;
      }
    );

    this.id = this.route.snapshot.params['id'];
    this.commandeService.getCommandes(this.id).subscribe(
      donnees => {
        this.listCommandes = donnees;

      }
    );

  }

  valid(id: number) {
    this.id = this.route.snapshot.params['id'];
    this.panierService.deletePanier(id).subscribe(
      res => {
        this.commandeService.subjectMiseAJour.next(0);
        this.goHome()
      }
    )

  }

  cancel(id: number) {
    this.id = this.route.snapshot.params['id'];
    this.panierService.deleteCommandes(id).subscribe(
      res => {
        this.commandeService.subjectMiseAJour.next(0);
        this.goHome()
      }
    )
  }

  delete(id: number) {
    this.id = this.route.snapshot.params['id'];
    this.commandeService.delete(id).subscribe(
      res => {
        this.commandeService.subjectMiseAJour.next(0);
        this.reload()
      }
    )
  }

  goHome() {

    this.router.navigateByUrl('/public')

  }



}
