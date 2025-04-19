
export interface User {
  id: number;           // Correspond à l'id dans l'entité
  username: string;     // Correspond au username
  email: string;        // Correspond à l'email
  password?: string;    // Optionnel, si tu veux gérer des opérations de mise à jour
  admin: boolean;     // Correspond à isAdmin dans l'entité
 }
