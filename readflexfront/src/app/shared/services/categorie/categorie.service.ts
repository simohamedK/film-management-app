import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Categorie } from '../../models/categorie'; // Assure-toi que ce modèle existe

@Injectable({
  providedIn: 'root',
})
export class CategorieService {
  private apiUrl = 'http://localhost:8080/api/categorie';

  constructor(private http: HttpClient) {}

  // Récupérer toutes les catégories
  getAllCategories(): Observable<Categorie[]> {
    return this.http.get<Categorie[]>(`${this.apiUrl}/get/all`);
  }

  // Récupérer une catégorie par ID
  getCategorieById(id: number): Observable<Categorie> {
    return this.http.get<Categorie>(`${this.apiUrl}/get/by/id/${id}`);
  }

  // Créer une nouvelle catégorie
  createCategorie(categorie: Categorie): Observable<Categorie> {
    return this.http.post<Categorie>(`${this.apiUrl}/create`, categorie);
  }

  // Supprimer une catégorie par ID
  deleteCategorie(id: number): Observable<Categorie> {
    return this.http.delete<Categorie>(`${this.apiUrl}/delete/${id}`);
  }

  // Mettre à jour une catégorie
  updateCategorie(categorie: Categorie): Observable<Categorie> {
    return this.http.put<Categorie>(`${this.apiUrl}/update/${categorie.id}`, categorie);
  }

}
