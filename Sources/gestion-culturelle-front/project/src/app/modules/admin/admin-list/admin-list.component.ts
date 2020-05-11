import { Component, OnInit } from '@angular/core';
import { AdminDto } from '../../../model/adminDto';
import { AdminService } from '../../../service/admin.service';
import { Router } from '@angular/router';
import { faInfoCircle, faEdit, faTrashAlt, faHome, faPlusSquare } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-admin-list',
  templateUrl: './admin-list.component.html',
  styleUrls: ['./admin-list.component.css']
})
export class AdminListComponent implements OnInit {

  faInfoCircle =faInfoCircle;
  faEdit = faEdit;
  faTrashAlt = faTrashAlt;
  faHome = faHome;
  faPlusSquare = faPlusSquare;

  admins: AdminDto[];
  
  constructor(private adminService: AdminService,private router: Router) { }

  ngOnInit() {

    this.adminService.subjectMiseAJour.subscribe(
      res=> {
        this.adminService.getAll().subscribe(
          donnees =>{
			  this.admins = donnees; 
          }
        );
      }
    );

    this.adminService.getAll().subscribe(
      resultat =>{
          this.admins = resultat; 
        
      }
    );
  }

 delete(id:number) {
    this.adminService.delete(id).subscribe(
      res=>{
        this.adminService.subjectMiseAJour.next(0);
        console.log('delete Ok ');
      }
    )
  }
  
  redirectToUpdate(id:number){
    this.router.navigateByUrl('/admin-update/'+id)
  }
   

  redirectToShow(id:number) {
    this.router.navigateByUrl('/admin-show/'+id)
  }

}
