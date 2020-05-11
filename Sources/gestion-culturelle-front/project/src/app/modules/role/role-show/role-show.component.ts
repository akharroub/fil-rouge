import { Component, OnInit } from '@angular/core';

import { ActivatedRoute, Router } from '@angular/router';
import { RoleService } from '../../../service/role.service';
import { RoleDto } from '../../../model/roleDto';

@Component({
  selector: 'app-role-show',
  templateUrl: './role-show.component.html',
  styleUrls: ['./role-show.component.css']
})
export class RoleShowComponent implements OnInit {
  role: RoleDto;
  constructor(private route: ActivatedRoute, private roleService:RoleService, private router: Router) { }
  ngOnInit() {
    this.role = new RoleDto();
    let id = this.route.snapshot.params['id'];
    this.roleService.getOne(id).subscribe(
      res => {
        this.role = res;
        console.log(res);
      }
    );
  }
}