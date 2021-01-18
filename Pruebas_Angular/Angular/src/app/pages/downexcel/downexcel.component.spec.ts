import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DownexcelComponent } from './downexcel.component';

describe('DownexcelComponent', () => {
  let component: DownexcelComponent;
  let fixture: ComponentFixture<DownexcelComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DownexcelComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DownexcelComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
