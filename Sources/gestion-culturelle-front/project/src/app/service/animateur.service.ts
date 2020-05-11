import { Injectable } from "@angular/core";
import { Subject, Observable } from "rxjs";
import { HttpClient } from "@angular/common/http";
import { AnimateurDto } from "../model/animateurDto";


@Injectable({
  providedIn: 'root'
})
export class AnimateurService {
 
  monUrl= 'http://localhost:8080/animateur'; 
 

  animateur: AnimateurDto[]; 

  subjectMiseAJour= new Subject<number>();

  constructor(private http: HttpClient) { }

  getAll(): Observable<any> {
    return this.http.get(this.monUrl);
  }
  
  add(animateur: AnimateurDto): Observable<object> {
    return this.http.post(this.monUrl,animateur);
  }
  
  getOne(id: number): Observable<any> {
    return this.http.get(`${this.monUrl}/${id}`);
  } 

  update(id: number, animateur: Object): Observable<Object> {
    return this.http.put(`${this.monUrl}/${id}`, animateur);
  }

 delete(id: number): Observable<any> {
    return this.http.delete(`${this.monUrl}/${id}`);
  }

}
