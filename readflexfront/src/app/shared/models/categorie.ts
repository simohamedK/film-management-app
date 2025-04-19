import { Story } from './story';

export interface Categorie
{
    id: number;
    name: string;
    storys: Partial<Story[]>;
}
