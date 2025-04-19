import {Component, OnInit} from '@angular/core';
import {Categorie} from "../../../../shared/models/categorie";
import {CategorieService} from "../../../../shared/services/categorie/categorie.service";
import {FormsModule} from "@angular/forms";
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-category-management',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
  ],
  templateUrl: './category-management.component.html',
  styleUrl: './category-management.component.scss'
})


export class CategoryManagementComponent implements OnInit {
  categories: Categorie[] = [];
  newCategory: Categorie = {
    id: 0, name: '',
    storys: []
  };
  selectedCategory: Categorie | null = null;
  showAddCategoryForm: boolean = false;
  showEditCategoryForm: boolean = false;

  constructor(private categoryService: CategorieService) {}

  ngOnInit(): void {
    this.loadCategories();
  }

  loadCategories(): void {
    this.categoryService.getAllCategories().subscribe(
      (data) => {
        this.categories = data;
      },
      (error) => {
        console.error('Erreur lors du chargement des catégories:', error);
      }
    );
  }

  openAddCategoryForm(): void {
    this.showAddCategoryForm = true;
  }

  submitAddCategory(): void {
    this.categoryService.createCategorie(this.newCategory).subscribe(
      () => {
        this.loadCategories();
        this.newCategory = { id: 0, name: '', storys:[] };
        this.showAddCategoryForm = false;
      },
      (error) => {
        console.error('Erreur lors de l\'ajout de la catégorie:', error);
      }
    );
  }

  openEditCategoryForm(category: Categorie): void {
    this.selectedCategory = { ...category };
    this.showEditCategoryForm = true;

  }

  submitEditCategory(): void {
    if (this.selectedCategory) {
      this.categoryService.updateCategorie(this.selectedCategory).subscribe(
        () => {
          this.loadCategories();
          this.selectedCategory = null;
          this.showEditCategoryForm = false;
        },
        (error) => {
          console.error('Erreur lors de la mise à jour de la catégorie:', error);
        }
      );
    }
  }

  deleteCategory(category: Categorie): void {
    if (confirm(`Êtes-vous sûr de vouloir supprimer la catégorie ${category.name} ?`)) {
      this.categoryService.deleteCategorie(category.id).subscribe(() => {
        this.loadCategories();
      }, error => {
        console.error('Erreur lors de la suppression de la catégorie:', error);
      });
    }
  }
}
