<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Support\Facades\Date;
use App\Models\Cecy\DetailRegistration;
use App\Models\Cecy\PlanificationInstructor;

class pdfController extends Controller
{
    public function saveDiplomaPDF(Request $request)
    {


        $arrayMeses = array(
            'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
            'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
        );

        $arrayDias = array(
            'Domingo', 'Lunes', 'Martes',
            'Miercoles', 'Jueves', 'Viernes', 'Sabado'
        );

        $date_today =  $arrayDias[date('w')] . ", " . date('d') . " de " . $arrayMeses[date('m') - 1] . " de " . date('Y');
        /*
     Resultado, (fecha actual 21/09/2012):
     Viernes, 21 de Septiembre de 2012
     */

        $routes = [];
        $data = $request->all();


        $nombre_diploma = $data['code_course'] . $data['identification'] . $data['participant_name'] . $data['participant_lastname'] . date("Y-m-d") . '.pdf';

        $data_certificate = [
            'names' => $data['participant_name'].' '.$data['participant_secondname'],
            'lastnames' => $data['participant_lastname'].' '.$data['participant_secondlastname'],
            'course_name' => $data['course_name'],
            'start_date' => $data['date_start'],
            'end_date' => $data['date_end'],
            'main_firm_name' => $data['name_main_firm'],
            'main_position' => $data['main_position'],
            'second_firm_name' => $data['name_second_firm'],
            'second_position' => $data['second_position'],
            'date_today' => $date_today,
            'code_participant' => $data['code_certification']
        ];

        $pdf = PDF::loadView('diploma-pdf', $data_certificate)
            ->setPaper('a4', 'landscape')
            ->save(storage_path('app/public/pdf_reports/diplomas/')  . $nombre_diploma);

        array_push($routes, $nombre_diploma);

        $data_update_instructor = [
            'code_certificate' => $data['code_certification'],
            'location_certificate' => url('/') . '/storage/pdf_reports/diplomas/' . $nombre_diploma,
            'status_certificate_id' => 291
        ];
        PlanificationInstructor::where('id', $data['id_planification_instructor'])->update($data_update_instructor);


        return response()->json([
            'data' => $routes,
            'msg' => [
                'summary' => 'success',
                'detail' => 'Course_Participants',
                'code' => '200',
            ]
        ], 200);
    }


    public function saveCertificadoPDF(Request $request)
    {
        $arrayMeses = array(
            'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
            'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
        );

        $arrayDias = array(
            'Domingo', 'Lunes', 'Martes',
            'Miercoles', 'Jueves', 'Viernes', 'Sabado'
        );

        $date_today =  $arrayDias[date('w')] . ", " . date('d') . " de " . $arrayMeses[date('m') - 1] . " de " . date('Y');
        /*
     Resultado, (fecha actual 21/09/2012):
     Viernes, 21 de Septiembre de 2012
     */

        $routes = [];
        $data = $request->all();

        foreach ($data['participants'] as $item) {

            $nombre_certificado = $data['code_course'] . $item['identification'] . $item['participant_name'] . $item['participant_lastname'] . date("Y-m-d") . '.pdf';

            $data_certificate = [
                'name' => $item['participant_name'] . ' ' . $item['participant_secondname'],
                'lastname' => $item['participant_lastname'] . ' ' . $item['participant_secondlastname'],
                'course_name' => $data['course_name'],
                'site_course' => $data['site_course'],
                'start_date' => $data['date_start'],
                'end_date' => $data['date_end'],
                'duration' => $data['duration'],
                'main_firm_name' => $data['name_main_firm'],
                'main_position' => $data['main_position'],
                'second_firm_name' => $data['name_second_firm'],
                'second_position' => $data['second_position'],
                'date_today' => $date_today,
                'code_participant' => $item['code_certificate']
            ];

            $pdf = PDF::loadView('certificado-pdf', $data_certificate)
                ->setPaper('a4', 'landscape')
                ->save(storage_path('app/public/pdf_reports/certificados/') . $nombre_certificado);


            array_push($routes, $nombre_certificado);

            $data_update_detailregistration = [
                'code_certificate' => $item['code_certificate'],
                'location_certificate' => url('/') . '/storage/pdf_reports/certificados/' . $nombre_certificado,
                'status_certificate_id' => 291,
                'certificate_withdrawn' => date("Y/m/d")
            ];
            DetailRegistration::where('id', $item['id_detail_registration'])->update($data_update_detailregistration);
        }


        return response()->json([
            'data' => $routes,
            'msg' => [
                'summary' => 'success',
                'detail' => 'Course_Participants',
                'code' => '200',
            ]
        ], 200);
    }
}
