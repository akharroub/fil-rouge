import { Component, OnInit } from '@angular/core';
import { ManifestationDto } from '../../../model/manifestationDto';
import { ActivatedRoute, Router } from '@angular/router';
import { ManifestationService } from '../../../service/manifestation.service';
import { AdminDto } from '../../../model/adminDto';
import { AnimationDto } from '../../../model/animationDto';
import { SalleDto } from '../../../model/salleDto';

@Component({
  selector: 'app-manifestation-show',
  templateUrl: './manifestation-show.component.html',
  styleUrls: ['./manifestation-show.component.css']
})
export class ManifestationShowComponent implements OnInit {

  manifestation: ManifestationDto;

  constructor(private route: ActivatedRoute, private manifestationService:ManifestationService, private router: Router) { }

  ngOnInit() {
    this.manifestation = new ManifestationDto();
    this.manifestation.salle = new SalleDto();
    this.manifestation.validateur = new AdminDto();
    this.manifestation.animation = new AnimationDto();
    this.manifestation.annulateur = new AdminDto ();

    let id = this.route.snapshot.params['id'];

    this.manifestationService.getOne(id).subscribe(
      res => {
        this.manifestation = res;
        console.log(res);
      }
    );

  }


}

