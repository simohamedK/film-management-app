import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { User } from '../../../../shared/models/user';
import { UserService } from '../../../../shared/services/user/user.service';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-user-management',
  standalone: true,
  imports: [CommonModule,HttpClientModule,FormsModule],
  templateUrl: './user-management.component.html',
  styleUrls: ['./user-management.component.scss']
})
export class UserManagementComponent implements OnInit {
  users: User[] = [];
  filteredUsers: User[] = [];
  newUser: User = { id:0, username: '', email: '', password: '', admin: false };
  selectedUser: User | null = null;  // Pour stocker l'utilisateur à modifier
  showAddUserForm: boolean = false;
  showListUserForm: boolean = true;
  showEditUserForm: boolean = false; // Pour afficher le formulaire de modification
  isSubmitted: boolean = false; // Pour gérer l'état de soumission

  constructor(private userService: UserService) {}

  ngOnInit(): void {
    this.loadUsers();
  }

  loadUsers(): void {
    this.userService.getAllUsers().subscribe(
      (data) => {
        this.users = data;
        this.filteredUsers = this.users; // Affiche tous les utilisateurs par défaut
      },
      (error) => {
        console.error('Erreur lors du chargement des utilisateurs:', error);
      }
    );
  }

  filterUsers(filter: string): void {
    if (filter === 'all') {
      this.filteredUsers = this.users;
    } else if (filter === 'admin') {
      this.filteredUsers = this.users.filter(user => user.admin);
    } else if (filter === 'normal') {
      this.filteredUsers = this.users.filter(user => !user.admin);
    }
  }
  // Ouvrir le formulaire de modification avec les données de l'utilisateur
  openEditUserForm(user: User): void {
    this.selectedUser = { ...user };  // Faire une copie de l'utilisateur
      this.showEditUserForm = true;
      this.showListUserForm = false;
  }

  // Soumettre les modifications
  submitEditUser(): void {
    if (this.selectedUser) {
      this.userService.updateUser(this.selectedUser).subscribe(
        () => {
          this.loadUsers();  // Recharger la liste après la mise à jour
          this.closeEditUserForm();
        },
        (error) => {
          console.error('Erreur lors de la mise à jour de l\'utilisateur:', error);
        }
      );
    }
  }

  // Fermer le formulaire de modification
  closeEditUserForm(): void {
    this.selectedUser = null;
    this.showEditUserForm = false;
    this.showListUserForm= true;
  }

 openAddUserForm(): void {
    this.showAddUserForm = true;
    this.showListUserForm = false;
  }

  submitAddUser(): void {
    this.isSubmitted = true;
    this.userService.createUser(this.newUser).subscribe(
      (user) => {
        this.loadUsers(); // Recharge la liste après ajout
        this.newUser = { id: 0, username: '', email: '', password: '', admin: false }; // Réinitialiser le formulaire
        this.closeAddUserForm()
        this.isSubmitted = false;
      },
      (error) => {
        console.error('Erreur lors de l\'ajout de l\'utilisateur:', error);
      }
    );
  }
  closeAddUserForm(): void {
    this.showAddUserForm = false;
    this.showListUserForm = true;
  }


  deleteUser(user: User): void {
    if (confirm(`Êtes-vous sûr de vouloir supprimer l'utilisateur ${user.username} ?`)) {
      this.userService.deleteUser(user.id).subscribe(() => {
        this.loadUsers(); // Recharge la liste après la suppression
      }, error => {
        console.error('Erreur lors de la suppression de l’utilisateur:', error);
      });
    }
  }


  changeStatus(user: User): void {
    this.userService.changeUserStatus(user.id).subscribe(() => {
      this.loadUsers(); // Recharge la liste après le changement de statut
    }, error => {
      console.error('Erreur lors du changement de statut de l’utilisateur:', error);
    });
  }
}




