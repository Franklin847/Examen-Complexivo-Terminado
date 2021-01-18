import { Component, OnInit } from '@angular/core';
import { MessageService } from 'primeng/api';
import * as XLSX from 'xlsx';
import * as FileSaver from 'file-saver';
import { CecyService } from '../../../services/cecy/cecy.service';
import { from } from 'rxjs';
import { DataComponentService } from '../../../services/cecy/data-component.service';


@Component({
  selector: 'app-setec',
  templateUrl: './setec.component.html',
  styleUrls: ['./setec.component.css'],
  providers: [MessageService]
})
export class SETECComponent implements OnInit {

  constructor(
    private service_message: MessageService,
    public service: CecyService,
    private get_component_data: DataComponentService,
  ) { }

  //Variable para establecer que formulario mostrar si base de datos nacionales o extrangeros
  current_form_national: string = 'active';
  current_form_foreign: string = 'inactive';
  //Estado del formulario (Si ya esta preparado se muestra el boton de descargar)
  status_download_file: string = 'inactive';

  //Detalles del curso
  detail_course: Array<any> = [];
  //Participantes del curso
  participants_course: Array<any> = [];

  //Data participantes nacionales
  national_base: Array<any> = [];
  //Data participantes extrangeros
  foreign_base: Array<any> = [];
  //Variable para almacenar el archvio excel
  fileUploaded: File;
  //Variable para los PDF en caso de que seleccione mas de uno, se almacenan
  array_files: Array<any> = [];
  //Validamos el numero de pdfs sea igual a la de participantes
  validate_pdf_participants: any = false;

  //Vaiables necesarias para cargar el excel
  storeData: any;
  fileUploadedExcel: File;
  worksheet: any;

  //Guardamos las variables del formlario anterior que pasa entre componentes
  data_info: Array<any> = [];

  ngOnInit() {
    //Ocultamos el modal
    this.hideModal();
    //Vaciamos los arrays para que la infroacion no se duplique
    this.national_base = [];
    this.foreign_base = [];
    //Obtenemso la informacion que pasa entre los componentes
    this.data_info = this.get_component_data.getOptionsCourse()
    //Almacenamos el id del curso en una vriable
    var course_id = this.data_info[0]['course_id'];
    //cursos setec van desde el 8 al 14
    //var course_id = 10;
    console.log('Este es el id del curso: ' + course_id);
    //Obteneomos la infroacion del curso y los participantes
    this.service.get('setec/' + course_id).subscribe(resp => {
      console.log(resp)
      //Guardamos la informacion del curso
      this.detail_course = resp['data']['course_detail'];
      //Guardamos la informacion de los participantes 
      this.participants_course = resp['data']['course_participant'];
      //Recorremos los participantes
      this.participants_course.forEach(element => {
        //Definimos si es ecuatoriano o extrangero y los almacenamos en los arrays correspondientes
        element['nationality'] == "ECUATORIANO/A" ? this.national_base.push(element) : this.foreign_base.push(element);
        console.log(this.national_base);
        console.log(this.foreign_base);

      });
    }, (error) => {
      //Imprimimos el array
      console.log(error)
    })

  }

  //Funcion para ocultar el modal
  hideModal() {
    document.getElementById('process-modal-fade').style.display = 'none'
  }

  //funcion para  mostrar el modal
  slowModal() {
    document.getElementById('process-modal-fade').style.display = 'block';
  }

  //Fundion para validar el excel
  validateExcel() {
    //Validamos la informacion del excel haciendo visible toda la informacion 
    //Ya que si queremos descragar el excel con infromacion oculta (*ngIf) no se mostrara 
    this.current_form_foreign = 'active'
    this.current_form_national = 'active'
    this.status_download_file = 'active'
    this.service_message.add({ key: 'tst', severity: 'info', summary: 'Formulario Listo', detail: 'El formulario está preparado para su descarga' });
  }

  //funcion para exportar a excel todo el contenido a traves del id
  exportexcel(): void {
    //Generamos una variable para el nombre del archivo con fecha
    var date = new Date();
    var fileName = `BaseDatosSellado_${date.getMonth() + 1}${date.getDate()}${date.getFullYear()}.xlsx`;
    /* table id is passed over here */


    let leaf_nationality = document.getElementById('base-national');
    const ws: XLSX.WorkSheet = XLSX.utils.table_to_sheet(leaf_nationality);
    let leaf_foreign = document.getElementById('base-foreign');
    const ws1: XLSX.WorkSheet = XLSX.utils.table_to_sheet(leaf_foreign);

    /* generate workbook and add the worksheet */
    const wb: XLSX.WorkBook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, "BASE NACIONALES");
    XLSX.utils.book_append_sheet(wb, ws1, "BASE EXTRANJEROS");

    /* save to file */
    XLSX.writeFile(wb, fileName);
    this.descargarFormulario()

  }


  //Funcion para obetener un excel a partir de un array
  toExportFileName(excelFileName: string): string {
    var date = new Date();
    this.service_message.add({ key: 'tst', severity: 'success', summary: 'Archivo Descargado', detail: 'Carga los códigos en este excel y cargalo' });
    return `${excelFileName}_${date.getMonth() + 1}${date.getDate()}${date.getFullYear()}.xlsx`;
  }

  exportAsExcelFile(json: any[], excelFileName: string): void {
    const worksheet: XLSX.WorkSheet = XLSX.utils.json_to_sheet(json);
    const workbook: XLSX.WorkBook = { Sheets: { 'generar_códigos': worksheet }, SheetNames: ['generar_códigos'] };
    XLSX.writeFile(workbook, this.toExportFileName(excelFileName));
  }

  ExportExcelNomina() {
    //Enviamos el Array de los participantes del curso
    this.exportAsExcelFile(this.participants_course, 'BaseDatosSelladoCodigos');
  }
  // Fin Funcion para obetener un excel a partir de un array


  //Funcion para leer el excel y ejecutarlo
  public onSelectImage(evt: any) {
    //Almacenamos en una variable el archivo
    this.fileUploaded = evt[0];
    console.log(this.fileUploaded)
    //ejecutamos la funcion para leer el Excel
    this.readExcel();
  }

  //Validar si volvemos a Escoger el Excel el anerior excel cambiado se elimina
  public onRemoveImage() {
    this.participants_course.map(function (dato) {
      dato.code_certificate = 'null';
    })
  }

  //Funcion para ller el archivo excel
  readExcel() {
    this.onRemoveImage()
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



      //console.log(this.worksheet['A1']) 
      console.log('este es el dataExcel');

      console.log(data_excel);


      //Recorremos los participantes del curso
      this.participants_course.map(function (dato) {
        console.log(dato['identification']);
        //Recorremos la infroacion del Excel
        data_excel.forEach(element => {
          console.log(element);
          //Verificamos si existe a traves del numero de cedula (si existe el participante dentro del excel) 
          if (element['identification'] == dato['identification']) {
            console.log('coincidencia: ' + element['identification'] + '==' + dato['identification'])
            //Asignamos el valor del Excel al participante
            dato.code_certificate = element['code_certificate'];
          }
        });
      })


      //Verificamos que todos los participantes contengan un codigo caso contrario se lanza un error
      this.participants_course.forEach(element => {
        console.log(element['code_certificate']);
        element['code_certificate'] !== 'null' ? this.cargarArchivo() : this.errorExcel();
      });
    }
    readFile.readAsArrayBuffer(this.fileUploaded);
  }


  //Funcion para seleccionar los pdfs
  public onSelectPdf(evt: any) {

    console.log(this.participants_course.length)
    console.log(evt.length)
    //verificamos que el numero de pdfs sean igual al numero de participnates
    if (this.participants_course.length == evt.length) {
      this.validate_pdf_participants = true
      this.service_message.add({ key: 'tst', severity: 'success', summary: 'Archvios Listos', detail: 'Los archivos estan listos para subirse' });
    } else {
      this.validate_pdf_participants = false;
      this.service_message.add({ key: 'tst', severity: 'error', summary: 'Numero de archivos', detail: 'El número de archivos no coincide con el número de participantes' });
    }

    //Vaciamos el array_files
    this.array_files = []
    for (let index = 0; index < evt.length; index++) {
      const element = evt[index];
      //Guardamos los archivos dentro de un array para pasarlo a la siguiente funcion
      this.array_files.push(element);
      console.log(this.array_files)
    }
  }

  //Enviar Los Pdfs al sistema
  public async sendFile() {
    console.log(this.array_files);
    //recorremos el array de archivos 
    await this.array_files.forEach(element => {

      var exist_file: any = false;
      var name_file: any = '';
      var data_user: any;
      var myFormData = new FormData();
      //Recorremos los participantes del curso
      this.participants_course.forEach(participant => {
        element.code_certificate
        //Verificamos si el nombre del codigo del excel se encunetra en el nombre del archivo pdf
        if (element.name.includes(participant.code_certificate)) {
          //Valimos su existencia en exist_file
          exist_file = true;
          //Agregamos en myFormData lo necesario para subir los certificados el sistema y en la base de dtaos
          myFormData.append('id_detail_registration', participant.id_detail_registration);
          myFormData.append('code_setec_certificate', participant.code_certificate);
          myFormData.append('image', element);
        } else {
          //Si no existe ponemos el nombre del archivo para mostrarlo en un error
          name_file = element.name;
        }
      });
      //SI existe el archivo pdf en los codigos del Excel
      if (exist_file === true) {
        console.log('dentro de foreach')
        myFormData.append('image', element);
        //Ejecutamos el servicio para enviar el pdf y la data del usuario 
        this.service.sendFile('sample-restful-apis', myFormData).subscribe(resp => {
          console.log('respuesta server:');
          console.log(resp['data']);
          this.pdf_save_success();
        }, (error) => {
          console.log('error server:');
          console.log(error);
        })
      } else {
        // Si no existe mostramos un error
        this.pdf_save_error(name_file);
      }
    });
    //Refrescamos los cambio para visualizarlos
    this.ngOnInit();
  }


  //Cambiar de esquema de base de datos nacionales a base de datos extrangeros
  Esquemas() {
    this.status_download_file = 'inactive'
    if (this.current_form_national == 'active') {
      this.current_form_foreign = 'active'
      this.current_form_national = 'inactive'
    } else {
      this.current_form_foreign = 'inactive'
      this.current_form_national = 'active'
    }
  }

  //Funcion Alerta para exito en archivo cargado
  cargarArchivo() {
    this.service_message.add({ key: 'tst', severity: 'success', summary: 'Archivo Cargado', detail: 'El archivo se ha cargado exitosamente' });
  }
  //Funcion Alerta para info en formulario descargado
  descargarFormulario() {
    this.service_message.add({ key: 'tst', severity: 'info', summary: 'Formulario Descargado', detail: 'El formulario se ha descargado exitosamente' });
  }
  //Funcion Alerta para error en archivo erroneo de Excel
  errorExcel() {
    this.service_message.add({ key: 'tst', severity: 'error', summary: 'Error en el archivo', detail: 'Verifique que el archivo emitido por Senescyt contenga todos los códigos.' });
  }
  //Funcion Alerta para exito en pdf guardado
  pdf_save_success() {
    this.service_message.add({ key: 'tst', severity: 'success', summary: 'Certificados Cargados', detail: 'Los certificados se han almacenado correctamente' });
  }
  //Funcion Alerta para error en archivo no corresponde
  pdf_save_error(archivo) {
    this.service_message.add({ key: 'tst', severity: 'error', summary: 'Archivo Erroneo', detail: 'Existe un archivo que no corresponde, verificalo ' + archivo });
  }


}
