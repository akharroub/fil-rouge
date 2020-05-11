import { Component, OnInit } from '@angular/core';
import { User } from '../../..//model/user';
import { UserService } from '../../../service/user.service';
import { Router } from '@angular/router';
import { RoleService } from '../../../service/role.service';
import { RoleDto } from '../../../model/roleDto';

@Component({
  selector: 'app-user-add',
  templateUrl: './user-add.component.html',
  styleUrls: ['./user-add.component.css']
})
export class UserAddComponent implements OnInit {

  user: User;
  roles: RoleDto[];
  
  constructor(private userService: UserService, 
    private router: Router,
    private roleService: RoleService ) { }

  ngOnInit() {
    this.roles= [];
    this.user = new User();
    this.user.role = new RoleDto();
    this.roleService.getAll().subscribe(
      res=>{
        this.roles = res;
      }
    );
  }

  add() : void {
    this.userService.add(this.user).subscribe(
      res=>{
        this.router.navigateByUrl('/user-list');
      }
    );
  }

}
