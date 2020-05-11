import { Component, OnInit } from '@angular/core';
import { ManifestationDto } from '../../../model/manifestationDto';
import { ActivatedRoute, Router } from '@angular/router';
import { ManifestationService } from '../../../service/manifestation.service';
import { AnimationDto } from '../../../model/animationDto';
import { SalleDto } from '../../../model/salleDto';
import { SalleService } from '../../../service/salle.service';
import { AnimationService } from '../../../service/animation.service';
import { AdminService } from '../../../service/admin.service';
import { AdminDto } from '../../../model/adminDto';

@Component({
  selector: 'app-manifestation-update',
  templateUrl: './manifestation-update.component.html',
  styleUrls: ['./manifestation-update.component.css']
})
export class ManifestationUpdateComponent implements OnInit {

  id: number;
  manifestation: ManifestationDto;
  animations: AnimationDto[];
  salles: SalleDto[];
  admins: AdminDto[];

  constructor(
    private adminService: AdminService,
    private salleService : SalleService,
    private animationService : AnimationService,
    private route: ActivatedRoute,
    private manifestationService: ManifestationService,
    private router: Router) { }

  ngOnInit() {
    this.manifestation = new ManifestationDto();
    this.salles =[];
    this.animations = [];
    this.admins = [];
    
    this.manifestation.salle = new SalleDto();
    this.manifestation.animation = new AnimationDto();
    this.manifestation.validateur = new AdminDto();
    this.manifestation.annulateur = new AdminDto();

    let id = this.route.snapshot.params['id'];

    this.manifestationService.getOne(id).subscribe(
      res => {
        this.manifestation = res;
      }
    );

    this.animationService.subjectMiseAJour.subscribe(
      res => {
        this.animationService.getAll().subscribe(
          donnees => {
            this.animations = donnees;
          }
        );
      }
    );

    this.animationService.getAll().subscribe(
      resultat => {
        this.animations = resultat;
      }
    );

    this.salleService.subjectMiseAJour.subscribe(
      res => {
        this.salleService.getAll().subscribe(
          donnees => {
            this.salles = donnees;
          }
        );
      }
    );

    this.salleService.getAll().subscribe(
      resultat => {
        this.salles = resultat;
      }
    );


    this.adminService.subjectMiseAJour.subscribe(
      res => {
        this.adminService.getAll().subscribe(
          donnees => {
            this.admins = donnees;
          }
        );
      }
    );

    this.adminService.getAll().subscribe(
      resultat => {
        this.admins = resultat;
      }
    );

  }

  update(): void {
    let id = this.route.snapshot.params['id'];
    this.manifestationService.update(id, this.manifestation).subscribe(
      res => {
        console.log("Modification Ok");
        this.goHome();
      }
    );
  }

  onSubmit() {
    this.update();
  }

  goHome() {
    this.router.navigate(['/public/manifestation-list']);
  }

}


