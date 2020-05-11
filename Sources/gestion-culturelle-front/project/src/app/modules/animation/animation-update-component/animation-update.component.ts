import { Component, OnInit } from '@angular/core';
import { AnimationService } from '../../../service/animation.service';
import { Router, ActivatedRoute } from '@angular/router';
import { AnimationDto } from '../../../model/animationDto';

@Component({
  selector: 'app-animation-update',
  templateUrl: './animation-update.component.html',
  styleUrls: ['./animation-update.component.css']
})
export class AnimationUpdateComponent implements OnInit {

  id: number;
  animation: AnimationDto;

  constructor(private route: ActivatedRoute, private animationService: AnimationService, private router: Router) { }

  ngOnInit() {
    this.animation = new AnimationDto();

    let id = this.route.snapshot.params['id'];

    this.animationService.getOne(id).subscribe(
      res => {
        this.animation = res;
      }
    );
  }

  update(): void {
    let id = this.route.snapshot.params['id'];
    this.animationService.update(id, this.animation).subscribe(
      res => {
        this.goHome();
      }
    );
  }

  onSubmit() {
this.update();
  }
  
  goHome() {
    this.router.navigate(['/public/animation-list']);
  }

}

