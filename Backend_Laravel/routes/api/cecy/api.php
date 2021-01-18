<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['prefix' => 'academic_record'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\AcademicRecordController');
      Route::get('filter', 'Cecy\AcademicRecordController@filter');
      Route::get("{user_id}", "Cecy\AcademicRecordController@userAcademicRecord");
      Route::put("{id}", "Cecy\AcademicRecordController@update");
      Route::delete('{id}', "Cecy\AcademicRecordController@destroy");
   //});
});

Route::group(['prefix' => 'agreement_company'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\AgreementCompanyController');
      Route::get('filter', 'Cecy\AgreementCompanyController@filter');
      Route::put("{id}", "Cecy\AgreementCompanyController@update");
      Route::delete('{id}', "Cecy\AgreementCompanyController@destroy");
   //});
});

Route::group(['prefix' => 'agreements'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\AgreementsController');
      Route::get('filter', 'Cecy\AgreementsController@filter');
      Route::put("{id}", "Cecy\AgreementsController@update");
      Route::delete('{id}', "Cecy\AgreementsController@destroy");
   //});
});

Route::group(['prefix' => 'catalogues'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
       Route::get('', 'Cecy\CatalogueController@filter');
   //});
});

Route::group(['prefix' => 'courses'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\CourseController');
      Route::get('filter', 'Cecy\CourseController@filter');
      Route::put("{id}", "Cecy\CourseController@update");
      Route::delete('{id}', "Cecy\CourseController@destroy");
   //});
});

Route::group(['prefix' => 'course_instructor'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\CourseInstructorController');
      Route::get('filter', 'Cecy\CourseInstructorController@filter');
      Route::put("{id}", "Cecy\CourseInstructorController@update");
      Route::delete('{id}', "Cecy\CourseInstructorController@destroy");
   //});
});

Route::group(['prefix' => 'course_requirement'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\CourseRequirementController');
      Route::get('filter', 'Cecy\CourseRequirementController@filter');
      Route::put("{id}", "Cecy\CourseRequirementController@update");
      Route::delete('{id}', "Cecy\CourseRequirementController@destroy");
   //});
});

Route::group(['prefix' => 'course_content'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\CoursesContentController');
      Route::get('filter', 'Cecy\CoursesContentController@filter');
      Route::put("{id}", "Cecy\CoursesContentController@update");
      Route::delete('{id}', "Cecy\CoursesContentController@destroy");
   //});
});

Route::group(['prefix' => 'department_data'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\DepartmentDataController');
      Route::get('filter', 'Cecy\DepartmentDataController@filter');
      Route::put("{id}", "Cecy\DepartmentDataController@update");
      Route::delete('{id}', "Cecy\DepartmentDataController@destroy");
   //});
});

Route::group(['prefix' => 'detail_registration'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\DetailRegistrationController');
      Route::get('filter', 'Cecy\DetailRegistrationController@filter');
      Route::put("{id}", "Cecy\DetailRegistrationController@update");
      Route::delete('{id}', "Cecy\DetailRegistrationController@destroy");
   //});
});

Route::group(['prefix' => 'person_prerequisites_course'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\PersonPrerequisitesCourseController');
      Route::get('filter', 'Cecy\PersonPrerequisitesCourseController@filter');
      Route::put("{id}", "Cecy\PersonPrerequisitesCourseController@update");
      Route::delete('{id}', "Cecy\PersonPrerequisitesCourseController@destroy");
   //});
});


Route::group(['prefix' => 'planification'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\PlanificationController');
      Route::get('filter', 'Cecy\PlanificationController@filter');
      Route::put("{id}", "Cecy\PlanificationController@update");
      Route::delete('{id}', "Cecy\PlanificationController@destroy");
   //});
});

Route::group(['prefix' => 'profile_instructor_course'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\ProfileInstructorCourseController');
      Route::get('filter', 'Cecy\ProfileInstructorCourseController@filter');
      Route::put("{id}", "Cecy\ProfileInstructorCourseController@update");
      Route::delete('{id}', "Cecy\ProfileInstructorCourseController@destroy");
   //});
});

Route::group(['prefix' => 'proposal_courses'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\ProposalCoursesController');
      Route::get('filter', 'Cecy\ProposalCoursesController@filter');
      Route::put("{id}", "Cecy\ProposalCoursesController@update");
      Route::delete('{id}', "Cecy\ProposalCoursesController@destroy");
   //});
});


Route::group(['prefix' => 'proposed_requirement'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\ProposedRequirementController');
      Route::get('filter', 'Cecy\ProposedRequirementController@filter');
      Route::put("{id}", "Cecy\ProposedRequirementController@update");
      Route::delete('{id}', "Cecy\ProposedRequirementController@destroy");
   //});
});

Route::group(['prefix' => 'registration'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\RegistrationController');
      Route::get('filter', 'Cecy\RegistrationController@filter');
      Route::put("{id}", "Cecy\RegistrationController@update");
      Route::delete('{id}', "Cecy\RegistrationController@destroy");
   //});
});

Route::group(['prefix' => 'schedule'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\ScheduleController');
      Route::get('filter', 'Cecy\ScheduleController@filter');
      Route::put("{id}", "Cecy\ScheduleController@update");
      Route::delete('{id}', "Cecy\ScheduleController@destroy");
   //});
});

Route::group(['prefix' => 'school_period'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\SchoolPeriodController');
      Route::get('filter', 'Cecy\SchoolPeriodController@filter');
      Route::put("{id}", "Cecy\SchoolPeriodController@update");
      Route::delete('{id}', "Cecy\SchoolPeriodController@destroy");
   //});
});

Route::group(['prefix' => 'subtopics_course'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\SubtopicsCourseController');
      Route::get('filter', 'Cecy\SubtopicsCourseController@filter');
      Route::put("{id}", "Cecy\SubtopicsCourseController@update");
      Route::delete('{id}', "Cecy\SubtopicsCourseController@destroy");
   //});
});

Route::group(['prefix' => 'target_group'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\TargetGroupController');
      Route::get('filter', 'Cecy\TargetGroupController@filter');
      Route::put("{id}", "Cecy\TargetGroupController@update");
      Route::delete('{id}', "Cecy\TargetGroupController@destroy");
   //});
});

Route::group(['prefix' => 'working_information'], function () {
   //Route::group(['middleware' => 'auth:api'], function () {
      Route::apiResource('', 'Cecy\WorkingInformationController');
      Route::get('filter', 'Cecy\WorkingInformationController@filter');
      Route::put("{id}", "Cecy\WorkingInformationController@update");
      Route::delete('{id}', "Cecy\WorkingInformationController@destroy");
   //});
});
