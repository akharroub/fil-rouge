import { RoleDto } from 'src/app/model/roleDto';
import { Component, OnInit } from '@angular/core';
import { RoleService } from 'src/app/service/role.service';
import { AnimationService } from '../../../service/animation.service';
import { Router } from '@angular/router';
import { AnimationDto } from '../../../model/animationDto';
import{AnimateurDto} from '../../../model/animateurDto';
import { AnimateurService } from '../../../service/animateur.service';

@Component({
  selector: 'app-animateur-add',
  templateUrl: './animateur-add.component.html',
  styleUrls: ['./animateur-add.component.css']
})
export class AnimateurAddComponent implements OnInit {

  animateur: AnimateurDto;
  role:RoleDto;
  animations: AnimationDto[];


  constructor(private animateurService: AnimateurService, 
    private roleService : RoleService,
    private animationService : AnimationService,
    private router: Router) { }

  ngOnInit() {
    this.animateur = new AnimateurDto();
    this.role= new RoleDto();
    this.animations =[]; 

    this.animateur.animation= new AnimationDto();
    this.animateur.role= new RoleDto();   
    
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

  }
  

  add(): void {
    this.animateurService.add(this.animateur).subscribe(
      res => {    
        console.log("Ajout Ok ");
        this.goHome();
      }
    );
    this.animateur = new AnimateurDto();
    this.animateur.role = new RoleDto();
    this.animateur.animation = new AnimationDto();
  }

  goHome() {
    this.router.navigate(['/animateur-list']);

  }

}