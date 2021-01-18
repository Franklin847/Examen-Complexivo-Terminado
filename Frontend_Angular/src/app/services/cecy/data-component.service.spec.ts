import { TestBed } from '@angular/core/testing';

import { DataComponentService } from './data-component.service';

describe('DataComponentService', () => {
  let service: DataComponentService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(DataComponentService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
