import { Injectable } from '@angular/core';
import { User } from '../model/user';
import { RoleDto } from '../model/roleDto';
import { Subject, Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class UserRoleService {

monUrl = 'http://localhost:8080/user/role'

user:User[];
role:RoleDto[];

subjectMiseAJour= new Subject<number>();

  constructor(private http: HttpClient) { }

  findByRole(id: number): Observable<any>{
    return this.http.get(`${this.monUrl}/${id}`)
  }
}
