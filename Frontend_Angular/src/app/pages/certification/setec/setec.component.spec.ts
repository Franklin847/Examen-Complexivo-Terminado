import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SETECComponent } from './setec.component';

describe('SETECComponent', () => {
  let component: SETECComponent;
  let fixture: ComponentFixture<SETECComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SETECComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SETECComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
