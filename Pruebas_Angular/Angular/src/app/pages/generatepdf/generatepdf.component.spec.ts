import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GeneratepdfComponent } from './generatepdf.component';

describe('GeneratepdfComponent', () => {
  let component: GeneratepdfComponent;
  let fixture: ComponentFixture<GeneratepdfComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GeneratepdfComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(GeneratepdfComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
