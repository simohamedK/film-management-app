import { Injectable } from '@angular/core';
import { Story } from '../../models/story';
import { Auteur } from '../../models/auteur';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../../environment/environment';

@Injectable({
  providedIn: 'root',
})
export class StoryService {
  constructor(private http: HttpClient) {}

  private baseUrl = `${environment.api}/story`;

  getAllStories(): Observable<Story[]> {
    return this.http.get<Story[]>(`${this.baseUrl}/get/all`);
  }
}
