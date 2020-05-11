import { Component, OnInit } from '@angular/core';
import { RoleService } from '../../../service/role.service';
import { ActivatedRoute, Router } from '@angular/router';
import { RoleDto } from '../../../model/roleDto';

@Component({
  selector: 'app-role-update',
  templateUrl: './role-update.component.html',
  styleUrls: ['./role-update.component.css']
})
export class RoleUpdateComponent implements OnInit {

  id: number;
  role: RoleDto;

  constructor(private route: ActivatedRoute, private roleService: RoleService, private router: Router) { }

  ngOnInit() {
    this.role = new RoleDto();

    let id = this.route.snapshot.params['id'];

    this.roleService.getOne(id).subscribe(
      res => {
        this.role = res;
      }
    );
  }

  update(): void {
    let id = this.route.snapshot.params['id'];
    this.roleService.update(id,this.role).subscribe(
      res => {
       console.log("Modification Ok");
        this.goHome();
      }
    );
  }

  onSubmit() {
this.update();
  }
  
  goHome() {
    this.router.navigate(['/role-list']);
  }

}
