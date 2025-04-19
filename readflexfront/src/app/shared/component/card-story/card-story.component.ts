import { Component, Input } from '@angular/core';
import { ButtonModule } from 'primeng/button';
import { DialogModule } from 'primeng/dialog';
import { AvatarModule } from 'primeng/avatar';
import { NgOptimizedImage } from '@angular/common';
import { StoryService } from '../../services/story/story.service';
import { Story } from '../../models/story';

@Component({
  selector: 'app-card-story',
  standalone: true,
  imports: [DialogModule, ButtonModule, AvatarModule, NgOptimizedImage],
  templateUrl: './card-story.component.html',
  styleUrl: './card-story.component.scss',
})
export class CardStoryComponent {
  @Input() story!: Story;

  isFavorited: boolean = false;

  visible: boolean = false;
  position: string = 'center';
  colorHeart: string = 'red';

  constructor(private storyServive: StoryService) {}

  showDialog() {
    this.visible = true;
    this.position = this.position;
  }

  toggleFavorite() {
    this.isFavorited = !this.isFavorited;
  }
}
