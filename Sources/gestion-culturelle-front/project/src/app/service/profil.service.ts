import { Injectable } from '@angular/core';
import { Subject, Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { User } from '../model/user';

@Injectable({
  providedIn: 'root'
})
export class ProfilService {
  monUrl= 'http://localhost:8080/users'; 

  user: User [];
  subjectMiseAJour= new Subject<number>();

  constructor(private http: HttpClient) { }


  getOne(id: number): Observable<any> {
    return this.http.get(`${this.monUrl}/${id}`);
  } 

  update(id: number, user: Object): Observable<Object> {
    console.log({id});
    return this.http.put(`${this.monUrl}/${id}`, user);
  }

 
}
