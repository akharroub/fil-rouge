import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { RoleDto } from '../../../model/roleDto';
import { RoleService } from '../../../service/role.service';

@Component({
  selector: 'app-role-add',
  templateUrl: './role-add.component.html',
  styleUrls: ['./role-add.component.css']
})
export class RoleAddComponent implements OnInit {
_
    role: RoleDto;   
  
    constructor(private roleService: RoleService, private router: Router) { }
  
    ngOnInit() {
      this.role = new RoleDto();  
    }
  
    add(): void {
      this.roleService.add(this.role).subscribe(
        res => {
          this.roleService.subjectMiseAJour.next(0);
          console.log("Ajout Ok");
          this.goHome();
        }
  
      ); 
      this.role = new RoleDto();    
    }
  
    goHome() {
      this.router.navigate(['/role-list']);
  
    }
  }


