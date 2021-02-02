import { Component, OnInit } from '@angular/core';
import { MessageService } from 'primeng/api';
import { Message } from 'primeng/api';
import * as XLSX from 'xlsx';
import { CecyService } from '../../../services/cecy/cecy.service';
import { DataComponentService } from '../../../services/cecy/data-component.service';


@Component({
  selector: 'app-senescyt-c1',
  templateUrl: './senescyt-c1.component.html',
  styleUrls: ['./senescyt-c1.component.css'],
  providers: [MessageService]
})
export class SenescytC1Component implements OnInit {

  //Creador de mensajes (Alertas)
  msgs: Message[];
  //Variable detalles del curso
  detail_course: Array<any> = [];
  //Variable participantes aprobados y reprobados del curso
  reproved_approved_course: Array<any> = [];
  //Variable detalles participantes del curso aprobados
  participants_course: Array<any> = [];
  //Variable entes que firman el certificados (rector y posiblemnete coordinador)
  authorities_firm: Array<any> = [];
  //Variable participantes aprobados
  participants_approved: number = 0;
  //Variable participantes reprobados
  participants_repproved: number = 0;
  //Participantes totales aprobados y reprobados
  participants_total: number = 0;

  //Variables indispensables para generar el Excel
  storeData: any;
  fileUploaded: File;
  worksheet: any;

  //Estado del codigo al subir el archivo Excel
  status_code: any = false;

  //Guardamos las variables del formlario anterior
  data_info: Array<any> = [];

  constructor(
    private service_message: MessageService,
    private service: CecyService,
    private get_component_data: DataComponentService,
  ) {

  }

  //Traemos toda la informacion del curso en 3 consulas:
  //detalles del curso
  //participantes del curso
  //persoans para firmas del certificados
  ngOnInit(): void {
    //Ocultamosel modla que se muestra mientras carga e componente
    this.hideModal()
    console.log('dentro de setec');
    //Obtenemos la informacion que pasa entre componentes
    this.data_info = this.get_component_data.getOptionsCourse()
    //Guardamos el id del curso para optimizar las consultas 
    var id_curso =  localStorage.getItem('id_course');
    console.log('Este es el id del curso: ' + id_curso);
    //Obtenemos la informacion, participantes y firmas del curso
    this.service.get('senescytC1_course/' + id_curso).subscribe(resp => {
      console.log('data: ')
      console.log(resp);
      //Autoridades que firman
      this.authorities_firm = resp['data']['authorities_firm']
      //Detalles del curso
      this.detail_course = resp['data']['course_detail'];
      //Recorreos los participantes aprobados y reproados
      resp['data']['course_aproved_reproved'].forEach(element => {
        //Contamos los aprobados con mayor o igual a 70
        element['final_grade'] >= 70 ? this.participants_approved++ : this.participants_repproved++;
        //contamos todos los participantes
        this.participants_total++;
      });
      //Traemos los participantes solamente aprobados
      this.participants_course = resp['data']['course_participant'];
    }, (error) => {
      //Imprimimos el error
      console.log(error);
    })
  }

  //Funcion para ocultar el modal
  hideModal() {
    document.getElementById('process-modal-fade').style.display = 'none'
  }

  //Funcion para mostrar el modal
  slowModal() {
    document.getElementById('process-modal-fade').style.display = 'block';
  }

  //Funcion que carga el Excel 
  public onSelectImage(evt: any) {
    //Guardamos el archivo en la variable fileUploaded para utilizarlo despues
    this.fileUploaded = evt[0];
    console.log(this.fileUploaded)
    //Llamamos a la funcion para leer el Excel
    this.readExcel();
  }

  //Cuando se cancela el archivo y se vuelve a seleccionar toda la informacion del aterior Excel se elimina
  public onRemoveImage() {
    this.participants_course.map(function (dato) {
      //Cambiamos el estado del codigo de los participantes
      dato.code_certificate = 'null';
    })
  }



  readExcel() {
    //Borrar toda la informacion del aterior Excel se elimina
    this.onRemoveImage()
    //Funcion para leer el excel con los codigos
    let readFile = new FileReader();
    readFile.onload = (e) => {
      this.storeData = readFile.result;
      var data = new Uint8Array(this.storeData);
      var arr = new Array();
      for (var i = 0; i != data.length; ++i) {
        arr[i] = String.fromCharCode(data[i]);
      }
      var bstr = arr.join("");
      var workbook = XLSX.read(bstr, { type: "binary" });
      var first_sheet_name = workbook.SheetNames[0];
      this.worksheet = workbook.Sheets[first_sheet_name];
      var data_excel = XLSX.utils.sheet_to_json(this.worksheet, { raw: true });

      //Recorremos los participantes
      this.participants_course.map(function (dato) {
        console.log(dato['identification']);
        //Recorremos los datos del Excel
        data_excel.forEach(element => {
          console.log(element);
          //Verificamos que el campo del codigo del Excel este lleno
          if (element['__EMPTY_1'] != undefined) {
            console.log(element['__EMPTY_1']);
            //Tras leer el Excel verificamos que la cedula de los participantes sea igual a la del excel
            if (element['__EMPTY_1'] == dato['identification']) {
              console.log('coincidencia: ' + element['__EMPTY_1'] + '==' + dato['identification'])
              //Asignamos al participante el codigo del Excel
              dato.code_certificate = element['__EMPTY_7'];
            }
          }
        });
      })
      //console.log(this.worksheet['A1']) 
      console.log(this.participants_course);

      //Verificamos que todos los participantes tengas su codigo caso contrario se muestra un error
      this.participants_course.forEach(element => {
        console.log(element['code_certificate']);
        element['code_certificate'] !== 'null' ? this.cargarArchivo() : this.errorExcel();
      });
    }
    readFile.readAsArrayBuffer(this.fileUploaded);
  }


  //funcion para exportar a excel todo el contenido a traves del id
  exportexcel(): void {
    //Generamos la fecha que utilizaremos el en nombre del Excel que se desarga
    var f = new Date();
    var fileName = f.getDate() + "-" + (f.getMonth() + 1) + "-" + f.getFullYear() + " " + f.getHours() + '.' + f.getMinutes() + '.' + f.getSeconds() + this.detail_course[0]['name_course'] + '.xlsx';
    /* table id is passed over here */
    //Leemos los datos del elemento con id excel-table
    let element = document.getElementById('excel-table');
    const ws: XLSX.WorkSheet = XLSX.utils.table_to_sheet(element);

    /* generate workbook and add the worksheet */
    //Genermos una pestaña del excel con el nombre Sheet1
    const wb: XLSX.WorkBook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');

    /* save to file */
    XLSX.writeFile(wb, fileName);
    this.descargarFormulario()

  }



  //funcion para generar los cetificados y almacenarlo en el sistema
  generarCertificados() {
    //Mostramos el modal mientras se generan los certificados
    this.slowModal();
    // Data necesaria para mostrar en el certificado
    var data_generate_certificate = {
      'course_name': this.detail_course[0]['name_course'],
      'site_course': this.detail_course[0]['site_course'],
      'date_start': this.detail_course[0]['date_start'],
      'date_end': this.detail_course[0]['date_end'],
      'duration': this.detail_course[0]['duration'],
      'name_main_firm': this.authorities_firm[0]['main_first_name'] + ' ' + this.authorities_firm[0]['main_second_name'] + ' ' + this.authorities_firm[0]['main_first_lastname'] + ' ' + this.authorities_firm[0]['main_second_lastname'],
      'main_position': this.authorities_firm[0]['main_position'],
      'name_second_firm': this.authorities_firm[0]['second_first_name'] + ' ' + this.authorities_firm[0]['second_second_name'] + ' ' + this.authorities_firm[0]['second_first_lastname'] + ' ' + this.authorities_firm[0]['second_second_lastname'],
      'second_position': this.authorities_firm[0]['second_position'],
      'participants': this.participants_course,
      'code_course': this.detail_course[0]['code_course']
    }

    //Enviamos la data para generar en el certificado
    this.service.post('savePdfCertificado', data_generate_certificate).subscribe(resp => {
      console.log(resp)
      //Mostramos un mensaje de ecito si se ejecutaron correctamnete
      this.service_message.add({ key: 'tst', severity: 'success', summary: 'Certificados Creados', detail: 'Los certificados se han creado y almacenado correctamente' });
      this.ngOnInit();
    }, (error) => {
      //Imprimimos el error
      console.log(error);
    })

  }

  //funcion para mostrar un alerta de exito cuando se carga el archivo
  cargarArchivo() {
    this.service_message.add({ key: 'tst', severity: 'success', summary: 'Archivo Cargado', detail: 'El archivo se ha cargado exitosamente' });
    this.status_code = true;
  }
  //funcion para mostrar un alerta de informacion del formulario descargado
  descargarFormulario() {
    this.service_message.add({ key: 'tst', severity: 'info', summary: 'Formulario Descargado', detail: 'El formulario se ha descargado exitosamente' });
  }
  //funcion para mostrar un alerta de error si el excel no es el correcto
  errorExcel() {
    this.service_message.add({ key: 'tst', severity: 'error', summary: 'Error en el archivo', detail: 'Verifique que el archivo emitido por Senescyt contenga todos los códigos.' });
  }
}
