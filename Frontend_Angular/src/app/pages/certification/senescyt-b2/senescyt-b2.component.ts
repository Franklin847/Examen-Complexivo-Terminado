import { Component, OnInit } from '@angular/core';
import { CecyService } from '../../../services/cecy/cecy.service';
import { DataComponentService } from '../../../services/cecy/data-component.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-senescyt-b2',
  templateUrl: './senescyt-b2.component.html',
  styleUrls: ['./senescyt-b2.component.css']
})
export class SenescytB2Component implements OnInit {


  //Variables para el tipo input checkbox
  administration = false;
  technical = false;
  presencial = false;
  virtual = false;
  days_normal = false;
  day_saturday = false;
  days_complete = false;
  day_sunday = false;

  //Guardamos la informacion que se envia entre componentes
  data_info: Array<any> = [];

  //Variable para guardar la informacion del curso
  data_course: Array<any> = [];
  //Variable para guardar la informacion de los participantes
  data_participants: Array<any> = [];
  //variable para guardar los temas del curso
  data_topics: Array<any> = [];

  //Variables para contar el numero de estudiantes (Aprobados, Reprobados, Retirados y Matriculados)
  //General
  participants_enrollment: number = 0;
  participants_retired: number = 0;
  participants_approved: number = 0;
  participants_reprobate: number = 0;

  //Variables para contar el numero de estudiantes (Aprobados, Reprobados, Retirados y Matriculados)
  //Para Hombres
  participants_enrollment_male: number = 0;
  participants_retired_male: number = 0;
  participants_approved_male: number = 0;
  participants_reprobate_male: number = 0;

  //Variables para contar el numero de estudiantes (Aprobados, Reprobados, Retirados y Matriculados)
  //Para Mujeres
  participants_enrollment_female: number = 0;
  participants_retired_female: number = 0;
  participants_approved_female: number = 0;
  participants_reprobate_female: number = 0;


  constructor(
    private service: CecyService,
    private get_component_data: DataComponentService,
    public route: Router
  ) { }


  //definimos el grid de la tabla (Aprobados, Reprobados, Retirados y Matriculados)
  cols = [
    { field: 'PARTICIPANTES', header: 'PARTICIPANTES' },
    { field: 'HOMBRES', header: 'HOMBRES' },
    { field: 'MUJERES', header: 'MUJERES' },
    { field: 'TOTAL', header: 'TOTAL ' },
    { field: 'OBSERVACIONES', header: 'OBSERVACIONES' }
  ];


  //Traemos toda la informacion del curso en 3 consulas:
  //detalles del curso
  //participantes del curso
  //temas del curso
  ngOnInit(): void {
    //Traemos la informacion que pasa entre los componentes
    this.data_info = this.get_component_data.getOptionsCourse()
    //Id_curso de la informacion entre componentes
    var id_curso = this.data_info[0]['course_id'];
    console.log('Este es el id del curso: ' + id_curso);
    //detalles del curso
    this.service.get('senescytB2_course/' + id_curso).subscribe(resp => {
      console.log(resp)
      //Tecnico o Administrativo
      resp['data']['course_detail'][0]['tipe_course'] == "Técnico" ? this.technical = true : this.administration = true;
      //Presencial, virtual o semipresencial
      resp['data']['course_detail'][0]['modality'] == "PRESENCIAL" ? this.presencial = true : this.virtual = true;
      //Dias que se dicta el curso
      resp['data']['course_detail'][0]['days_course'] == "Lunes" ? this.days_normal = true : this.days_complete = true;
      //Datos del curso
      this.data_course = resp['data']['course_detail'];
      //Temas que se ipartieron en el curso
      this.data_topics = resp['data']['course_topic'];
      //Participantes del curso
      this.data_participants = resp['data']['course_participant'];
      //Recorremos los participantes para verificar el estado de la matricula
      this.data_participants.forEach(element => {
        //Si esta retirado o desertado (retirado)
        if (element['state_enrollment'] == "Retirado" || element['state_enrollment'] == "Desertado") {
          this.participants_retired++;
          //Si el seco es 23 (Masculino) suma en retirados masculinos caso contrario en femenino
          element['id_sex'] == 23 ? this.participants_retired_male++ : this.participants_retired_female++;
        }
        //Si esta matriculado 
        if (element['state_enrollment'] == "Matriculado") {
          //Si la nota final es mayor o igual a 70
          if (element['final_grade'] >= 70) {
            //Suma en participantes aprobados
            this.participants_approved++
            //Si el seco es 23 (Masculino) suma en aprobados masculinos caso contrario en femenino
            element['id_sex'] == 23 ? this.participants_approved_male++ : this.participants_approved_female++;
          } else {
            //Suma en participantes reporbados
            this.participants_reprobate++;
            //Si el seco es 23 (Masculino) suma en reprobados masculinos caso contrario en femenino
            element['id_sex'] == 23 ? this.participants_reprobate_male++ : this.participants_reprobate_female++;
          }
        }
        //Suma en participantes matriculados
        this.participants_enrollment++;
        //Si el seco es 23 (Masculino) suma en matriculados masculinos caso contrario en femenino
        element['id_sex'] == 23 ? this.participants_enrollment_male++ : this.participants_enrollment_female++;
      });
    }, (error) => {
      //Imprimios el error
      console.log(error)
    })


  }

  generateC1() {
    this.route.navigateByUrl('senescyt-C1')
  }

}
