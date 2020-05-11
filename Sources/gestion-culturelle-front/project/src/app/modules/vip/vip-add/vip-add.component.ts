import { Component, OnInit } from '@angular/core';
import { VipDto } from 'src/app/model/vip-dto';
import { RoleDto } from 'src/app/model/roleDto';
import { VipService } from 'src/app/service/vip.service';
import { RoleService } from 'src/app/service/role.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-vip-add',
  templateUrl: './vip-add.component.html',
  styleUrls: ['./vip-add.component.css']
})
export class VipAddComponent implements OnInit {

  vip: VipDto;
  roles: RoleDto[];
  
  constructor(private vipService: VipService, private roleService : RoleService, private router: Router) { }

  ngOnInit() {

    this.vip = new VipDto();
    this.roles =[];    
    this.vip.role = new RoleDto();
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
    this.vipService.add(this.vip).subscribe(
      res => {    
        console.log("Ajout Ok ");
        this.goHome();
      }
    );
    this.vip = new VipDto();
  }

  goHome() {
    this.router.navigate(['/vip-list']);

  }

}

