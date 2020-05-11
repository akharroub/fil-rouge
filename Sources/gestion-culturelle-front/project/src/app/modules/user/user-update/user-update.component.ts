import { Component, OnInit } from '@angular/core';
import { UserService } from '../../../service/user.service';
import { Router, ActivatedRoute } from '@angular/router';
import { User } from '../../../model/user';
import { RoleDto } from '../../../model/roleDto';
import { RoleService } from '../../../service/role.service';

@Component({
  selector: 'app-user-update',
  templateUrl: './user-update.component.html',
  styleUrls: ['./user-update.component.css']
})
export class UserUpdateComponent implements OnInit {

  id: number;
  user: User;
  roles: RoleDto[];

  constructor(private route: ActivatedRoute,
    private userService: UserService,
    private router: Router,
    private roleService: RoleService) { }

  ngOnInit() {
    this.roles = [];
    this.user = new User();
    this.user.role = new RoleDto();

    let id = this.route.snapshot.params['id'];

    this.userService.getOne(id).subscribe(
      res => {
        this.user = res;
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
    this.userService.update(id, this.user).subscribe(
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
    this.router.navigate(['/user-list']);
  }





}
