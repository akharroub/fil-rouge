import { Component, OnInit } from '@angular/core';
import { Injectable } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { Subject, Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../../service/auth.service';
import { ProfilService } from '../../../service/profil.service';
import { User } from '../../../model/user';

@Component({
  selector: 'app-profil',
  templateUrl: './profil.component.html',
  styleUrls: ['./profil.component.css']
})
export class ProfilComponent implements OnInit {

  id: number;
  user: User;

  constructor(private router: Router, private profilService: ProfilService,
    private route: ActivatedRoute, private authService: AuthService) { }

  ngOnInit() {
    this.user = new User();

    /* this.user = this.authService.getCurrentUser().nom; */
    let id = this.authService.getCurrentUser().id;

    this.profilService.getOne(id).subscribe(
      res => {
        this.user = res;
      }
    )

  }

  update(): void {
    let id = this.authService.getCurrentUser().id;
    console.log({ id });
    this.profilService.update(id, this.user).subscribe(
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
    this.router.navigate(['/public']);
  }



}
