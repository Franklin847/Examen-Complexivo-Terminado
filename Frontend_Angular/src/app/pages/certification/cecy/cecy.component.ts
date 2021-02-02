import { Component, OnInit } from '@angular/core';
import { MessageService } from 'primeng/api';
import { CecyService } from '../../../services/cecy/cecy.service';
import { DataComponentService } from '../../../services/cecy/data-component.service';

@Component({
  selector: 'app-cecy',
  templateUrl: './cecy.component.html',
  styleUrls: ['./cecy.component.css'],
  providers: [MessageService]
})
export class CECYComponent implements OnInit {

  constructor(
    private service_message: MessageService,
    private service: CecyService,
    private get_component_data: DataComponentService,
  ) { }

  //Variable para almacenar el codigo automaticamnete para el instructor
  code_register: String = "";

  //variable para obtenemos la informacion del curso incluyendo el intructor
  all_course: Array<any> = [];
  //variable para la infromacion de las personas que firman el diploma (rector y posiblemente coordinador)
  authorities_firm: Array<any> = []
  //variable para la informacion de la data que pasa entre componentes
  data_info: Array<any> = [];

  ngOnInit(): void {
    //Ocultamos el modal que se muestra al cargar el componente
    this.hideModal()
    //Guardamos la infroamcion que pasa entre los componetes
    this.data_info = this.get_component_data.getOptionsCourse()
    //Guardamos el id del curso 
    var id_curso = localStorage.getItem('id_course');
    //Traemos del localstorage el tipo de curso para realizar la consulta correspondiente para instructores (Senescyt o setec)
    var type_course_cecy = localStorage.getItem('type_course_cecy');
    //traemos la informacion del curso junto con el intstructoe y la infromacion de las personas que firman
    
    if(type_course_cecy == 'SENESCYT'){
      this.service.get('cecy/' + id_curso).subscribe(resp => {
        console.log(resp);
        //Guardamos la infromacion del curso
        this.all_course = resp['data']['course_detail'];
        //Guardamos la informacion de las autoridades 
        this.authorities_firm = resp['data']['authorities_firm'];
        //Funcion para generar el codigo
        this.GenerateCod();
      }, (error) => {
        //Imprimimos el error
        console.log(error);
      })
    }else if(type_course_cecy == 'SETEC'){
      this.service.get('cecy_setec/' + id_curso).subscribe(resp => {
        console.log(resp);
        //Guardamos la infromacion del curso
        this.all_course = resp['data']['course_detail'];
        //Guardamos la informacion de las autoridades 
        this.authorities_firm = resp['data']['authorities_firm'];
        //Funcion para generar el codigo
        this.GenerateCod();
      }, (error) => {
        //Imprimimos el error
        console.log(error);
      })
    }
  }

  //Genermaos el codgo a partir de la irnfoamcion del curso
  GenerateCod() {
    var cont_register = 0
    this.all_course.forEach(element => {
      console.log(element);
      cont_register++;
      this.code_register = 'ITSY-' + element['institute_code'] + '-' + element['code_course'] + '-' + element['parallel'] + '-' + element['date_end'] + '-00' + cont_register;
      element['code_certificate'] = this.code_register;
    });
    //this.code_register = 'ITSY-BJ-BDD-III-05OCT2020-001';

  }

  //Funcion para oculatar el modal
  hideModal() {
    document.getElementById('process-modal-fade').style.display = 'none'
  }
  //Funcion para mostrar el modal
  slowModal() {
    document.getElementById('process-modal-fade').style.display = 'block';
  }

  //Funcion para generar los certificados
  generarCertificados() {
    this.slowModal();

    //Data necesaria para enviar aldiploma
    var data_generate_certificate = {
      'course_name': this.all_course[0]['name_course'],
      'date_start': this.all_course[0]['date_start'],
      'date_end': this.all_course[0]['date_end'],
      'name_main_firm': this.authorities_firm[0]['main_first_name'] + ' ' + this.authorities_firm[0]['main_second_name'] + ' ' + this.authorities_firm[0]['main_first_lastname'] + ' ' + this.authorities_firm[0]['main_second_lastname'],
      'main_position': this.authorities_firm[0]['main_position'],
      'name_second_firm': this.authorities_firm[0]['second_first_name'] + ' ' + this.authorities_firm[0]['second_second_name'] + ' ' + this.authorities_firm[0]['second_first_lastname'] + ' ' + this.authorities_firm[0]['second_second_lastname'],
      'second_position': this.authorities_firm[0]['second_position'],
      'participant_name': this.all_course[0]['instructor_name'],
      'participant_secondname': this.all_course[0]['instructor_secondname'],
      'participant_lastname': this.all_course[0]['instructor_lastname'],
      'participant_secondlastname': this.all_course[0]['instructor_secondlastname'],
      'identification': this.all_course[0]['identification'],
      'code_certification': this.code_register,
      'id_planification_instructor': this.all_course[0]['id_planification_instructor'],
      'code_course': this.all_course[0]['code_course']
    }
    //Traemos la informacion y mandamos a generar el diploma
    this.service.post('savePdfDiploma', data_generate_certificate).subscribe(resp => {
      console.log(resp)
      this.service_message.add({ key: 'tst', severity: 'success', summary: 'Certificados Creados', detail: 'Los certificados se han creado y almacenado correctamente' });
      //Refrescamos para vizualizar los cambios establecidos en la base de datos
      this.ngOnInit();
    }, (error) => {
      //Imprimimos el error
      console.log(error)
      //Ocultamos el modal
      this.slowModal();
    })

  }

}
