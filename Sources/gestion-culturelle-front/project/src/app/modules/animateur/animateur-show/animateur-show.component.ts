import { Component, OnInit } from '@angular/core';
import { AnimateurDto } from 'src/app/model/animateurDto';
import { Router, ActivatedRoute } from '@angular/router';
import { AnimateurService } from 'src/app/service/animateur.service';
import { RoleDto } from 'src/app/model/roleDto';
import { AnimationDto } from 'src/app/model/animationDto';

@Component({
  selector: 'app-animateur-show',
  templateUrl: './animateur-show.component.html',
  styleUrls: ['./animateur-show.component.css']
})
export class AnimateurShowComponent implements OnInit {

  animateur : AnimateurDto;
  constructor(private route : ActivatedRoute, 
    private animateurService: AnimateurService,
    private router : Router ) { }

  ngOnInit() {
    this.animateur = new AnimateurDto();
    this.animateur.role = new RoleDto();
    this.animateur.animation = new AnimationDto();
    let id = this.route.snapshot.params['id'];

this.animateurService.getOne(id).subscribe(
  res=> {
    this.animateur=res;
    console.log(res);
  }
);

  }

}
