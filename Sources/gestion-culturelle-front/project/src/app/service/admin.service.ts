import { Injectable } from '@angular/core';
import { AdminDto } from '../model/adminDto';
import { HttpClient } from '@angular/common/http'
import { Observable, Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AdminService {
 
  monUrl= 'http://localhost:8080/admin'; 

  admin: AdminDto[]; 

  subjectMiseAJour= new Subject<number>();

  constructor(private http: HttpClient) { }

  getAll(): Observable<any> {
    return this.http.get(this.monUrl);
  }
  
  add(admin: AdminDto): Observable<object> {
    return this.http.post(this.monUrl,admin);
  }
  
  getOne(id: number): Observable<any> {
    return this.http.get(`${this.monUrl}/${id}`);
  } 

  update(id: number, admin: Object): Observable<Object> {
    return this.http.put(`${this.monUrl}/${id}`, admin);
  }

 delete(id: number): Observable<any> {
    return this.http.delete(`${this.monUrl}/${id}`);
  }

}
