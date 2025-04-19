import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { CarouselModule } from 'primeng/carousel';
import { HeroService } from '../../services/heroservives/heroService';
import { HeroInfo } from '../../models/heroInfo';
import { NgOptimizedImage } from '@angular/common';

@Component({
  selector: 'app-hero-banner',
  standalone: true,
  imports: [CarouselModule, NgOptimizedImage],
  templateUrl: './hero-banner.component.html',
  styleUrl: './hero-banner.component.scss',
  encapsulation: ViewEncapsulation.None,
})
export class HeroBannerComponent implements OnInit {
  responsiveOptions: any[] | undefined;
  heroCards!: HeroInfo[];
  constructor(private heroService: HeroService) {}

  ngOnInit(): void {
    this.heroCards = this.heroService.getHeroBannerInfo();
    //console.log(this.heroCards);
  }
}
