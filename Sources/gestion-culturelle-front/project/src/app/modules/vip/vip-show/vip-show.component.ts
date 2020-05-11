import { Component, OnInit } from '@angular/core';
import { VipDto } from 'src/app/model/vip-dto';
import { ActivatedRoute, Router } from '@angular/router';
import { VipService } from 'src/app/service/vip.service';
import { RoleDto } from 'src/app/model/roleDto';

@Component({
  selector: 'app-vip-show',
  templateUrl: './vip-show.component.html',
  styleUrls: ['./vip-show.component.css']
})
export class VipShowComponent implements OnInit {

  vip: VipDto;

  constructor(private route: ActivatedRoute, private router: Router, private vipService:VipService) { }

  ngOnInit() {
    
    this.vip = new VipDto();
    this.vip.role= new RoleDto();

    let id = this.route.snapshot.params['id'];

    this.vipService.getOne(id).subscribe(
      res=>{
        this.vip= res;
        console.log(res);
      }
    )
  }

}
