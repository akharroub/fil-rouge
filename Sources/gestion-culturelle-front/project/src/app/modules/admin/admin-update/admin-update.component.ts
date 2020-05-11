import { Component, OnInit } from '@angular/core';
import { AdminDto } from 'src/app/model/adminDto';
import { RoleDto } from 'src/app/model/roleDto';
import { AdminService } from 'src/app/service/admin.service';
import { RoleService } from 'src/app/service/role.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-admin-update',
  templateUrl: './admin-update.component.html',
  styleUrls: ['./admin-update.component.css']
})
export class AdminUpdateComponent implements OnInit {
  
  id: number;
  admin: AdminDto;
  roles: RoleDto[];

  constructor(private adminService: AdminService, private roleService : RoleService,private route: ActivatedRoute,private router: Router) { }

  ngOnInit() {
    this.admin = new AdminDto();
    this.roles =[];
   
    
    this.admin.role = new RoleDto();  

    let id = this.route.snapshot.params['id'];

    this.adminService.getOne(id).subscribe(
      res => {
        this.admin = res;
      }
    );
  

 

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

 

  update(): void {
    let id = this.route.snapshot.params['id'];
    this.adminService.update(id, this.admin).subscribe(
      res => {
        this.goHome();
      }
    );
  }

  onSubmit() {
    this.update();
  }

  goHome() {
    this.router.navigate(['/admin-list']);
  }

}
