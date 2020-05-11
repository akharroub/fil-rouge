import { Component, OnInit } from '@angular/core';
import { AnimationDto } from 'src/app/model/animationDto';
import { AnimateurDto } from 'src/app/model/animateurDto';
import { RoleDto } from 'src/app/model/roleDto';
import { AnimationService } from 'src/app/service/animation.service';
import { AnimateurService } from 'src/app/service/animateur.service';
import { RoleService } from 'src/app/service/role.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-animateur-update',
  templateUrl: './animateur-update.component.html',
  styleUrls: ['./animateur-update.component.css']
})
export class AnimateurUpdateComponent implements OnInit {
 

  id: number;
  animateur: AnimateurDto;
  animations: AnimationDto[];
  role: RoleDto;
  
  constructor(
    private animationService : AnimationService,
    private animateurService : AnimateurService,
    private roleService : RoleService,
    private route: ActivatedRoute,
    private router: Router) { }

  ngOnInit() {

    this.animateur = new AnimateurDto();
    this.animations = [];
    this.role = new RoleDto();

    this.animateur.animation = new AnimationDto();
    this.animateur.role = new RoleDto();

    let id = this.route.snapshot.params['id'];

    this.animateurService.getOne(id).subscribe(
      res=> {
        this.animateur = res;
      }
    );
        this.animationService.subjectMiseAJour.subscribe(
          res => {
            this.animationService.getAll().subscribe(
              donnees => {
                this.animations = donnees
              }
            );
          }
        );
 
  this.animationService.getAll().subscribe(
    resultat=> {
      this.animations = resultat;
    }
  );

  this.roleService.getOne(id).subscribe(
    res => {
      this.role = res;
    }
  );


  }

  update(): void {
    let id = this.route.snapshot.params['id'];
    this.animateurService.update(id, this.animateur).subscribe(
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
    this.router.navigate(['/animateur-list']);
  }
}





