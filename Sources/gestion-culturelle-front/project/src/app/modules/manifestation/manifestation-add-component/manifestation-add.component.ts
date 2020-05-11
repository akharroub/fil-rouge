import { Component, OnInit } from '@angular/core';
import { ManifestationDto } from '../../../model/manifestationDto';
import { ManifestationService } from '../../../service/manifestation.service';
import { Router } from '@angular/router';
import { SalleDto } from '../../../model/salleDto';
import { AnimationDto } from '../../../model/animationDto';
import { AnimationService } from '../../../service/animation.service';
import { SalleService } from '../../../service/salle.service';
import { AdminDto } from '../../../model/adminDto';
import { AdminService } from '../../../service/admin.service';

@Component({
  selector: 'app-manifestation-add',
  templateUrl: './manifestation-add.component.html',
  styleUrls: ['./manifestation-add.component.css']
})
export class ManifestationAddComponent implements OnInit {

  manifestation: ManifestationDto;
  salles: SalleDto[];
  animations: AnimationDto[];
  admins: AdminDto[];
  
  constructor(private adminService: AdminService, private salleService: SalleService, private animationService: AnimationService, private manifestationService: ManifestationService, private router: Router) { }

  ngOnInit() {
    this.manifestation = new ManifestationDto();

    this.salles = [];
    this.animations = [];
    this.admins = [];
   
    
    this.manifestation.salle = new SalleDto();
    this.manifestation.animation = new AnimationDto();
    this.manifestation.validateur = new AdminDto();
    this.manifestation.annulateur = new AdminDto();

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
  
  add(): void {
    this.manifestationService.add(this.manifestation).subscribe(
      res => {
        this.manifestationService.subjectMiseAJour.next(0);
        console.log("Ajout Ok ");
        this.goHome();
      }
    );
    this.manifestation = new ManifestationDto();
    this.manifestation.validateur = new AdminDto();
    this.manifestation.animation = new AnimationDto();
    this.manifestation.annulateur = new AdminDto();
    this.manifestation.salle = new SalleDto();

  }

  goHome() {
    this.router.navigate(['/public/manifestation-list']);

  }

}
