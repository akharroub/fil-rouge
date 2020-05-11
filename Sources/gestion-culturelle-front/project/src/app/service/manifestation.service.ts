import { Injectable } from '@angular/core';
import { ManifestationDto } from '../model/manifestationDto';
import { HttpClient } from '@angular/common/http'
import { Observable, Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ManifestationService {
 
  monUrl1= 'http://localhost:8080/public/manifestation'; 
  monUrl2 = 'http://localhost:8080/manifestation'; 

  manifestation: ManifestationDto[]; 

  subjectMiseAJour= new Subject<number>();

  constructor(private http: HttpClient) { }

  getAll(): Observable<any> {
    return this.http.get(this.monUrl1);
  }
  
  add(manifestation: ManifestationDto): Observable<object> {
    return this.http.post(this.monUrl2,manifestation);
  }
  
  getOne(id: number): Observable<any> {
    return this.http.get(`${this.monUrl2}/${id}`);
  } 

  update(id: number, manifestation: Object): Observable<Object> {
    return this.http.put(`${this.monUrl2}/${id}`, manifestation);
  }

 delete(id: number): Observable<any> {
    return this.http.delete(`${this.monUrl2}/${id}`);
  }

}
