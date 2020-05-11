import { Component, OnInit } from '@angular/core';
import { PanierService } from '../../../service/panier.service';
import { Router, ActivatedRoute } from '@angular/router';
import { PanierDto } from '../../../model/panierDto';
import { ManifestationDto } from '../../../model/manifestationDto';
import { ManifestationService } from '../../../service/manifestation.service';

@Component({
  selector: 'app-panier-update',
  templateUrl: './panier-update.component.html',
  styleUrls: ['./panier-update.component.css']
})
export class PanierUpdateComponent implements OnInit {

  id: number;
  panier: PanierDto;
  manifestations: ManifestationDto[];

  constructor(private manifestationService: ManifestationService,
    private route: ActivatedRoute, private panierService: PanierService,
     private router: Router) { }

  ngOnInit() {
    this.panier = new PanierDto();
    this.manifestations = [];
   // this.panier.manifestation = new ManifestationDto ();

    let id = this.route.snapshot.params['id'];

    this.panierService.getOne(id).subscribe(
      res => {
        this.panier = res;
      }
    );

    this.manifestationService.subjectMiseAJour.subscribe(
      res => {
        this.manifestationService.getAll().subscribe(
          donnees => {
            this.manifestations = donnees;
          }
        );
      }
    );

    this.manifestationService.getAll().subscribe(
      resultat => {
        this.manifestations = resultat;
      }
    );


  }

  update(): void {
    let id = this.route.snapshot.params['id'];
    this.panierService.update(id, this.panier).subscribe(
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
    this.router.navigate(['/panier-list']);
  }

}

