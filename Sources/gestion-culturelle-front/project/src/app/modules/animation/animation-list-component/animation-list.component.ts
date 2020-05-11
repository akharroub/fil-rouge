import { Component, OnInit } from '@angular/core';
import { AnimationService } from '../../../service/animation.service';
import { Router } from '@angular/router';
import { AnimationDto } from '../../../model/animationDto';
import { AuthService } from '../../../service/auth.service';
import { RoleDto } from '../../../model/roleDto';
import { faInfoCircle, faEdit, faTrashAlt, faHome, faPlusSquare } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-animation-list',
  templateUrl: './animation-list.component.html',
  styleUrls: ['./animation-list.component.css']
})
export class AnimationListComponent implements OnInit {

  faInfoCircle =faInfoCircle;
  faEdit = faEdit;
  faTrashAlt = faTrashAlt;
  faHome = faHome;
  faPlusSquare = faPlusSquare;

  isConnected: boolean;
  isAnim: boolean;
  isRespAdmin: boolean;
  user: String;
  role: RoleDto;
  animations: AnimationDto[];

  constructor(private animationService: AnimationService, private router: Router,
    private authService: AuthService) { }

  ngOnInit() {
    this.isConnected = this.authService.isConnected();
    if (this.authService.getCurrentUser()) {
      this.isAnim = this.authService.getCurrentUser().role.label === 'ANIM';
      this.isRespAdmin = (this.authService.getCurrentUser().role.label === 'RESP') || (this.authService.getCurrentUser().role.label === 'ADMIN');
      this.user = this.authService.getCurrentUser().nom;
      this.role = this.authService.getCurrentUser().role;
    }

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
    this.authService.subjectConnexion.subscribe(
      res => {
        this.isConnected = this.authService.isConnected();

      }
    );
  }

  delete(id: number) {
    this.animationService.delete(id).subscribe(
      res => {
        this.animationService.subjectMiseAJour.next(0);
        console.log('delete Ok ');
      }
    )
  }

  redirectToUpdate(id: number) {
    this.router.navigateByUrl('/animation-update/' + id)
  }


  redirectToShow(id: number) {
    this.router.navigateByUrl('/animation-show/' + id)
  }
}
