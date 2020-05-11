import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/model/user';
import { RoleDto } from 'src/app/model/roleDto';
import { RoleService } from 'src/app/service/role.service';
import { UserService } from 'src/app/service/user.service';
import { Router, ActivatedRoute } from '@angular/router';
import { UserRoleService } from 'src/app/service/user-role.service';

@Component({
  selector: 'app-user-role-list',
  templateUrl: './user-role-list.component.html',
  styleUrls: ['./user-role-list.component.css']
})
export class UserRoleListComponent implements OnInit {

  users:User[];
  roles : RoleDto[];

  constructor(private roleService : RoleService , private userService: UserService
    ,private userRoleSrvice: UserRoleService
    , private router: Router,private route: ActivatedRoute) {}

  ngOnInit() {
    // let id = this.route.snapshot.paramMap.get('id');
    // this.userRoleSrvice.findByRole(this.roles.id).subscribe(
    //   res=>{
    //     this.roles= res
    //   }

    // )

  }

}
