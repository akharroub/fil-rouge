import { Injectable } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Subject, Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { User } from '../model/user';


@Injectable({
  providedIn: 'root'
})
export class InscriptionService {
  monUrl= 'http://localhost:8080/newusers'; 

  user: User [];
  subjectMiseAJour= new Subject<number>();

  constructor(private http: HttpClient) { }

  
  add(user: User): Observable<any> {
    return this.http.post(this.monUrl,user);
  }

  

}
