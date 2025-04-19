import { Component, OnInit } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { FooterComponent } from './core/component/footer/footer.component';
import { HeaderComponent } from './core/component/header/header.component';
import { UserService } from './shared/services/user/user.service';
import { User } from './shared/models/user';
import { ProgrammeContainerComponent } from './features/nos-programmes/pages/programme-container/programme-container.component';
import { CardStoryComponent } from './shared/component/card-story/card-story.component';
import { StoryService } from './shared/services/story/story.service';
import { HttpClientModule } from '@angular/common/http';import { AuthService } from './shared/services/auth/auth.service';
import { CategoryService } from './shared/services/category/category.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [
    RouterOutlet,
    HeaderComponent,
    FooterComponent,
    HttpClientModule
    ],
  providers: [StoryService, CategoryService],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
})
export class AppComponent implements OnInit {
  title = 'readflex-frontend';
  constructor(private authService: AuthService) {}

  ngOnInit(): void {
    this.initApp();
  }

  initApp() {
    const isUserLogged = localStorage.getItem('isUserLogged');

    if (isUserLogged) {
      this.authService.isUserLogged$.next(true);
    }
  }
}
