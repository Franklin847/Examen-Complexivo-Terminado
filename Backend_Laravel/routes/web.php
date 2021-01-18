<?php

use App\Models\Ignug\State;
use App\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function (Request $request) {

    return \Illuminate\Support\Facades\Hash::make('12345678');
});
Route::get('password_generate', function () {
    return \Illuminate\Support\Facades\Hash::make('123');
});


//crea y guarda el diploma del instructor 
Route::post('/api/cecy/savePdfDiploma', 'pdfController@saveDiplomaPDF')->name('saveDiplomaPDF');
//Crea y guarda los certificados de los participantes del curso
Route::post('/api/cecy/savePdfCertificado', 'pdfController@saveCertificadoPDF')->name('saveCertificadoPDF');


//Rutas para consumir en el angular, caso certificados

//Traer las entidades que certifican: Senescyt, cecy, setec
Route::get('/api/cecy/entity_certification', 'Cecy\CertificationController@entity_certification_index')->name('entity_certification_index');
//Traer las carreras dependiendo del tipo de entidad
Route::get('/api/cecy/career/{entity}', 'Cecy\CertificationController@career_index')->name('career_index');
//Traer las capacitaciones dependiendo de la entidad y la carrera
Route::get('/api/cecy/capacitation/{entity}/{career}', 'Cecy\CertificationController@capacitation_index')->name('capacitation_index');
//Traer los cursos dependeindo de la entidad, carrera y capacitacion
Route::get('/api/cecy/course/{entity}/{career}/{capacitation}', 'Cecy\CertificationController@course_index')->name('course_index');
//Traer las fechas de finalizacion de los cursos seleccionados
Route::post('/api/cecy/course_end', 'Cecy\CertificationController@course_end_store')->name('course_end_store');
//Traer los paralelos de los cursos cuado el nobre y la fecha fin coincidan
Route::post('/api/cecy/course_parallel', 'Cecy\CertificationController@course_paralell_store')->name('course_paralell_store');
//Traer el horario del curso, MAtituno o vespertino
Route::post('/api/cecy/course_conference', 'Cecy\CertificationController@course_conference_store')->name('course_conference_store');
//Traer el id del curso despues de haber filtrado toda la informacion
Route::post('/api/cecy/course_all', 'Cecy\CertificationController@course_all_store')->name('course_all_store');



//Traer los elementos del curso, senescytB2 
Route::get('/api/cecy/senescytB2_course/{course}', 'Cecy\CertificationController@senescyt_B2_curso_index')->name('senescyt_B2_curso_index');
//Traer los elementos del curso, senescytC1 
Route::get('/api/cecy/senescytC1_course/{course}', 'Cecy\CertificationController@senescyt_C1_curso_index')->name('senescyt_C1_curso_index');
//Traer los instructores del curso y los detales del curso Cecy
Route::get('/api/cecy/cecy/{course}', 'Cecy\CertificationController@cecy_curso_index')->name('cecy_curso_index');



//Upload file example
Route::post('/api/cecy/sample-restful-apis' , 'Cecy\CertificationController@uploadimage')->name('uploadimage');





//Rutas para la certificacion SETEC
//Traer las carreras dependiendo del tipo de entidad
Route::get('/api/cecy/setec_institute/{entity}', 'Cecy\CertificationController@setec_institute_index')->name('setec_institute_index');
//Traer las capacitaciones dependiendo de la entidad e instituto de setec
Route::get('/api/cecy/setec_capacitation/{entity}/{institute}', 'Cecy\CertificationController@setec_capacitation_index')->name('setec_capacitation_index');
//Traer los cursos dependeindo de la entidad, instituto y capacitacion de setec
Route::get('/api/cecy/setec_course/{entity}/{institute}/{capacitation}', 'Cecy\CertificationController@setec_course_index')->name('setec_course_index');
//Traer las fechas de finalizacion de los cursos seleccionados setec
Route::post('/api/cecy/setec_course_end', 'Cecy\CertificationController@setec_course_end_store')->name('setec_course_end_store');
//Traer los paralelos de los cursos cuado el nobre y la fecha fin coincidan en setec
Route::post('/api/cecy/setec_course_parallel', 'Cecy\CertificationController@setec_course_paralell_store')->name('setec_course_paralell_store');
//Traer el horario del curso, MAtituno o vespertino de setec
Route::post('/api/cecy/setec_course_conference', 'Cecy\CertificationController@setec_course_conference_store')->name('setec_course_conference_store');
//Traer el id del curso despues de haber filtrado toda la informacion
Route::post('/api/cecy/setec_course_all', 'Cecy\CertificationController@setec_course_all_store')->name('setec_course_all_store');
//Traer los instructores del curso y los detales del curso Cecy
Route::get('/api/cecy/setec/{course}', 'Cecy\CertificationController@setec_curso_index')->name('setec_curso_index');


//Visualizar los cursos en los que ha estado el participante y el certificado.
Route::get('/api/cecy/user_certificate_view/{id_user}', 'Cecy\CertificationController@participant_curso_index')->name('participant_curso_index');
