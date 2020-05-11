import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AdminDto } from '../../../model/adminDto';
import { AdminService } from 'src/app/service/admin.service';
import { RoleService } from 'src/app/service/role.service';
import { RoleDto } from 'src/app/model/roleDto';


@Component({
  selector: 'app-admin-add',
  templateUrl: './admin-add.component.html',
  styleUrls: ['./admin-add.component.css']
})
export class AdminAddComponent implements OnInit {

  admin: AdminDto;
  roles: RoleDto[];

  constructor(private adminService: AdminService, private roleService : RoleService, private router: Router) { }

  ngOnInit() {
    this.admin = new AdminDto();

    this.roles =[];    
    
    this.admin.role = new RoleDto();

    this.roleService.subjectMiseAJour.subscribe(
      res => {
        this.roleService.getAll().subscribe(
          donnees => {
            this.roles = donnees;
          }
        );
      }
    ); 
    this.roleService.getAll().subscribe(
      resultat => {
        this.roles = resultat;
      }
    );
    }
  

  add(): void {
    this.adminService.add(this.admin).subscribe(
      res => {    
        this.goHome();
      }
    );
    this.admin = new AdminDto();
  }

  goHome() {
    this.router.navigate(['/admin-list']);

  }

}
