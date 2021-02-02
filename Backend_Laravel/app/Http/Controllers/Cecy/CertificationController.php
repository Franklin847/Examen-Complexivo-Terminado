<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Catalogue;
use App\Models\Cecy\Course;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\PlanificationInstructor;
use App\Models\Cecy\Topic;
use App\Models\Cecy\Registration;
use App\Models\Cecy\Planification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Cecy\SetecDetailRegistration;

class CertificationController extends Controller
{
    public function entity_certification_index()
    {

        $catalogue = Catalogue::select('id', 'name')->where('type', 'entity_certification')->orderBy('id')->get();
        return response()->json(
            [
                'data' => [
                    'attributes' => $catalogue
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Catalogue',
                    'code' => '200',
                ]
            ],
            200
        );
    }

    public function career_index($entity)
    {

        $career = Course::select('ignug.careers.id', 'ignug.careers.name')
            ->distinct('ignug.careers.name')
            ->join('cecy.planifications as plan', 'plan.course_id', '=', 'courses.id')
            ->join('ignug.careers', 'ignug.careers.id', '=', 'plan.career_id')
            ->where('courses.entity_certification_type_id', $entity)
            ->where('courses.state_id', 2)
            ->get();
        return response()->json(
            [
                'data' => [
                    'attributes' => $career
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Career',
                    'code' => '200',
                ]
            ],
            200
        );
    }

    public function setec_institute_index($entity)
    {

        $institute = Course::select('institute.id', 'institute.name')
            ->distinct('institute.name')
            ->join('cecy.setec_planifications as plan', 'plan.course_id', '=', 'courses.id')
            ->join('cecy.institutions as institute', 'institute.id', '=', 'plan.institution_id')
            ->where('courses.entity_certification_type_id', $entity)
            ->where('courses.state_id', 2)
            ->get();
        return response()->json(
            [
                'data' => [
                    'attributes' => $institute
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Career',
                    'code' => '200',
                ]
            ],
            200
        );
    }

    public function capacitation_index($entity, $career)
    {

        $capacitation = Course::select('cecy.catalogues.id', 'cecy.catalogues.name')
            ->distinct('cecy.catalogues.name')
            ->join('cecy.catalogues', 'cecy.catalogues.id', '=', 'courses.capacitation_type_id')
            ->join('cecy.planifications as plan', 'courses.id', '=', 'plan.course_id')
            ->where('courses.entity_certification_type_id', $entity)
            ->where('plan.career_id', $career)
            ->where('courses.state_id', 2)
            ->get();
        return response()->json(
            [
                'data' => [
                    'attributes' => $capacitation
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Capacitation',
                    'code' => '200',
                ]
            ],
            200
        );
    }

    public function setec_capacitation_index($entity, $institute)
    {

        $capacitation = Course::select('cecy.catalogues.id', 'cecy.catalogues.name')
            ->distinct('cecy.catalogues.name')
            ->join('cecy.catalogues', 'cecy.catalogues.id', '=', 'courses.capacitation_type_id')
            ->join('cecy.setec_planifications as plan', 'courses.id', '=', 'plan.course_id')
            ->where('courses.entity_certification_type_id', $entity)
            ->where('plan.institution_id', $institute)
            ->where('courses.state_id', 2)
            ->get();
        return response()->json(
            [
                'data' => [
                    'attributes' => $capacitation
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Capacitation',
                    'code' => '200',
                ]
            ],
            200
        );
    }

    public function course_index($entity, $career, $capacitation)
    {

        $course = Course::select('courses.id', 'courses.name')
            ->distinct('courses.name')
            ->join('cecy.planifications as plan', 'courses.id', '=', 'plan.course_id')
            ->where('courses.entity_certification_type_id', $entity)
            ->where('plan.career_id', $career)
            ->where('courses.capacitation_type_id', $capacitation)
            ->where('courses.state_id', 2)
            ->get();
        return response()->json(
            [
                'data' => [
                    'attributes' => $course
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course',
                    'code' => '200',
                ]
            ],
            200
        );
    }

    public function setec_course_index($entity, $institute, $capacitation)
    {

        $course = Course::select('courses.id', 'courses.name')
            ->distinct('courses.name')
            ->join('cecy.setec_planifications as plan', 'courses.id', '=', 'plan.course_id')
            ->where('courses.entity_certification_type_id', $entity)
            ->where('plan.institution_id', $institute)
            ->where('courses.capacitation_type_id', $capacitation)
            ->where('courses.state_id', 2)
            ->get();
        return response()->json(
            [
                'data' => [
                    'attributes' => $course
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course',
                    'code' => '200',
                ]
            ],
            200
        );
    }

    public function course_end_store(Request $request)
    {

        $data = $request->all();
        $course_name = $data['course'];
        $entity = $data['entity'];
        $career = $data['careerInstitute'];
        $capacitation = $data['capacitation'];

        $course_end = Course::select('cecy.planifications.id', 'courses.name', 'cecy.planifications.date_end')
            ->distinct('cecy.planifications.date_end')
            ->join('cecy.planifications', 'cecy.planifications.course_id', '=', 'courses.id')
            ->where('courses.name', $course_name)
            ->where('courses.entity_certification_type_id', $entity)
            ->where('cecy.planifications.career_id', $career)
            ->where('courses.capacitation_type_id', $capacitation)
            ->where('courses.state_id', 2)
            ->get();

        return response()->json(
            [
                'data' => [
                    'attributes' => $course_end
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course',
                    'code' => '200',
                ]
            ],
            200
        );
    }

    public function setec_course_end_store(Request $request)
    {

        $data = $request->all();
        $course_name = $data['course'];
        $entity = $data['entity'];
        $institute = $data['careerInstitute'];
        $capacitation = $data['capacitation'];

        $course_end = Course::select('plan.id', 'courses.name', 'plan.date_end')
            ->distinct('plan.date_end')
            ->join('cecy.setec_planifications as plan', 'courses.id', '=', 'plan.course_id')
            ->where('courses.name', $course_name)
            ->where('courses.entity_certification_type_id', $entity)
            ->where('plan.institution_id', $institute)
            ->where('courses.capacitation_type_id', $capacitation)
            ->where('courses.state_id', 2)
            ->get();

        return response()->json(
            [
                'data' => [
                    'attributes' => $course_end
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course',
                    'code' => '200',
                ]
            ],
            200
        );
    }
    public function course_paralell_store(Request $request)
    {

        $data = $request->all();
        $course_name = $data['course'];
        $end_date = $data['end_course'];
        $entity = $data['entity'];
        $career = $data['careerInstitute'];
        $capacitation = $data['capacitation'];

        $course_parallel = Course::select('cecy.catalogues.id', 'cecy.catalogues.name')
            ->join('cecy.planifications', 'cecy.planifications.course_id', '=', 'courses.id')
            ->join('cecy.catalogues', 'cecy.planifications.parallel', '=', 'cecy.catalogues.id')
            ->where('courses.name', $course_name)
            ->where('cecy.planifications.date_end', $end_date)
            ->where('courses.entity_certification_type_id', $entity)
            ->where('cecy.planifications.career_id', $career)
            ->where('courses.capacitation_type_id', $capacitation)
            ->where('courses.state_id', 2)
            ->get();

        return response()->json(
            [
                'data' => [
                    'attributes' => $course_parallel
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course',
                    'code' => '200',
                ]
            ],
            200
        );
    }


    public function setec_course_paralell_store(Request $request)
    {

        $data = $request->all();
        $course_name = $data['course'];
        $end_date = $data['end_course'];
        $entity = $data['entity'];
        $institute = $data['careerInstitute'];
        $capacitation = $data['capacitation'];

        $course_parallel = Course::select('cecy.catalogues.id', 'cecy.catalogues.name')
            ->join('cecy.setec_planifications as plan', 'courses.id', '=', 'plan.course_id')
            ->join('cecy.catalogues', 'plan.parallel', '=', 'cecy.catalogues.id')
            ->where('courses.name', $course_name)
            ->where('plan.date_end', $end_date)
            ->where('courses.entity_certification_type_id', $entity)
            ->where('plan.institution_id', $institute)
            ->where('courses.capacitation_type_id', $capacitation)
            ->where('courses.state_id', 2)
            ->get();

        return response()->json(
            [
                'data' => [
                    'attributes' => $course_parallel
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course',
                    'code' => '200',
                ]
            ],
            200
        );
    }

    public function course_conference_store(Request $request)
    {

        $data = $request->all();
        $course_name = $data['course'];
        $end_date = $data['end_course'];
        $parallel = $data['parallel'];
        $entity = $data['entity'];
        $career = $data['careerInstitute'];
        $capacitation = $data['capacitation'];

        $course_conference = Course::select('cecy.catalogues.id', 'cecy.catalogues.name')
            ->join('cecy.planifications', 'cecy.planifications.course_id', '=', 'courses.id')
            ->join('cecy.catalogues', 'cecy.planifications.conference', '=', 'cecy.catalogues.id')
            ->where('courses.name', $course_name)
            ->where('cecy.planifications.date_end', $end_date)
            ->where('cecy.planifications.parallel', $parallel)
            ->where('courses.entity_certification_type_id', $entity)
            ->where('cecy.planifications.career_id', $career)
            ->where('courses.capacitation_type_id', $capacitation)
            ->where('courses.state_id', 2)
            ->get();

        return response()->json(
            [
                'data' => [
                    'attributes' => $course_conference
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course',
                    'code' => '200',
                ]
            ],
            200
        );
    }
    public function setec_course_conference_store(Request $request)
    {

        $data = $request->all();
        $course_name = $data['course'];
        $end_date = $data['end_course'];
        $parallel = $data['parallel'];
        $entity = $data['entity'];
        $institute = $data['careerInstitute'];
        $capacitation = $data['capacitation'];

        $course_conference = Course::select('cecy.catalogues.id', 'cecy.catalogues.name')
            ->join('cecy.setec_planifications as plan', 'courses.id', '=', 'plan.course_id')
            ->join('cecy.catalogues', 'plan.conference', '=', 'cecy.catalogues.id')
            ->where('courses.name', $course_name)
            ->where('plan.date_end', $end_date)
            ->where('plan.parallel', $parallel)
            ->where('courses.entity_certification_type_id', $entity)
            ->where('plan.institution_id', $institute)
            ->where('courses.capacitation_type_id', $capacitation)
            ->where('courses.state_id', 2)
            ->get();

        return response()->json(
            [
                'data' => [
                    'attributes' => $course_conference
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course',
                    'code' => '200',
                ]
            ],
            200
        );
    }

    public function course_all_store(Request $request)
    {

        $data = $request->all();
        $course_name = $data['course'];
        $end_date = $data['end_course'];
        $parallel = $data['parallel'];
        $entity = $data['entity'];
        $career = $data['careerInstitute'];
        $capacitation = $data['capacitation'];
        $conference = $data['conference'];

        $course_all = Course::select('courses.id', 'courses.name')
            ->join('cecy.planifications', 'cecy.planifications.course_id', '=', 'courses.id')
            ->where('courses.name', $course_name)
            ->where('cecy.planifications.date_end', $end_date)
            ->where('cecy.planifications.parallel', $parallel)
            ->where('courses.entity_certification_type_id', $entity)
            ->where('cecy.planifications.career_id', $career)
            ->where('courses.capacitation_type_id', $capacitation)
            ->where('cecy.planifications.conference', $conference)
            ->where('courses.state_id', 2)
            ->get();

        return response()->json(
            [
                'data' => [
                    'attributes' => $course_all
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course',
                    'code' => '200',
                ]
            ],
            200
        );
    }


    public function setec_course_all_store(Request $request)
    {

        $data = $request->all();
        $course_name = $data['course'];
        $end_date = $data['end_course'];
        $parallel = $data['parallel'];
        $entity = $data['entity'];
        $institute = $data['careerInstitute'];
        $capacitation = $data['capacitation'];
        $conference = $data['conference'];

        $course_all = Course::select('courses.id', 'courses.name')
            ->join('cecy.setec_planifications as plan', 'courses.id', '=', 'plan.course_id')
            ->where('courses.name', $course_name)
            ->where('plan.date_end', $end_date)
            ->where('plan.parallel', $parallel)
            ->where('courses.entity_certification_type_id', $entity)
            ->where('plan.institution_id', $institute)
            ->where('courses.capacitation_type_id', $capacitation)
            ->where('plan.conference', $conference)
            ->where('courses.state_id', 2)
            ->get();

        return response()->json(
            [
                'data' => [
                    'attributes' => $course_all
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course',
                    'code' => '200',
                ]
            ],
            200
        );
    }

    public function senescyt_B2_curso_index($course)
    {

        $course_info = Course::select(
            'courses.id as id_course',
            'courses.code',
            'courses.name',
            'courses.duration',
            'catalogue_modality.name as modality',
            'catalogue_type_course.name as tipe_course',
            'catalogue_place_course.name as place',
            'catalogue_canton_course.name as canton',
            'schedules_course.start_time as start_hour',
            'schedules_course.end_time as end_hour',
            'catalogue_days_course.name as days_course',
            'planification.date_start',
            'planification.date_end',
            'planification.planned_end_date',
            'catalogue_parallel_course.name as parallel',
            'institutions.name as name_institute',
            'users.first_name as instructor_name',
            'users.second_name as instructor_lastname'
        )
            ->join('cecy.planifications as planification', 'planification.course_id', '=', 'courses.id')
            ->join('cecy.planification_instructors as planification_instructor', 'planification.planification_instructor_id', '=', 'planification_instructor.id')
            ->join('cecy.instructors as instructor', 'planification_instructor.instructor_id', '=', 'instructor.id')
            ->join('authentication.users  as users', 'instructor.user_id', '=', 'users.id')
            ->join('cecy.catalogues  as catalogue_modality', 'courses.modality_id', '=', 'catalogue_modality.id')
            ->join('cecy.catalogues  as catalogue_type_course', 'courses.course_type_id', '=', 'catalogue_type_course.id')
            ->join('cecy.catalogues  as catalogue_parallel_course', 'planification.parallel', '=', 'catalogue_parallel_course.id')
            ->join('cecy.catalogues  as catalogue_place_course', 'planification.site_dictate', '=', 'catalogue_place_course.id')
            ->join('cecy.schedules  as schedules_course', 'courses.schedules_id', '=', 'schedules_course.id')
            ->join('cecy.catalogues  as catalogue_days_course', 'schedules_course.day_id', '=', 'catalogue_days_course.id')
            ->join('cecy.catalogues  as catalogue_canton_course', 'courses.canton_dictate_id', '=', 'catalogue_canton_course.id')
            ->join('ignug.careers as careers', 'planification.career_id', '=', 'careers.id')
            ->join('ignug.institutions as institutions', 'careers.institution_id', '=', 'institutions.id')
            ->where('courses.id', $course)
            ->get();



        $course_topics = Topic::select('id', 'description')
            ->where('course_id', $course)
            ->get();


        $course_participant = Registration::select(
            'catalogue_gender.name as sex',
            'users.gender_id as id_sex',
            'catalogue_state_matricula.name as state_enrollment',
            'detail_registration.final_grade'
        )
            ->join('cecy.participants as participant', 'participant.id', '=', 'registrations.participant_id')
            ->join('authentication.users as users', 'participant.user_id', '=', 'users.id')
            ->join('ignug.catalogues as catalogue_gender', 'users.gender_id', '=', 'catalogue_gender.id')
            ->join('cecy.detail_registrations as detail_registration', 'detail_registration.registration_id', '=', 'registrations.id')
            ->join('cecy.catalogues as catalogue_state_matricula', 'catalogue_state_matricula.id', '=', 'detail_registration.status_id')
            ->join('cecy.planifications as planification', 'planification.id', '=', 'registrations.planification_id')
            ->join('cecy.courses as course', 'course.id', '=', 'planification.course_id')
            ->where('course.id', $course)
            ->where('detail_registration.status_id', 282)
            ->get();

        return response()->json(
            [
                'data' => [
                    'course_detail' => $course_info,
                    'course_topic' => $course_topics,
                    'course_participant' => $course_participant
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course Senescyt B2',
                    'code' => '200',
                ]
            ],
            200
        );
    }

    //funcion para traer la informacion del senescyt C1

    public function senescyt_C1_curso_index($course)
    {

        $course_info = Course::select(
            'courses.id as id_course',
            'courses.duration',
            'courses.code as code_course',
            'institution.name as institute',
            'site_course.name as site_course',
            'career.name as career',
            'courses.name as name_course',
            'catalogue_area.name as area',
            'users.first_name as instructor_name',
            'users.second_name as instructor_secondname',
            'users.first_name as instructor_lastname',
            'users.second_lastname as instructor_lastname',
            'plan.date_start',
            'plan.date_end'
        )


            ->join('cecy.catalogues as catalogue_area', 'courses.area_id', '=', 'catalogue_area.id')
            ->join('cecy.planifications as plan', 'plan.course_id', '=', 'courses.id')
            ->join('ignug.careers as career', 'plan.career_id', '=', 'career.id')
            ->join('ignug.institutions as institution', 'institution.id', '=', 'career.institution_id')
            ->join('cecy.planification_instructors as planification_instructor', 'plan.planification_instructor_id', '=', 'planification_instructor.id')
            ->join('cecy.instructors as instructor', 'planification_instructor.instructor_id', '=', 'instructor.id')
            ->join('authentication.users as users', 'instructor.user_id', '=', 'users.id')
            ->join('cecy.catalogues as site_course', 'site_course.id', '=', 'plan.site_dictate')
            ->where('courses.id', $course)
            ->get();


        $course_participant_aproved_reproved = Registration::select(
            'detail_registration.status_id',
            'catalogue_state_matricula.name',
            'detail_registration.final_grade'
        )
            ->join('cecy.participants as participant', 'participant.id', '=', 'registrations.participant_id')
            ->join('cecy.detail_registrations as detail_registration', 'detail_registration.registration_id', '=', 'registrations.id')
            ->join('cecy.catalogues as catalogue_state_matricula', 'catalogue_state_matricula.id', '=', 'detail_registration.status_id')
            ->join('cecy.planifications as planification', 'planification.id', '=', 'registrations.planification_id')
            ->join('cecy.courses as course', 'course.id', '=', 'planification.course_id')

            ->where('course.id', $course)
            ->where('detail_registration.status_id', 282)
            ->get();


        $course_aproved = Registration::select(
            'users.id as id_user',
            'detail_registration.id as id_detail_registration',
            'detail_registration.status_id as id_state_enrollment',
            'catalogue_state_matricula.name as state_enrollment',
            'detail_registration.final_grade',
            'detail_registration.code_certificate',
            'detail_registration.location_certificate',
            'users.first_name as participant_name',
            'users.second_name as participant_secondname',
            'users.first_lastname as participant_lastname',
            'users.second_lastname as participant_secondlastname',
            'users.identification',
            'catalogue_autodefinition.name as autodefinition',
            'catalogue_gender.name as gender',
            'users.birthdate',
            'users.email',
        )
            ->join('cecy.participants as participant', 'participant.id', '=', 'registrations.participant_id')
            ->join('cecy.detail_registrations as detail_registration', 'detail_registration.registration_id', '=', 'registrations.id')
            ->join('cecy.catalogues as catalogue_state_matricula', 'catalogue_state_matricula.id', '=', 'detail_registration.status_id')
            ->join('authentication.users as users', 'participant.user_id', '=', 'users.id')
            ->join('cecy.catalogues as catalogue_autodefinition', 'participant.person_type_id', '=', 'catalogue_autodefinition.id')
            ->join('ignug.catalogues as catalogue_gender', 'users.gender_id', '=', 'catalogue_gender.id')
            ->join('cecy.planifications as planification', 'planification.id', '=', 'registrations.planification_id')
            ->join('cecy.courses as course', 'course.id', '=', 'planification.course_id')


            ->where('course.id', $course)
            ->where('detail_registration.status_id', 282)
            ->where('detail_registration.final_grade', '>=', 70)
            ->get();



        $authorities_firm = Planification::select(
            'planifications.main_firm_id as id_main_firm',
            'main_user.first_name as main_first_name',
            'main_user.second_name as main_second_name',
            'main_user.first_lastname as main_first_lastname',
            'main_user.second_lastname as main_second_lastname',
            'catalogue_main.name as main_position',
            'planifications.secondary_firm_id as id_secondary_firm',
            'secondary_user.first_name as second_first_name',
            'secondary_user.second_name as second_second_name',
            'secondary_user.first_lastname as second_first_lastname',
            'secondary_user.second_lastname as second_second_lastname',
            'catalogue_secondary.name as second_position',
        )
            ->join('cecy.authorities as main_authoritie', 'main_authoritie.id', '=', 'planifications.main_firm_id')
            ->join('cecy.authorities as secondary_authoritie', 'secondary_authoritie.id', '=', 'planifications.secondary_firm_id')
            ->join('authentication.users as main_user', 'main_authoritie.user_id', '=', 'main_user.id')
            ->join('authentication.users as secondary_user', 'secondary_authoritie.user_id', '=', 'secondary_user.id')
            ->join('cecy.catalogues as catalogue_main', 'main_authoritie.position_id', '=', 'catalogue_main.id')
            ->join('cecy.catalogues as catalogue_secondary', 'secondary_authoritie.position_id', '=', 'catalogue_secondary.id')
            ->where('planifications.course_id', $course)
            ->get();



        return response()->json(
            [
                'data' => [
                    'course_detail' => $course_info,
                    'course_aproved_reproved' => $course_participant_aproved_reproved,
                    'course_participant' => $course_aproved,
                    'authorities_firm' => $authorities_firm
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Firm Certificate',
                    'code' => '200',
                ]
            ],
            200
        );
    }


    public function cecy_curso_index($course)
    {

        $course_info = Course::select(
            'planification_instructor.id as id_planification_instructor',
            'courses.id as id_course',
            'institution.name as institute',
            'institution.code as institute_code',
            'career.name as career',
            'catalogue_parallel.name as parallel',
            'courses.name as name_course',
            'courses.code as code_course',
            'catalogue_area.name as area',
            'plan.date_start',
            'plan.date_end',
            'users.id as id_user',
            'users.first_name as instructor_name',
            'users.second_name as instructor_secondname',
            'users.first_lastname as instructor_lastname',
            'users.second_lastname as instructor_secondlastname',
            'instructor.id as id_instructor',
            'planification_instructor.code_certificate',
            'planification_instructor.location_certificate',
            'catalogue_gender.name as gender',
            'users.birthdate',
            'users.email',
            'users.identification'
        )


            ->join('cecy.catalogues as catalogue_area', 'courses.area_id', '=', 'catalogue_area.id')
            ->join('cecy.planifications as plan', 'plan.course_id', '=', 'courses.id')
            ->join('ignug.careers as career', 'plan.career_id', '=', 'career.id')
            ->join('ignug.institutions as institution', 'institution.id', '=', 'career.institution_id')
            ->join('cecy.planification_instructors as planification_instructor', 'plan.planification_instructor_id', '=', 'planification_instructor.id')
            ->join('cecy.instructors as instructor', 'planification_instructor.instructor_id', '=', 'instructor.id')            
            ->join('authentication.users as users', 'instructor.user_id', '=', 'users.id')
            ->join('ignug.catalogues as catalogue_gender', 'users.gender_id', '=', 'catalogue_gender.id')
            ->join('cecy.catalogues as catalogue_parallel', 'plan.parallel', '=', 'catalogue_parallel.id')
            ->where('courses.id', $course)
            ->get();



        $authorities_firm = Instructor::select(
            'planification_instructor.id as id_planification_instructor',
            'planification_instructor.main_firm_id as id_main_firm',
            'main_user.first_name as main_first_name',
            'main_user.second_name as main_second_name',
            'main_user.first_lastname as main_first_lastname',
            'main_user.second_lastname as main_second_lastname',
            'catalogue_main.name as main_position',
            'planification_instructor.secondary_firm_id as id_secondary_firm',
            'secondary_user.first_name as second_first_name',
            'secondary_user.second_name as second_second_name',
            'secondary_user.first_lastname as second_first_lastname',
            'secondary_user.second_lastname as second_second_lastname',
            'catalogue_secondary.name as second_position',
        )
            ->join('cecy.planification_instructors as planification_instructor', 'planification_instructor.instructor_id', '=', 'instructors.id')
            ->join('cecy.planifications as planifications', 'planifications.planification_instructor_id', '=', 'planification_instructor.id')
            ->join('cecy.authorities as main_authoritie', 'main_authoritie.id', '=', 'planification_instructor.main_firm_id')
            ->join('cecy.authorities as secondary_authoritie', 'secondary_authoritie.id', '=', 'planification_instructor.secondary_firm_id')
            ->join('authentication.users as main_user', 'main_authoritie.user_id', '=', 'main_user.id')
            ->join('authentication.users as secondary_user', 'secondary_authoritie.user_id', '=', 'secondary_user.id')
            ->join('cecy.catalogues as catalogue_main', 'main_authoritie.position_id', '=', 'catalogue_main.id')
            ->join('cecy.catalogues as catalogue_secondary', 'secondary_authoritie.position_id', '=', 'catalogue_secondary.id')
            ->where('planifications.course_id', $course)
            ->get();



        return response()->json(
            [
                'data' => [
                    'course_detail' => $course_info,
                    'authorities_firm' => $authorities_firm
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course Cecy',
                    'code' => '200',
                ]
            ],
            200
        );
    }


    public function cecy_curso_setec_index($course)
    {

        $course_info = Course::select(
            'planification_instructor.id as id_planification_instructor',
            'courses.id as id_course',
            'institution.name as institute',
            'institution.ruc as ruc_institute',
            'catalogue_parallel.name as parallel',
            'courses.name as name_course',
            'courses.code as code_course',
            'catalogue_area.name as area',
            'plan.date_start',
            'plan.date_end',
            'users.id as id_user',
            'users.first_name as instructor_name',
            'users.second_name as instructor_secondname',
            'users.first_lastname as instructor_lastname',
            'users.second_lastname as instructor_secondlastname',
            'instructor.id as id_instructor',
            'planification_instructor.code_certificate',
            'planification_instructor.location_certificate',
            'catalogue_gender.name as gender',
            'users.birthdate',
            'users.email',
            'users.identification'
        )


            ->join('cecy.catalogues as catalogue_area', 'courses.area_id', '=', 'catalogue_area.id')
            ->join('cecy.setec_planifications as plan', 'plan.course_id', '=', 'courses.id')
            ->join('cecy.institutions as institution', 'institution.id', '=', 'plan.institution_id')
            ->join('cecy.planification_instructors as planification_instructor', 'plan.planification_instructor_id', '=', 'planification_instructor.id')
            ->join('cecy.instructors as instructor', 'planification_instructor.instructor_id', '=', 'instructor.id')            
            ->join('authentication.users as users', 'instructor.user_id', '=', 'users.id')
            ->join('ignug.catalogues as catalogue_gender', 'users.gender_id', '=', 'catalogue_gender.id')
            ->join('cecy.catalogues as catalogue_parallel', 'plan.parallel', '=', 'catalogue_parallel.id')
            ->where('courses.id', $course)
            ->get();



        $authorities_firm = Instructor::select(
            'planification_instructor.id as id_planification_instructor',
            'planification_instructor.main_firm_id as id_main_firm',
            'main_user.first_name as main_first_name',
            'main_user.second_name as main_second_name',
            'main_user.first_lastname as main_first_lastname',
            'main_user.second_lastname as main_second_lastname',
            'catalogue_main.name as main_position',
            'planification_instructor.secondary_firm_id as id_secondary_firm',
            'secondary_user.first_name as second_first_name',
            'secondary_user.second_name as second_second_name',
            'secondary_user.first_lastname as second_first_lastname',
            'secondary_user.second_lastname as second_second_lastname',
            'catalogue_secondary.name as second_position',
        )
            ->join('cecy.planification_instructors as planification_instructor', 'planification_instructor.instructor_id', '=', 'instructors.id')
            ->join('cecy.setec_planifications as planifications', 'planifications.planification_instructor_id', '=', 'planification_instructor.id')
            ->join('cecy.authorities as main_authoritie', 'main_authoritie.id', '=', 'planification_instructor.main_firm_id')
            ->join('cecy.authorities as secondary_authoritie', 'secondary_authoritie.id', '=', 'planification_instructor.secondary_firm_id')
            ->join('authentication.users as main_user', 'main_authoritie.user_id', '=', 'main_user.id')
            ->join('authentication.users as secondary_user', 'secondary_authoritie.user_id', '=', 'secondary_user.id')
            ->join('cecy.catalogues as catalogue_main', 'main_authoritie.position_id', '=', 'catalogue_main.id')
            ->join('cecy.catalogues as catalogue_secondary', 'secondary_authoritie.position_id', '=', 'catalogue_secondary.id')
            ->where('planifications.course_id', $course)
            ->get();



        return response()->json(
            [
                'data' => [
                    'course_detail' => $course_info,
                    'authorities_firm' => $authorities_firm
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course Cecy',
                    'code' => '200',
                ]
            ],
            200
        );
    }


    public function setec_curso_index($course)
    {

        $course_info = Course::select(
            'courses.id as id_course',
            'courses.code',
            'courses.name as course',
            'institutions.name as institute',
            'institutions.ruc',
            'users.first_name as name_authority',
            'users.first_lastname as lastname_authority'
        )
            ->join('cecy.setec_planifications as plan', 'courses.id', '=', 'plan.course_id')
            ->join('cecy.institutions as institutions', 'plan.institution_id', '=', 'institutions.id')
            ->join('cecy.authorities as authorities', 'authorities.id', '=', 'institutions.authorities_id')
            ->join('authentication.users as users', 'users.id', '=', 'authorities.user_id')
            ->where('courses.id', $course)
            ->get();



        $course_aproved = Registration::select(
            'users.identification',
            'users.first_name',
            'users.first_lastname',
            'detail_registrations.code_certificate',
            'detail_registrations.id as id_detail_registration',
            'detail_registrations.location_certificate',
            'users.birthdate',
            'nacionality_participant.name as nationality',
            'gender_participant.name as gender',
            'detail_participants.participant_works',
            'course.name as name_course',
            'course.facilities as enfoque',
            'course.duration as duration_course',
            'modality_course.name as modality',
            'planification.date_start as start_date_course',
            'planification.date_end as end_date_course',
            'canton_dictate.name as canton_course',
            'province_dictate.name as province_course',
            'users_subscribe_certificate.first_name as name_subscribe_certificate',
            'users_subscribe_certificate.first_lastname as lastname_subscribe_certificate',
            'users_subscribe_certificate.identification as identification_subscribe_certificate'
        )
            ->join('cecy.participants as participants', 'registrations.participant_id', '=', 'participants.id')
            ->join('cecy.setec_detail_registrations as detail_registrations', 'detail_registrations.registration_id', '=', 'registrations.id')
            ->join('authentication.users as users', 'participants.user_id', '=', 'users.id')
            ->join('cecy.setec_planifications as planification', 'planification.id', '=', 'registrations.planification_id')
            ->join('cecy.courses as course', 'course.id', '=', 'planification.course_id')
            ->join('cecy.detail_participants as detail_participants', 'detail_participants.participant_id', '=', 'participants.id')
            ->join('cecy.authorities as authorities', 'authorities.id', '=', 'planification.autority_subscribe_certificate')
            ->join('authentication.users as users_subscribe_certificate', 'users_subscribe_certificate.id', '=', 'authorities.user_id')
            ->join('cecy.catalogues as canton_dictate', 'course.canton_dictate_id', '=', 'canton_dictate.id')
            ->join('cecy.catalogues as province_dictate', 'province_dictate.id', '=', 'canton_dictate.parent_code_id')
            ->join('ignug.catalogues as gender_participant', 'gender_participant.id', '=', 'users.gender_id')
            ->join('cecy.catalogues as modality_course', 'modality_course.id', '=', 'course.modality_id')
            ->join('ignug.catalogues as nacionality_participant', 'nacionality_participant.id', '=', 'users.nationality')


            ->where('course.id', $course)
            ->where('detail_registrations.status_id', 282)
            ->where('detail_registrations.final_grade', '>=', 70)
            ->get();




        return response()->json(
            [
                'data' => [
                    'course_detail' => $course_info,
                    'course_participant' => $course_aproved,
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Firm Certificate',
                    'code' => '200',
                ]
            ],
            200
        );
    }



    public function participant_curso_index($id_user)
    {

        $course_participant_info = Course::select(
            'courses.id as id_course',
            'courses.name as course',
            'planifications.date_start',
            'planifications.date_end',
            'detail_registrations.code_certificate',
            'detail_registrations.location_certificate'
        )
            ->join('cecy.planifications as planifications', 'planifications.course_id', '=', 'courses.id')
            ->join('cecy.registrations as registrations', 'registrations.planification_id', '=', 'planifications.id')
            ->join('cecy.detail_registrations as detail_registrations', 'detail_registrations.registration_id', '=', 'registrations.id')
            ->join('cecy.participants as participants', 'participants.id', '=', 'registrations.participant_id')
            ->join('authentication.users as users', 'users.id', '=', 'participants.user_id')
            ->where('users.id', $id_user)
            ->where('courses.state_id', 2)
            ->where('detail_registrations.status_id', 282)
            ->where('detail_registrations.final_grade', '>=', 70)
            ->get();


        $course_instructor_info = PlanificationInstructor::select(
            'courses.id as id_course',
            'courses.name as course',
            'planifications.date_start',
            'planifications.date_end',
            'planification_instructors.code_certificate',
            'planification_instructors.location_certificate'
        )
            ->join('cecy.instructors', 'instructors.id', '=', 'planification_instructors.instructor_id')
            ->join('authentication.users', 'users.id', '=', 'instructors.user_id')
            ->join('cecy.planifications', 'planifications.planification_instructor_id', '=', 'planification_instructors.id')
            ->join('cecy.courses', 'planifications.course_id', '=', 'courses.id')
            ->where('users.id', $id_user)
            ->where('courses.state_id', 2)
            ->get();
        
        $course_instructor_setec_info = PlanificationInstructor::select(
            'courses.id as id_course',
            'courses.name as course',
            'setec_planifications.date_start',
            'setec_planifications.date_end',
            'planification_instructors.code_certificate',
            'planification_instructors.location_certificate'
        )
            ->join('cecy.instructors', 'instructors.id', '=', 'planification_instructors.instructor_id')
            ->join('authentication.users', 'users.id', '=', 'instructors.user_id')
            ->join('cecy.setec_planifications', 'setec_planifications.planification_instructor_id', '=', 'planification_instructors.id')
            ->join('cecy.courses', 'setec_planifications.course_id', '=', 'courses.id')
            ->where('users.id', $id_user)
            ->where('courses.state_id', 2)
            ->get();

       


        return response()->json(
            [
                'data' => [
                    'course_participant' => $course_participant_info,
                    'course_instructor' => $course_instructor_info,
                    'course_instructor_setec' => $course_instructor_setec_info,
                ],
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'course_participant',
                    'code' => '200',
                ]
            ],
            200
        );
    }
    

    //funcion para subir archivos a laravel

    public function uploadimage(Request $request)
    {
        $data = $request->all();
        //dd($request->all());
        if ($request->hasFile('image')) {
            $file      = $request->file('image');
            $filename  = $file->getClientOriginalName();
            $extension = $file->getClientOriginalExtension();
            $picture   = date('Ymd') . '-' .date('His') . '-' . $filename;
            $file->move(storage_path('app/public/file'), $picture);

            $data_update_setecdetailregistration = [
                'code_certificate' => $request['code_setec_certificate'],
                'location_certificate' => url('/') . '/storage/file/' . $picture,
                'status_certificate_id' => 291,
                'certificate_withdrawn' => date("Y/m/d")
            ];
            SetecDetailRegistration::where('id', $request['id_detail_registration'])->update($data_update_setecdetailregistration);

            return response()->json([
                'data' => "True",
                'msg' => [
                    'summary' => 'success',
                    'detail' => 'Course_Participants',
                    'code' => '200',
                ]
            ], 200);

        } else {
            return response()->json(["message" => "False"]);
        }
    }
}
