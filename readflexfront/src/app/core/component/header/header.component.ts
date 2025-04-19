import {
  Component,
  ElementRef,
  HostListener,
  OnInit,
  Renderer2,
  ViewChild,
  ViewEncapsulation,
} from '@angular/core';
import {
  ActivationEnd,
  Router,
  RouterLink,
  RouterLinkActive,
} from '@angular/router';

import { NgClass } from '@angular/common';

import { MenuItem, MessageService } from 'primeng/api';
import { MenuModule } from 'primeng/menu';
import { DialogModule } from 'primeng/dialog';

import { NavSmallScreenComponent } from '../nav-small-screen/nav-small-screen.component';
import { AuthService } from '../../../shared/services/auth/auth.service';
@Component({
  selector: 'app-header',
  standalone: true,
  imports: [
    RouterLink,
    RouterLinkActive,
    NgClass,
    MenuModule,
    DialogModule,
    NavSmallScreenComponent,
  ],
  templateUrl: './header.component.html',
  styleUrl: './header.component.scss',
})
export class HeaderComponent implements OnInit {
  isConnected!: boolean;
  title = 'ReadFlex';
  @ViewChild('header') header!: ElementRef<HTMLElement>;

  items!: MenuItem[];

  isNotYetImplemented!: Boolean;

  visibleSidebar!: boolean;
  displayMenu: boolean = false;
  isHeaderBackgrounded!: boolean;
  onLive = true;

  constructor(
    private _renderer: Renderer2,
    private router: Router,
    private authService: AuthService
  ) {
    this.items = [
      {
        label: 'Ambassadeur De Campagne',
        icon: 'pi pi-user-plus',
        routerLink: '/devenir-ambassadeur-de-campagne',
      },
      /*
    { 
      label: 'Faire Un Don', 
      icon: 'pi pi-heart', 
      routerLink: '/dons' 
    }
*/
    ];
  }

  ngOnInit(): void {
    this.onRoutingEvent();
    this.getUserState();
  }

  //On routing event we, if we are on small screen, we toggle the menu to disapear from the screen after we click on a link
  onRoutingEvent(): void {
    this.router.events.subscribe({
      next: (event) => {
        if (event instanceof ActivationEnd) {
          if (event.snapshot.component) {
            this.isHeaderBackgrounded =
              event.snapshot.data['isHeaderBackgrounded'];

            if (this.isHeaderBackgrounded) {
              this._renderer.addClass(
                this.header.nativeElement,
                'navbar-background-on-scroll'
              );
            } else {
              this._renderer.removeClass(
                this.header.nativeElement,
                'navbar-background-on-scroll'
              );
            }
          }
        }
      },
    });
  }

  @HostListener('window:scroll')
  onWindowScroll() {
    if (this.isHeaderBackgrounded) {
      this._renderer.addClass(
        this.header.nativeElement,
        'navbar-background-on-scroll'
      );
    } else {
      if (window.pageYOffset > this.header.nativeElement?.clientHeight) {
        this._renderer.addClass(
          this.header.nativeElement,
          'navbar-background-on-scroll'
        );
      } else {
        this._renderer.removeClass(
          this.header.nativeElement,
          'navbar-background-on-scroll'
        );
      }
    }
  }

  //Handling click on burger menu
  onBurgerMenu() {
    if (this.displayMenu === false) {
      if (window.pageYOffset <= this.header.nativeElement.clientHeight) {
        this._renderer.addClass(
          this.header.nativeElement,
          'navbar-background-on-scroll'
        );
      }
    } else {
      if (!this.isHeaderBackgrounded) {
        if (window.pageYOffset <= this.header.nativeElement.clientHeight) {
          this._renderer.removeClass(
            this.header.nativeElement,
            'navbar-background-on-scroll'
          );
        }
      }
    }

    this.displayMenu = !this.displayMenu;
  }

  menuForSmallScreenHandler(value: boolean) {
    this.displayMenu = value;
  }

  getUserState() {
    this.authService.isUserLogged$.subscribe({
      next: (res: any) => {
        this.isConnected = res;
      },
    });
  }

  onLoginOut() {
    this.authService.isUserLogged$.next(false);
    localStorage.removeItem('isUserLogged');
  }
}
