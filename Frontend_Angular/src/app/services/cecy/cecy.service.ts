import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../../environments/environment';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class CecyService {
  private headers: HttpHeaders;

  constructor(private _http: HttpClient) { }

  get(url: string) {
    this.headers = new HttpHeaders()
      .set('X-Requested-With', 'XMLHttpRequest')
      .append('Content-Type', 'application/json')
      .append('Accept', 'application/json');
    // .append('Authorization', 'Bearer ' + localStorage.getItem('accessToken').replace('"', ''));
    url = environment.API_URL_CECY + url;
    return this._http.get(url, { headers: this.headers });
  }

  post(url: string, data: any) {
    this.headers = new HttpHeaders()
      .set('X-Requested-With', 'XMLHttpRequest')
      .append('Content-Type', 'application/json')
      .append('Accept', 'application/json')
    // .append('Authorization', 'Bearer ' + localStorage.getItem('accessToken').replace('"', ''));
    url = environment.API_URL_CECY + url;
    return this._http.post(url, data, { headers: this.headers });
  }

  sendFile(url: string, file: any) {
    const headers = new HttpHeaders();
    headers.append('Content-Type', 'multipart/form-data');
    headers.append('Accept', 'application/json');
    // .append('Authorization', 'Bearer ' + localStorage.getItem('accessToken').replace('"', ''));
    url = environment.API_URL_CECY + url;
    return this._http.post(url, file, {
      headers: headers
    });
  }

}
