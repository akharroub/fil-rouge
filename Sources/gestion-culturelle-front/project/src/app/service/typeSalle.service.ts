import { Injectable } from '@angular/core';
import { TypeSalleDto } from '../model/typeSalleDto';
import { HttpClient } from '@angular/common/http'
import { Observable, Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TypeSalleService {

  monUrl = 'http://localhost:8080/typesalle';

  typeSalles: TypeSalleDto[];

  subjectMiseAJour = new Subject<number>();

  constructor(private http: HttpClient) { }

  getAll(): Observable<any> {
    return this.http.get(this.monUrl);
  }

  getOne(id: number): Observable<any> {
    return this.http.get(`${this.monUrl}/${id}`);
  }

  add(typeSalle: TypeSalleDto): Observable<object> {
    return this.http.post(this.monUrl, typeSalle);
  }

  update(id: number, typeSalle: Object): Observable<Object> {
    return this.http.put(`${this.monUrl}/${id}`, typeSalle);
  }

  delete(id: number): Observable<any> {
    return this.http.delete(`${this.monUrl}/${id}`);
  }

}
