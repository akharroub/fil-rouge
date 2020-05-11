import { Injectable } from '@angular/core';
import { SalleDto } from '../model/salleDto';
import { HttpClient } from '@angular/common/http'
import { Observable, Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SalleService {
 
  monUrl1= 'http://localhost:8080/public/salle'; 
  monUrl2 = 'http://localhost:8080/salle'; 

  salle: SalleDto[]; 

  subjectMiseAJour= new Subject<number>();

  constructor(private http: HttpClient) { }

  getAll(): Observable<any> {
    return this.http.get(this.monUrl1);
  }
  
  add(salle: SalleDto): Observable<object> {
    return this.http.post(this.monUrl2,salle);
  }
  
  getOne(id: number): Observable<any> {
    return this.http.get(`${this.monUrl2}/${id}`);
  } 

  update(id: number, salle: Object): Observable<Object> {
    return this.http.put(`${this.monUrl2}/${id}`, salle);
  }

 delete(id: number): Observable<any> {
    return this.http.delete(`${this.monUrl2}/${id}`);
  }

}
