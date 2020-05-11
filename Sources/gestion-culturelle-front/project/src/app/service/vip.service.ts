import { Injectable } from '@angular/core';
import { VipDto } from '../model/vip-dto';
import { Subject, Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class VipService {

  monUrl = 'http://localhost:8080/vip'; 

  vip: VipDto[];

  subjectMiseAJour = new Subject<number>();

  constructor(private http: HttpClient) { }

  getAll(): Observable<any>{
    return this.http.get(this.monUrl)
  }

  add(vip: VipDto):Observable<object>{
    return this.http.post(this.monUrl,vip)
  }

  getOne(id: number): Observable<any>{
    return this.http.get(`${this.monUrl}/${id}`)
  }

  update(id: number,vip: Object): Observable<Object>{
    return this.http.put(`${this.monUrl}/${id}`,vip)
  }

  delete(id: number): Observable<any>{
    return this.http.delete(`${this.monUrl}/${id}`)
  }
}
