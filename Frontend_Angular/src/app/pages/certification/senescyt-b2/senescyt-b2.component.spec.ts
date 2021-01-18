import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SenescytB2Component } from './senescyt-b2.component';

describe('SenescytB2Component', () => {
  let component: SenescytB2Component;
  let fixture: ComponentFixture<SenescytB2Component>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SenescytB2Component ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SenescytB2Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
