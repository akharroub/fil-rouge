import { Component, OnInit } from '@angular/core';
import { VipDto } from 'src/app/model/vip-dto';
import { RoleDto } from 'src/app/model/roleDto';
import { VipService } from 'src/app/service/vip.service';
import { RoleService } from 'src/app/service/role.service';
import { ActivatedRoute, Router } from '@angular/router';


@Component({
  selector: 'app-vip-update',
  templateUrl: './vip-update.component.html',
  styleUrls: ['./vip-update.component.css']
})
export class VipUpdateComponent implements OnInit {

  id: number;
  vip: VipDto;
  roles: RoleDto[];
  
  constructor(private vipService: VipService , private roleService : RoleService,private route: ActivatedRoute,private router: Router) { }

  ngOnInit() {

    this.vip= new VipDto();
    this.roleService.getAll().subscribe(
      res=>{
        this.roles =res
      }
    );

    this.vip.role = new RoleDto();
    let id = this.route.snapshot.params['id'];
    this.vipService.getOne(id).subscribe(
      res=>{
        this.vip= res;
      }
    );

    this.roleService.subjectMiseAJour.subscribe(
      res=>{
        this.roleService.getAll().subscribe(
          donnees=>{
            this.roles = donnees;
          }
        );
      }
    );

    this.roleService.getAll().subscribe(
      resultat=>{
        this.roles = resultat;
      }
    );
  }

  update(): void {
    let id = this.route.snapshot.params['id'];
    this.vipService.update(id, this.vip).subscribe(
      res=>{
        console.log("Modification Ok");
        this.goHome()
      }
    );
  }

  onSubmit(){
this.update();
  }

  goHome() {
    this.router.navigate(['/public/vip-list']);
  }

}
