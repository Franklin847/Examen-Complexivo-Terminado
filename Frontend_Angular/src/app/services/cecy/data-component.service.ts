import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class DataComponentService {

  constructor() { }
  private data_course = [];

  getOptionsCourse() {
    return this.data_course;
  }
 
  addOptionsCourse(data) {
    this.data_course = [];
    this.data_course.push(data);
    return 'success';
  }
}
