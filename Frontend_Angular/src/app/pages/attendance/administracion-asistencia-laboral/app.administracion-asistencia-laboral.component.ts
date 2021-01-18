import {Component, OnInit, ViewEncapsulation} from '@angular/core';
import {BreadcrumbService} from '../../../shared/breadcrumb/breadcrumb.service';
import {Car} from '../../../demo/domain/car';
import {MessageService, SelectItem, TreeNode} from 'primeng/api';
import {CarService} from '../../../demo/service/carservice';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';
import {EventService} from '../../../demo/service/eventservice';
import {NodeService} from '../../../demo/service/nodeservice';
import {AttendanceService} from '../../../services/attendance/attendance.service';
import {Attendance} from '../../../models/attendance/attendance';
import {Workday} from '../../../models/attendance/workday';
import {Catalogue} from '../../../models/attendance/catalogue';
import {NgxSpinnerService} from 'ngx-spinner';
import {User} from '../../../models/authentication/user';

@Component({
    selector: 'app-asistencia-laboral',
    templateUrl: './app.administracion-asistencia-laboral.component.html',
    styleUrls: ['app.administracion-asistencia-laboral.component.scss'],
    encapsulation: ViewEncapsulation.None
})
export class AppAdministracionAsistenciaLaboralComponent implements OnInit {
    docenteActividadesItems: SelectItem[];
    selectedMultiSelectDocenteActividades: string[];
    actividadesSeleccionadas: any[];
    cols: any[];
    activitiesCols: any[];

    docenteActividades: Array<Catalogue>;
    selectedCar: Car;
    totalHorasTrabajadas: Date;
    horaInicioJornada: string;
    horaFinJornada: string;
    docenteAsistencia: Attendance;
    jornadaActividades: Array<Workday>;
    events: any[];
    fullCalendarOptions: any;
    resumenAsistencias: any[];
    detalleAsistencias: any[];
    activities: any[];
    attendanceActivites: any[];
    fechas: Date;
    sortField: string;
    sortOrder: number;
    sortOptions: SelectItem[];
    filterOptions: SelectItem[];
    sortKey: string;
    tipoFiltro: string;
    exportColumnsWokrdays: any[];
    exportColumnsTasks: any[];
    workday: Workday;
    user: User;
    displayWorkday: boolean;
    selectedAttendance: any;
    categories: TreeNode[];
    selectedCategories: TreeNode[];
    observations: string;

    constructor(private message: MessageService,
                private eventService: EventService, private nodeService: NodeService, private breadcrumbService: BreadcrumbService,
                private attendanceService: AttendanceService, private spinner: NgxSpinnerService) {
        this.user = JSON.parse(localStorage.getItem('user')) as User;
        this.breadcrumbService.setItems([
            {label: 'Control Asistencia'}
        ]);
        this.docenteAsistencia = new Attendance();
        // this.fechas = [];
        this.sortOptions = [
            {label: 'Apellido', value: 'first_lastname'},
            {label: 'Hora Inicio', value: 'start_time'},
            {label: 'Hora Fin', value: 'end_time'}
        ];
        this.filterOptions = [
            {label: 'Apellido', value: 'first_lastname'},
            {label: 'Hora Inicio', value: 'start_time'},
            {label: 'Hora Fin', value: 'end_time'},
            {label: 'Duración', value: 'duration'}
        ];
        this.tipoFiltro = 'first_lastname';
        this.resumenAsistencias = [];
        this.detalleAsistencias = [];
        this.workday = new Workday();
    }

    ngOnInit() {
        this.cols = [
            {field: 'date', header: 'Fecha'},
            {field: 'identification', header: 'Identificación'},
            {field: 'first_lastname', header: 'Docente'},
            {field: 'type_workdays', header: 'Jornada/Almuerzo'},
            {field: 'start_time', header: 'Hora Inicio'},
            {field: 'end_time', header: 'Hora Fin'},
            {field: 'duration', header: 'Duración'},
        ];
        this.activitiesCols = [
            {field: 'date', header: 'Fecha'},
            {field: 'identification', header: 'Identificación'},
            {field: 'first_lastname', header: 'Docente'},
            {field: 'type_workdays', header: 'Actividad'},
        ];
        this.exportColumnsWokrdays = this.cols.map(col => ({title: col.header, dataKey: col.field}));
        this.exportColumnsTasks = this.activitiesCols.map(col => ({title: col.header, dataKey: col.field}));
        this.obtenerJornadaActividadesResumen();
        this.obtenerJornadaActividadesDetalle();
        this.fullCalendarOptions = {
            plugins: [dayGridPlugin, timeGridPlugin, interactionPlugin],
            defaultDate: new Date(),
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            }
        };

    }

    obtenerJornadaActividadesResumen() {
        const currentDate = new Date();
        this.spinner.show();
        let parametros = '';

        if (this.fechas) {
            parametros = '?start_date='
                + this.fechas[0].getFullYear()
                + '-' + (this.fechas[0].getMonth() + 1)
                + '-' + this.fechas[0].getDate()
                + '&end_date='
                + this.fechas[1].getFullYear()
                + '-' + (this.fechas[1].getMonth() + 1)
                + '-' + this.fechas[1].getDate();
        } else {
            parametros = '?start_date=' + currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate()
                + '&end_date=' + currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate();
        }
        this.attendanceService.get('attendances/summary' + parametros).subscribe(
            response => {
                if (response) {
                    this.resumenAsistencias = response['data']['attendances'];
                    this.spinner.hide();
                }
            }, error => {
                this.spinner.hide();
            }
        );
    }

    obtenerJornadaActividadesDetalle() {
        const currentDate = new Date();
        this.spinner.show();
        let parametros = '';

        if (this.fechas) {
            parametros = '?start_date='
                + this.fechas[0].getFullYear()
                + '-' + (this.fechas[0].getMonth() + 1)
                + '-' + this.fechas[0].getDate()
                + '&end_date='
                + this.fechas[1].getFullYear()
                + '-' + (this.fechas[1].getMonth() + 1)
                + '-' + this.fechas[1].getDate();
        } else {
            parametros = '?start_date=' + currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate()
                + '&end_date=' + currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate();
        }
        this.attendanceService.get('attendances/detail' + parametros).subscribe(
            response => {
                if (response) {
                    const data = response['data']['attendances'];
                    let identification = 0;
                    let date = null;
                    this.detalleAsistencias = [];
                    this.attendanceActivites = [];
                    data.forEach(attendance => {
                        this.activities = [];
                        if (attendance.state != null) {
                            identification = attendance.teacher.user.identification;
                            date = attendance.date;

                            attendance.workdays.forEach(workday => {
                                if (workday.state != null && workday.type.state != null) {
                                    this.detalleAsistencias.push({
                                        'workday_id': workday.id,
                                        'date': attendance.date,
                                        'identification': attendance.teacher.user.identification,
                                        'first_lastname': attendance.teacher.user.first_lastname,
                                        'second_lastname': attendance.teacher.user.second_lastname,
                                        'first_name': attendance.teacher.user.first_name,
                                        'second_name': attendance.teacher.user.second_name,
                                        'type_workdays': workday.type.name,
                                        'start_time': workday.start_time,
                                        'end_time': workday.end_time,
                                        'duration': workday.duration,
                                        'observations': workday.observations,
                                    });
                                }
                            });
                            attendance.tasks.forEach(task => {
                                if (task.state != null && task.type.state != null) {
                                    this.activities.push({
                                        'task_id': task.id,
                                        'type_workdays': task.type.name,
                                        'description': task.description,
                                        'percentage_advance': task.percentage_advance,
                                        'observations': task.observations,
                                    });
                                }
                            });
                            this.attendanceActivites.push({
                                'date': attendance.date,
                                'identification': attendance.teacher.user.identification,
                                'first_lastname': attendance.teacher.user.first_lastname,
                                'second_lastname': attendance.teacher.user.second_lastname,
                                'first_name': attendance.teacher.user.first_name,
                                'second_name': attendance.teacher.user.second_name,
                                'activities': this.activities.length > 0 ? this.activities : [],
                            });
                        }
                    });
                    console.log(this.attendanceActivites);
                    this.spinner.hide();
                }
            }, error => {
                this.spinner.hide();
            }
        );
    }

    updateWorkday(): void {
        if (this.observations.length > 0) {
            const paramas = '?user_id=' + this.user.id;
            this.workday.id = this.selectedAttendance.workday_id;
            this.workday.start_time = this.selectedAttendance.start_time;
            this.workday.end_time = this.selectedAttendance.end_time;
            this.workday.observations = [this.observations];
            this.spinner.show();
            this.attendanceService.update('workdays' + paramas, {'workday': this.workday}).subscribe(
                response => {
                    this.message.add({
                        key: 'tst',
                        severity: 'success',
                        summary: 'Cambio de hora correcto',
                        detail: 'Se ha cambiado la hora correctamente'
                    });
                    this.displayWorkday = false;
                    this.obtenerJornadaActividadesDetalle();
                    this.spinner.hide();
                }, error => {
                    this.message.add({
                        key: 'tst',
                        severity: 'error',
                        summary: 'Tenemos problemas con el servidor!',
                        detail: 'Inténtalo de nuevo más tarde!'
                    });
                    this.displayWorkday = false;
                    this.obtenerJornadaActividadesDetalle();
                    this.spinner.hide();
                }
            );
        } else {
            this.message.add({
                key: 'tst',
                severity: 'error',
                summary: 'Escriba un motivo',
                detail: 'Debe escribir un motivo para el cambio de hora'
            });
        }
    }

    sumarHoras(duracion: string, totalHorasTrabajadas: string): string {
        const duracionTotal = totalHorasTrabajadas.split(':');

        const horaTotal = Number(duracionTotal[0]);
        const minutoTotal = Number(duracionTotal[1]);
        const segundoTotal = Number(duracionTotal[2]);

        const duracionParcial = duracion.split(':');
        const horaParcial = Number(duracionParcial[0]);
        const minutoParcial = Number(duracionParcial[1]);
        const segundoParcial = Number(duracionParcial[2]);

        let horaAdicional = 0;
        let minutoAdicional = 0;
        if (segundoTotal + segundoParcial > 60) {
            minutoAdicional = 1;
        }
        if (minutoTotal + minutoParcial > 60) {
            horaAdicional = 1;
        }

        const horaSuma = horaTotal + horaParcial + horaAdicional;
        const minutoSuma = (minutoTotal + minutoParcial + minutoAdicional) > 60 ? 0 : minutoTotal + minutoParcial + minutoAdicional;
        const segundoSuma = (segundoTotal + segundoParcial) > 60 ? 0 : segundoTotal + segundoParcial;

        return horaSuma + ':' + minutoSuma + ':' + segundoSuma;
    }

    filtrarFechas() {
        if (this.fechas) {
            if (this.fechas[1] != null) {
                this.obtenerJornadaActividadesResumen();
                this.obtenerJornadaActividadesDetalle();
            }
        }
    }

    onSortChange(event) {
        const value = event.value;
        if (value.indexOf('!') === 0) {
            this.sortOrder = -1;
            this.sortField = value.substring(1, value.length);
        } else {
            this.sortOrder = 1;
            this.sortField = value;
        }
    }

    exportPdf(data, exportColumns) {
        import('jspdf').then(jsPDF => {
            import('jspdf-autotable').then(x => {
                const doc = new jsPDF.default(0, 0);
                doc.autoTable(exportColumns, data);
                doc.save('asistencias.pdf');
            });
        });
    }

    exportExcel(data) {
        import('xlsx').then(xlsx => {
            const worksheet = xlsx.utils.json_to_sheet(data);
            const workbook = {Sheets: {'data': worksheet}, SheetNames: ['data']};
            const excelBuffer: any = xlsx.write(workbook, {bookType: 'xlsx', type: 'array'});
            this.saveAsExcelFile(excelBuffer, 'asistencias');
        });
    }

    saveAsExcelFile(buffer: any, fileName: string): void {
        import('file-saver').then(FileSaver => {
            const EXCEL_TYPE = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=UTF-8';
            const EXCEL_EXTENSION = '.xlsx';
            const data: Blob = new Blob([buffer], {
                type: EXCEL_TYPE
            });
            FileSaver.saveAs(data, fileName + '_export_' + new Date().getTime() + EXCEL_EXTENSION);
        });
    }

    selectAttendance(attedance) {
        this.selectedAttendance = attedance;
        this.observations = '';
        if (this.selectedAttendance.observations) {

        }
    }
}

