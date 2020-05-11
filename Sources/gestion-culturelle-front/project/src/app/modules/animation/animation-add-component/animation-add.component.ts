import { Component, OnInit } from '@angular/core';
import { AnimationService } from '../../../service/animation.service';
import { Router } from '@angular/router';
import { AnimationDto } from '../../../model/animationDto';

@Component({
  selector: 'app-animation-add',
  templateUrl: './animation-add.component.html',
  styleUrls: ['./animation-add.component.css']
})
export class AnimationAddComponent implements OnInit {
 
  animation: AnimationDto;

  constructor(private animationService: AnimationService, private router: Router) { }

  ngOnInit() {
    this.animation = new AnimationDto();
    
  }

  add(): void {
    this.animationService.add(this.animation).subscribe(
      res => {
        this.animationService.subjectMiseAJour.next(0);
        console.log("Ajout Ok ");        
        this.goHome();
      }
    );
    this.animation = new AnimationDto();
  }

  goHome() {
    this.router.navigate(['/public/animation-list']);

  }

}
