import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AnimateurService } from '../../../service/animateur.service';
import { AnimateurDto } from '../../../model/animateurDto';
import { faInfoCircle, faEdit, faTrashAlt, faHome, faPlusSquare } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-animateur-list',
  templateUrl: './animateur-list.component.html',
  styleUrls: ['./animateur-list.component.css']
})
export class AnimateurListComponent implements OnInit {

  faInfoCircle =faInfoCircle;
  faEdit = faEdit;
  faTrashAlt = faTrashAlt;
  faHome = faHome;
  faPlusSquare = faPlusSquare;

  animateurs: AnimateurDto[];

  constructor(
    private animateurService: AnimateurService,
    private router: Router) { }
  

  ngOnInit() {
    this.animateurService.subjectMiseAJour.subscribe(
      res=> {
        this.animateurService.getAll().subscribe(
          donnees =>{
			  this.animateurs = donnees; 
          }
        );
      }
    );

    this.animateurService.getAll().subscribe(
      resultat =>{
          this.animateurs = resultat; 
        
      }
    );
  }

 delete(id:number) {
    this.animateurService.delete(id).subscribe(
      res=>{
        this.animateurService.subjectMiseAJour.next(0);
        console.log('delete Ok ');
      }
    )
  }
  
  redirectToUpdate(id:number){
    this.router.navigateByUrl('/animateur-update/'+id)
  }
   

  redirectToShow(id:number) {
    this.router.navigateByUrl('/animateur-show/'+id)
  }
}

