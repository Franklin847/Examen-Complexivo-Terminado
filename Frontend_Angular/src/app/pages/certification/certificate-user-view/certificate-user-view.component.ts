import { Component, OnInit } from '@angular/core';
import { CecyService } from '../../../services/cecy/cecy.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-certificate-user-view',
  templateUrl: './certificate-user-view.component.html',
  styleUrls: ['./certificate-user-view.component.css']
})
export class CertificateUserViewComponent implements OnInit {

  constructor(
    private service: CecyService,
    public route: ActivatedRoute
  ) { }

  cols: any[];
  id_user: any = this.route.snapshot.paramMap.get('id');
  data_courses_participant: Array<any> = [];
  data_courses_instructor: Array<any> = [];
  data_courses_instructor_setec: Array<any> = [];

  ngOnInit(): void {

    //Imprimir la variable de la url
    console.log(this.route.snapshot.paramMap.get('id'));

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
