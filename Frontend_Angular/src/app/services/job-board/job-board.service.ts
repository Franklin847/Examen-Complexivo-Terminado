import {Injectable} from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '../../../environments/environment';
import {Router} from '@angular/router';

@Injectable({
    providedIn: 'root'
})

export class JobBoardService {
    private headers: HttpHeaders;

    constructor(private _http: HttpClient, private router: Router) {

    }

    get(url: string) {
        this.headers = new HttpHeaders()
            .set('X-Requested-With', 'XMLHttpRequest')
            .append('Content-Type', 'application/json')
            .append('Accept', 'application/json');
        // .append('Authorization', 'Bearer ' + localStorage.getItem('accessToken').replace('"', ''));
        url = environment.API_URL_JOB_BOARD + url;
        return this._http.get(url, {headers: this.headers});
    }

    post(url: string, data: any) {
        this.headers = new HttpHeaders()
            .set('X-Requested-With', 'XMLHttpRequest')
            .append('Content-Type', 'application/json')
            .append('Accept', 'application/json');
        // .append('Authorization', 'Bearer ' + localStorage.getItem('accessToken').replace('"', ''));
        url = environment.API_URL_IGNUG + url;
        return this._http.post(url, data, {headers: this.headers});
    }

    update(url: string, data: any) {
        this.headers = new HttpHeaders()
            .set('X-Requested-With', 'XMLHttpRequest')
            .append('Content-Type', 'application/json')
            .append('Accept', 'application/json');
        // .append('Authorization', 'Bearer ' + localStorage.getItem('accessToken').replace('"', ''));
        url = environment.API_URL_IGNUG + url;
        return this._http.put(url, data, {headers: this.headers});
    }

    delete(url: string) {
        this.headers = new HttpHeaders()
            .set('X-Requested-With', 'XMLHttpRequest')
            .append('Content-Type', 'application/json')
            .append('Accept', 'application/json');
        // .append('Authorization', 'Bearer ' + localStorage.getItem('accessToken').replace('"', ''));
        url = environment.API_URL_IGNUG + url;
        return this._http.delete(url, {headers: this.headers});
    }

    upload(url: string, data: any) {
        url = environment.API_URL_IGNUG + url;
        this.headers = new HttpHeaders(); // .set('Authorization', 'Bearer ' + localStorage.getItem('accessToken').replace('"', ''));
        return this._http.post(url, data, {headers: this.headers});
    }

    validarCorreoElectronico(correoElectronico: string): boolean {
        const expreg = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
        if (expreg.test(correoElectronico.toLowerCase())) {
            return true;
        } else {
            return false;
        }
    }


    validarSoloNumeros(cadena: string): boolean {
        const expreg = /^[0-9]*$/;
        return expreg.test(cadena);
    }

    validarSoloLetrasConEspacio(cadena: string): boolean {
        const expreg = /^[A-Z_ ]+([A-Z]+)*$/;
        return expreg.test(cadena.toUpperCase());
    }

    applyPostulant(data: any, id: string) {
        const url = environment.API_URL_JOB_BOARD + 'postulants/apply';
        this.headers = new HttpHeaders().set('Api-Token', id);
        return this._http.post(url, JSON.stringify(data), {headers: this.headers});
    }

    validateAppliedOffer(userId: number, offerId: number,) {
        this.headers = new HttpHeaders()
            .set('X-Requested-With', 'XMLHttpRequest')
            .append('Content-Type', 'application/json')
            .append('Accept', 'application/json');

        const url = environment.API_URL_JOB_BOARD + 'offers/opportunities/validateAppliedOffer?user_id=' + userId + '&offer_id=' + offerId;
        return this._http.get(url, {headers: this.headers});
    }
}
