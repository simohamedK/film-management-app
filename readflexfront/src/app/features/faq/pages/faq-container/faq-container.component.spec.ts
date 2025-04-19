import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FaqContainerComponent } from './faq-container.component';

describe('FaqContainerComponent', () => {
  let component: FaqContainerComponent;
  let fixture: ComponentFixture<FaqContainerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [FaqContainerComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(FaqContainerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
