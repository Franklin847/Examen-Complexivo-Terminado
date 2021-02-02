import { Component, OnInit } from '@angular/core';
import { CecyService } from '../../../services/cecy/cecy.service';
import { DataComponentService } from '../../../services/cecy/data-component.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-info',
  templateUrl: './info.component.html',
  styleUrls: ['./info.component.css']
})
export class InfoComponent implements OnInit {

  constructor(
    public service: CecyService,
    public send_data_component: DataComponentService,
    public route: Router
  ) { }

  //Tipo certificado (SENESCYT, CECY, SETEC)
  typeCertifications: Array<any> = [];
  typeCertificationsNgModel: any;

  //Nombre de la carrera o instituto dependiendo si es SENESCYT o SETEC
  career: Array<any> = [];
  careerInstituteNgModel: any;

  //Nombre de la capacitacion si es (Curso, Taller o Webinar)
  capacitation: Array<any> = [];
  capacitationNgModel: any;

  //Nombre del curso
  course: Array<any> = [];
  courseNgModel: any;

  //Fecha que finalizó el curso
  courseEndDate: Array<any> = [];
  courseEndDateNgModel: any;

  //Paralelo del curso
  parallel: Array<any> = [];
  parallelNgModel: any;

  //Modalidad del curso (Matutina, vespertina o nocturna)
  conference: Array<any> = [];
  conferenceNgModel: any;

  //Variable si se certifica a participantes o instructor
  certidicationParticipantInstructor: Array<any> = [
    {
      'id': 0, 'name': "Seleccione si la certificacion es para Instructores o participantes" 
    },
    {
      'id': 1, 'name': "Instructores (Proceso CECY)" 
    },
    {
      'id': 2, 'name': "Participantes" 
    }
  ];
  certidicationParticipantInstructorNgModel: any;

  //Toda la informacion del curso necesaria que se envia al siguiente componente 
  course_all: Array<any> = [];

  //Variable para identificar si es carrera (SENESCYT O CECY) o instituto SETEC
  isCarrerOrInstitute: string;


  //Obtiene las entidades que certifican (SENESCYT, CECY O SETEC)
  ngOnInit(): void {
    localStorage.clear();
    this.service.get('entity_certification').subscribe(resp => {
      console.log(resp)
      var entities = resp['data']['attributes'];
      entities.unshift({ 'id': 0, 'name': "Seleccione la entidad que certifica" })
      this.typeCertifications = entities;
    }, (error) => {
      console.log(error);
    })
  }


  //Obtiene las carreras o institutos dependiendo de la seleccion anterior
  get_careers(event) {
    //Verificamos si la seleccion anterior es SETEC ya que se utilizan otras consultas
    if (this.typeCertificationsNgModel.name != 'SETEC') {
      this.service.get('career/' + event.value.id).subscribe(resp => {
        var careers = resp['data']['attributes'];
        careers.unshift({ 'id': 0, 'name': "Seleccione la carrera" })
        this.career = careers;
        this.isCarrerOrInstitute = 'Carrera'
      }, (error) => {
        console.log(error);
      })
    } else {
      console.log('esto es setec');
      this.service.get('setec_institute/' + event.value.id).subscribe(resp => {
        var careers = resp['data']['attributes'];
        careers.unshift({ 'id': 0, 'name': "Seleccione el instituto" })
        this.career = careers;
        this.isCarrerOrInstitute = 'Instituto'
      }, (error) => {
        console.log(error);
      })
    }
  }


  //Obtenemos el tipo de capacitacion (Curso, Taller o Webinar)
  get_capacitation(event) {
    if (this.typeCertificationsNgModel.name != 'SETEC') {
      this.service.get('capacitation/' + this.typeCertificationsNgModel.id + '/' + event.value.id).subscribe(resp => {
        var capacitations = resp['data']['attributes'];
        capacitations.unshift({ 'id': 0, 'name': "Seleccione el tipo de capacitación" })
        this.capacitation = capacitations;
      }, (error) => {
        console.log(error);
      })
    } else {
      console.log('esto es setec');
      this.service.get('setec_capacitation/' + this.typeCertificationsNgModel.id + '/' + event.value.id).subscribe(resp => {
        var capacitations = resp['data']['attributes'];
        capacitations.unshift({ 'id': 0, 'name': "Seleccione el tipo de capacitación" })
        this.capacitation = capacitations;
      }, (error) => {
        console.log(error);
      })
    }
  }


  //Obtenemos el nombre del curso
  get_course(event) {
    if (this.typeCertificationsNgModel.name != 'SETEC') {
      this.service.get('course/' + this.typeCertificationsNgModel.id + '/' + this.careerInstituteNgModel.id + '/' + event.value.id).subscribe(resp => {
        var courses = resp['data']['attributes'];
        courses.unshift({ 'id': 0, 'name': "Seleccione el nombre del " + event.value.name })
        this.course = courses;
      }, (error) => {
        console.log(error);
      })
    } else {
      console.log('esto es setec');
      this.service.get('setec_course/' + this.typeCertificationsNgModel.id + '/' + this.careerInstituteNgModel.id + '/' + event.value.id).subscribe(resp => {
        var courses = resp['data']['attributes'];
        courses.unshift({ 'id': 0, 'name': "Seleccione el nombre del " + event.value.name })
        this.course = courses;
      }, (error) => {
        console.log(error);
      })
    }
  }


  //Obtenemos la fecha que finalizó  el curso con metodo post ya que se envia informacion confidencial. 
  post_course_end(event) {
    var data_send = {
      'course': event.value.name,
      'entity': this.typeCertificationsNgModel.id,
      'careerInstitute': this.careerInstituteNgModel.id,
      'capacitation': this.capacitationNgModel.id
    }
    if (this.typeCertificationsNgModel.name != 'SETEC') {
      this.service.post('course_end', data_send).subscribe(resp => {
        var courses_end_date = resp['data']['attributes'];
        courses_end_date.unshift({ 'id': 0, 'name': "Seleccione la fecha que finalizó el curso", 'date_end': "Seleccione la fecha que finalizó el curso" })
        this.courseEndDate = courses_end_date;
      }, (error) => {
        console.log(error);
      })
    } else {
      console.log('esto es setec');
      this.service.post('setec_course_end', data_send).subscribe(resp => {
        var courses_end_date = resp['data']['attributes'];
        courses_end_date.unshift({ 'id': 0, 'name': "Seleccione la fecha que finalizó el curso", 'date_end': "Seleccione la fecha que finalizó el curso" })
        this.courseEndDate = courses_end_date;
      }, (error) => {
        console.log(error);
      })
    }
  }


  //Obtenemos el paralelo del curso con metodo post ya que se envia informacion confidencial. 
  post_course_parallel(event) {
    var data_send = {
      'course': this.courseNgModel.name,
      'entity': this.typeCertificationsNgModel.id,
      'careerInstitute': this.careerInstituteNgModel.id,
      'capacitation': this.capacitationNgModel.id,
      'end_course': event.value.date_end
    }
    if (this.typeCertificationsNgModel.name != 'SETEC') {
      this.service.post('course_parallel', data_send).subscribe(resp => {
        var courses_parallel = resp['data']['attributes'];
        courses_parallel.unshift({ 'id': 0, 'name': "Seleccione el paralelo" })
        this.parallel = courses_parallel;
      }, (error) => {
        console.log(error);
      })
    } else {
      console.log('esto es setec');
      this.service.post('setec_course_parallel', data_send).subscribe(resp => {
        var courses_parallel = resp['data']['attributes'];
        courses_parallel.unshift({ 'id': 0, 'name': "Seleccione el paralelo" })
        this.parallel = courses_parallel;
      }, (error) => {
        console.log(error);
      })
    }
  }



  //Obtenemos la modalidad del curso con metodo post ya que se envia informacion confidencial. 
  post_course_conference(event) {
    var data_send = {
      'course': this.courseNgModel.name,
      'entity': this.typeCertificationsNgModel.id,
      'careerInstitute': this.careerInstituteNgModel.id,
      'capacitation': this.capacitationNgModel.id,
      'end_course': this.courseEndDateNgModel.date_end,
      'parallel': event.value.id
    }
    if (this.typeCertificationsNgModel.name != 'SETEC') {
      this.service.post('course_conference', data_send).subscribe(resp => {
        var courses_conference = resp['data']['attributes'];
        courses_conference.unshift({ 'id': 0, 'name': "Seleccione la modalidad" })
        this.conference = courses_conference;
      }, (error) => {
        console.log(error);
      })
    } else {
      console.log('esto es setec');
      this.service.post('setec_course_conference', data_send).subscribe(resp => {
        var courses_conference = resp['data']['attributes'];
        courses_conference.unshift({ 'id': 0, 'name': "Seleccione el modalidad" })
        this.conference = courses_conference;
      }, (error) => {
        console.log(error);
      })
    }
  }

  //Obtenemos toda la informacion del curso para pasarlo al siguiente componente 
  //con metodo post ya que se envia informacion confidencial. 
  post_course_all(event) {
    var data_send = {
      'course': this.courseNgModel.name,
      'entity': this.typeCertificationsNgModel.id,
      'careerInstitute': this.careerInstituteNgModel.id,
      'capacitation': this.capacitationNgModel.id,
      'end_course': this.courseEndDateNgModel.date_end,
      'parallel': this.parallelNgModel.id,
      'conference': event.value.id
    }
    if (this.typeCertificationsNgModel.name != 'SETEC') {
      this.service.post('course_all', data_send).subscribe(resp => {
        var courses_all = resp['data']['attributes'];
        this.course_all = courses_all;
        console.log(this.course_all)
      }, (error) => {
        console.log(error);
      })
    } else {
      console.log('esto es setec');
      this.service.post('setec_course_all', data_send).subscribe(resp => {
        var courses_all = resp['data']['attributes'];
        this.course_all = courses_all;
        console.log(this.course_all)
      }, (error) => {
        console.log(error);
      })
    }
  }


  //Enviamos la informacion del curso al siguiente componente para evitar redundancia de datos
  send_service_data() {
    localStorage.clear();
    var data_send_service = {
      'course': this.courseNgModel.name,
      'entity': this.typeCertificationsNgModel.id,
      'careerInstitute': this.careerInstituteNgModel.id,
      'capacitation': this.capacitationNgModel.id,
      'end_course': this.courseEndDateNgModel.date_end,
      'parallel': this.parallelNgModel.id,
      'conference': this.conferenceNgModel.id,
      'course_id': this.course_all[0]['id']
    }
    this.send_data_component.addOptionsCourse(data_send_service);
    this.send_data_component.getOptionsCourse();
    console.log(data_send_service);
    console.log(this.send_data_component.getOptionsCourse());
    localStorage.setItem('id_course', this.course_all[0]['id']);
    //Nos da si el curso es senescyt o cecy para instructores
    localStorage.setItem('type_course_cecy', this.typeCertificationsNgModel.name);


    //Verificamos el tipo de entidad que certifica para redireccionar al siguiente componente

    //this.certidicationParticipantInstructorNgModel.id == 0   => ninguna de las anteriores, redirige a Setec o senescyt
    //this.certidicationParticipantInstructorNgModel.id == 2   => participantes, redirige a Setec o senescyt
    //this.certidicationParticipantInstructorNgModel.id == 1   => Intructores (proceso CECY), redirige a certificacion de instructores (CECY)
    if (this.typeCertificationsNgModel.name == 'SETEC' && this.certidicationParticipantInstructorNgModel.id != 1) {
      this.route.navigate(['/setec']);
    } else if (this.typeCertificationsNgModel.name == 'SENESCYT' && this.certidicationParticipantInstructorNgModel.id != 1) {
      this.route.navigate(['/senescyt-B2']);
    } else if (this.certidicationParticipantInstructorNgModel.id == 1) {
      this.route.navigate(['/cecy']);
    }
    
  }

}
