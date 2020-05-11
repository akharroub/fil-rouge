import { Component, OnInit } from '@angular/core';
import { Injectable } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { Subject, Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { AuthService } from '../../../service/auth.service';
import { User } from '../../../model/user';

import { InscriptionService } from '../../../service/inscription.service';

@Component({
  selector: 'app-inscription',
  templateUrl: './inscription.component.html',
  styleUrls: ['./inscription.component.css']
})
export class InscriptionComponent implements OnInit {

  user: User;

  constructor(private router: Router, private inscriptionService: InscriptionService,
    private route: ActivatedRoute, private authService: AuthService) { }

  ngOnInit() {
    this.user = new User();
   
  }

  add(): void {
    this.inscriptionService.add(this.user).subscribe(
      res => {
        this.goHome();
      }
    );
  }


  goHome() {
    this.router.navigate(['/public']);
  }


}
