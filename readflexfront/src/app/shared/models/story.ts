import { Categorie } from './categorie';

export interface Story {
  id: Number;
  storyName: string;
  storyImage: string;
  categorie: Partial<Categorie>;
  storyDescription: string;
  storyContent?: string;
}
