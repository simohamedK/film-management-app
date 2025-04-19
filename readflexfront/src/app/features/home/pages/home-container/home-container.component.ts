import { CategoryService } from './../../../../shared/services/category/category.service';
import { Component, Input, OnInit } from '@angular/core';
import { RouterLink } from '@angular/router';
import { HeroBannerComponent } from '../../../../shared/component/hero-banner/hero-banner.component';
import { StoryService } from '../../../../shared/services/story/story.service';
import { Story } from '../../../../shared/models/story';
import { CardStoryComponent } from '../../../../shared/component/card-story/card-story.component';
import { Categorie } from '../../../../shared/models/categorie';

@Component({
  selector: 'app-home-container',
  standalone: true,
  imports: [RouterLink, HeroBannerComponent, CardStoryComponent],
  templateUrl: './home-container.component.html',
  styleUrl: './home-container.component.scss',
})
export class HomeContainerComponent implements OnInit {
  stories!: Story[];
  categories!: Categorie[];
  constructor(private storyservice: StoryService, private categoryService: CategoryService) {}

  ngOnInit(): void {
    // this.getStories();
    this.getCategories();
  }

  getCategories() {
    this.categoryService.getAllCategories().subscribe((categories) => {
      this.categories = categories
      console.log(this.categories);
    })
  }
}
