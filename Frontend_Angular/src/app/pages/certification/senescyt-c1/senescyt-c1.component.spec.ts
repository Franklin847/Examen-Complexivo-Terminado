import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SenescytC1Component } from './senescyt-c1.component';

describe('SenescytC1Component', () => {
  let component: SenescytC1Component;
  let fixture: ComponentFixture<SenescytC1Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SenescytC1Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SenescytC1Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
