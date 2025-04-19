import { Categorie } from './../../models/categorie';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../../environment/environment';

@Injectable({
  providedIn: 'root',
})
export class CategoryService {
  constructor(private http: HttpClient) {}

  private baseUrl = `${environment.api}/categorie`;

  getAllCategories(): Observable<Categorie[]> {

    return this.http.get<Categorie[]>(`${this.baseUrl}/get/all`);
  }
}
