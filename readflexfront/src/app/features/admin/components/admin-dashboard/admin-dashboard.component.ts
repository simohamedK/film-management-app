import { Component } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-admin-dashboard',
  //standalone: true,
  //imports: [],
  templateUrl: './admin-dashboard.component.html',
  styleUrl: './admin-dashboard.component.scss'
})


export class AdminDashboardComponent {

  constructor(private router: Router) {}

  goToUsers() {
    this.router.navigate(['/user-management']);
  }

  goToStories() {
    this.router.navigate(['/story-management']);
  }

  goToCategories() {
    this.router.navigate(['/category-management']);
  }
}