import { Component, OnInit } from "@angular/core";
import { RoleDto } from "../../../model/roleDto";
import { Router } from "@angular/router";
import { RoleService } from "../../../service/role.service";
import { faInfoCircle, faEdit, faTrashAlt } from '@fortawesome/free-solid-svg-icons';


@Component({
  selector: 'app-role-list',
  templateUrl: './role-list.component.html',
  styleUrls: ['./role-list.component.css']
})
export class RoleListComponent implements OnInit {
  faInfoCircle =faInfoCircle;
  faEdit = faEdit;
  faTrashAlt = faTrashAlt;
  roles: RoleDto[];
  
  constructor(private roleService: RoleService,private router: Router) { }

  ngOnInit() {

    this.roleService.subjectMiseAJour.subscribe(
      res=> {
        this.roleService.getAll().subscribe(
          donnees =>{
			  this.roles = donnees; 
          }
        );
      }
    );

    this.roleService.getAll().subscribe(
      resultat =>{
          this.roles = resultat; 
               }
    );
  }

  delete(id:number) {
    this.roleService.delete(id).subscribe(
      res=>{
        this.roleService.subjectMiseAJour.next(0);
        console.log('delete Ok ');
      }
    )
  }
  
  redirectToUpdate(id:number){
    this.router.navigateByUrl('/role-update/'+id)
  }
   

  redirectToShow(id:number) {
    this.router.navigateByUrl('/role-show/'+id)
  }

}
