import { Injectable } from '@angular/core';
import { PanierDto } from '../model/panierDto';
import { HttpClient } from '@angular/common/http'
import { Observable, Subject } from 'rxjs';
import { ManifestationDto } from '../model/manifestationDto';
import { CommandeDto } from '../model/commandeDto';

@Injectable({
  providedIn: 'root'
})
export class CommandeService {
 
  monUrl= 'http://localhost:8080/commande'; 

  commande: CommandeDto[]; 

  subjectMiseAJour= new Subject<number>();

  constructor(private http: HttpClient) { }

  getAll(): Observable<any> {
    return this.http.get(this.monUrl);
  }
  
  add(commande: CommandeDto): Observable<object> {
    return this.http.post(this.monUrl,commande);
  }
  
  getOne(id: number): Observable<any> {
    return this.http.get(`${this.monUrl}/${id}`);
  } 

  getUser(id: number): Observable<any> {
    return this.http.get(`${this.monUrl}/user/${id}`);
  } 
  
  getCommandes(id: number): Observable<any> {
    return this.http.get(`${this.monUrl}/panier/${id}`);
  } 

  update(id: number, commande: Object): Observable<Object> {
    return this.http.put(`${this.monUrl}/${id}`, commande);
  }

  delete(id: number): Observable<any> {
    return this.http.delete(`${this.monUrl}/${id}`);
  }


 
}

