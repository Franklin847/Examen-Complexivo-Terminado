import { TestBed } from '@angular/core/testing';

import { CecyService } from './cecy.service';

describe('CecyService', () => {
  let service: CecyService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CecyService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
