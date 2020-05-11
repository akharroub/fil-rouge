import { Injectable } from '@angular/core';
import { AnimationDto } from '../model/animationDto';
import { HttpClient } from '@angular/common/http'
import { Observable, Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AnimationService {
 
  monUrl1= 'http://localhost:8080/public/animation'; 
  monUrl2 = 'http://localhost:8080/animation'; 

  animation: AnimationDto[]; 

  subjectMiseAJour= new Subject<number>();

  constructor(private http: HttpClient) { }

  getAll(): Observable<any> {
    return this.http.get(this.monUrl1);
  }
  
  add(animation: AnimationDto): Observable<object> {
    return this.http.post(this.monUrl2,animation);
  }
  
  getOne(id: number): Observable<any> {
    return this.http.get(`${this.monUrl2}/${id}`);
  } 

  update(id: number, animation: Object): Observable<Object> {
    return this.http.put(`${this.monUrl2}/${id}`, animation);
  }

 delete(id: number): Observable<any> {
    return this.http.delete(`${this.monUrl2}/${id}`);
  }

}
