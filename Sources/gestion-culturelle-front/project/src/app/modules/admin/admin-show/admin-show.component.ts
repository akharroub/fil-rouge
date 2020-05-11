import { Component, OnInit } from '@angular/core';
import { AdminDto } from 'src/app/model/adminDto';
import { ActivatedRoute, Router } from '@angular/router';
import { RoleDto } from 'src/app/model/roleDto';
import { AdminService } from 'src/app/service/admin.service';

@Component({
  selector: 'app-admin-show',
  templateUrl: './admin-show.component.html',
  styleUrls: ['./admin-show.component.css']
})
export class AdminShowComponent implements OnInit {

  admin: AdminDto;

  constructor(private route: ActivatedRoute, private adminService:AdminService, private router: Router) { }

  ngOnInit() {
    this.admin = new AdminDto();
    this.admin.role = new RoleDto();
   

    let id = this.route.snapshot.params['id'];

    this.adminService.getOne(id).subscribe(
      res => {
        this.admin = res;
      }
    );

  }

}
