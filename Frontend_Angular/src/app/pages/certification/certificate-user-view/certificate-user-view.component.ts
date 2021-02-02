import { Component, OnInit } from '@angular/core';
import { CecyService } from '../../../services/cecy/cecy.service';

@Component({
  selector: 'app-certificate-user-view',
  templateUrl: './certificate-user-view.component.html',
  styleUrls: ['./certificate-user-view.component.css']
})
export class CertificateUserViewComponent implements OnInit {

  constructor(
    private service: CecyService,
  ) { }

  cols: any[];
  id_user: number = 3;
  data_courses_participant: Array<any> = [];
  data_courses_instructor: Array<any> = [];
  data_courses_instructor_setec: Array<any> = [];

  ngOnInit(): void {

    //Cargamos el grid de la tabla
    this.cols = [
      { field: 'Fecha fin del curso', header: 'Fecha fin curso' },
      { field: 'Nombre del curso', header: 'Nombre del curso' },
      { field: 'Certificado', header: 'Certificado' }
    ];

    //traemos los cursos del participante con  la locacion del archivo
    this.service.get('user_certificate_view/'+this.id_user).subscribe(resp=>{
      console.log(resp);
      this.data_courses_participant = resp['data']['course_participant'];
      this.data_courses_instructor = resp['data']['course_instructor'];
      this.data_courses_instructor_setec = resp['data']['course_instructor_setec'];
    },(error)=>{
      console.log(error);
    })
  }

}
