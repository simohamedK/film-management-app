import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { environment } from '../../../../environment/environment';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  userBaseUrl = environment.api + '/users';
  isUserLogged$ = new BehaviorSubject<boolean>(false);

  constructor(private http: HttpClient) {}

  login(loginData: any): Observable<any> {
    return this.http.post<any>(this.userBaseUrl + '/login', loginData);
  }
}
