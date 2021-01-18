import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CertificateUserViewComponent } from './certificate-user-view.component';

describe('CertificateUserViewComponent', () => {
  let component: CertificateUserViewComponent;
  let fixture: ComponentFixture<CertificateUserViewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CertificateUserViewComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CertificateUserViewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
