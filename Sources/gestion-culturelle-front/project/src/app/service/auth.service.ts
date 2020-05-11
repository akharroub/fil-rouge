import { Injectable, OnInit } from '@angular/core';
import { Subject, Observable } from 'rxjs';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { UserAuth } from '../model/user-auth';
import { User } from '../model/user';
import { JwtHelperService } from '@auth0/angular-jwt';
import { RoleDto } from '../model/roleDto';
import { ToastrService } from 'ngx-toastr';
import { PanierService } from './panier.service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  
  url: string;
  subjectConnexion: Subject<number>;
  currentUser: User;
  subjectMiseAJour: Subject<number>;

  constructor(private router: Router, private http: HttpClient,
    private toastrService: ToastrService, private panierService : PanierService,
    private authService: AuthService) {
    this.url = 'http://localhost:8080/public/login';
    this.subjectConnexion = new Subject<number>();
  }

  isConnected(): boolean {
    return Boolean(localStorage.getItem('isConnected'));
  }

  getCurrentUser() : User {
    const userStr = localStorage.getItem('current_user');
    return JSON.parse(userStr);
  }


  login(user: UserAuth): Observable<boolean> {
    return new Observable(observer => {
      this.http.post(this.url, user).subscribe(res => {
        localStorage.setItem('isConnected', 'true');
        localStorage.setItem('access_token', res['token']);
        const currentUser = new User();
        const helper = new JwtHelperService();
        
        const decodedToken = helper.decodeToken(res['token']);
        currentUser.id = decodedToken.sub;
        currentUser.nom = decodedToken.username;
        currentUser.role = new RoleDto();
        currentUser.role.label = decodedToken.roles;
        localStorage.setItem('current_user', JSON.stringify(currentUser));

        this.subjectConnexion.next(1);
        this.toastrService.success('Bienvenue '+currentUser.nom,'Connexion Ok');
        observer.next(true);
      },
        err => {
          observer.next(false);
        },
        () => {
          observer.complete();
        });
    });

  }

  logout() {
    localStorage.removeItem('isConnected');
    localStorage.removeItem('access_token');
    localStorage.removeItem('current_user');
    this.toastrService.info('A bientôt', 'Deconnexion');
    this.subjectConnexion.next(0);
    this.router.navigateByUrl('/public/login');
  }
}
