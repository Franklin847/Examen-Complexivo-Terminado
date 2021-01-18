import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CECYComponent } from './cecy.component';

describe('CECYComponent', () => {
  let component: CECYComponent;
  let fixture: ComponentFixture<CECYComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CECYComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CECYComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
