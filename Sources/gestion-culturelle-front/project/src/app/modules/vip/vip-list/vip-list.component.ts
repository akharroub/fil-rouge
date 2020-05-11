import { Component, OnInit } from '@angular/core';
import { VipService } from '../../../service/vip.service';
import { Router } from '@angular/router';
import { VipDto } from '../../../model/vip-dto';
import { AuthService } from 'src/app/service/auth.service';
import { RoleDto } from 'src/app/model/roleDto';
import { faInfoCircle, faEdit, faTrashAlt, faHome, faPlusSquare } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-vip-list',
  templateUrl: './vip-list.component.html',
  styleUrls: ['./vip-list.component.css']
})
export class VipListComponent implements OnInit {

  faInfoCircle =faInfoCircle;
  faEdit = faEdit;
  faTrashAlt = faTrashAlt;
  faHome = faHome;
  faPlusSquare = faPlusSquare;

  vips: VipDto[];
  isResp: boolean;
  user : String;
  role : RoleDto;
  isConnected: boolean;

  constructor(private vipService: VipService, private router: Router,
    private authService: AuthService
    ) { }

  ngOnInit() {

     
    this.isConnected = this.authService.isConnected();
    if(this.authService.getCurrentUser()){
this.isResp=this.authService.getCurrentUser().role.label==='RESP';
this.user = this.authService.getCurrentUser().nom;
this.role = this.authService.getCurrentUser().role;
    }
    this.vipService.subjectMiseAJour.subscribe(
      res => {
        this.vipService.getAll().subscribe(
          donnees => {
            this.vips = donnees;
          }
        );
      }
    );

    this.vipService.getAll().subscribe(
      resultat => {
        this.vips = resultat;
      }
    );
  }

  delete(id: number) {
    this.vipService.delete(id).subscribe(
      res => {
        this.vipService.subjectMiseAJour.next(0)
        console.log('delete ok');
      }
    )
  }

  redirectToUpdate(id: number) {
    this.router.navigateByUrl('/vip-update/' + id)
  }

  redirectToShow(id: number) {
    this.router.navigateByUrl('/vip-show/' + id)
  }

}
