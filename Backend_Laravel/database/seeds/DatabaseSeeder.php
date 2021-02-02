<?php

use Illuminate\Database\Seeder;
use App\Models\Ignug\State;
use App\Models\Attendance\Catalogue as AttendanceCatalogue;
use App\Models\Ignug\Catalogue as IgnugCatalogue;
use App\Models\Ignug\Location as IgnugLocation;
use App\Models\Ignug\Institution as IgnugInstitution;
use App\Models\Cecy\Institution as CecyInstitution;
use App\Models\Ignug\Career as IgnugCareer;
use App\Role;
use App\User;
use App\Models\Ignug\Teacher;
use App\Models\Cecy\Authority;
use App\Models\JobBoard\Professional;
use App\Models\JobBoard\AcademicFormation;
use App\Models\JobBoard\Course;
use App\Models\JobBoard\ProfessionalReference;
use App\Models\JobBoard\ProfessionalExperience;
use App\Models\JobBoard\Language;
use App\Models\JobBoard\Ability;
use App\Models\JobBoard\Category;
use App\Models\JobBoard\Company;
use App\Models\JobBoard\Offer;
use App\Models\JobBoard\Catalogue as JobBoardCatalogue;
use App\Models\JobBoard\Location as JobBoardLocation;
use Faker\Generator as Faker;
use App\Models\Cecy\Catalogue as CecyCatalogue;
use App\Models\Cecy\Registration as CecyRegistration;
use App\Models\Cecy\SetecRegistration as CecySetecRegistration;
use App\Models\Cecy\DetailRegistration as CecyDetailRegistration;
use App\Models\Cecy\SetecDetailRegistration;
use App\Models\Cecy\Course as CecyCourse;
use App\Models\Cecy\Topic as CecyTopic;
use App\Models\Cecy\Planification;
use App\Models\Cecy\SetecPlanification as SetecPlanification;
use App\Models\Cecy\Schedule;
use App\Models\Cecy\AcademicRecord;
use App\Models\Cecy\SchoolPeriod;
use App\Models\Cecy\Instructor;
use App\Models\Cecy\Participant as CecyParticipant;
use App\Models\Cecy\DetailParticipant as CecyParticipantDetail;
use phpDocumentor\Reflection\Types\True_;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $faker = new Faker();
        // States
        factory(State::class)->create([
            'code' => '1',
            'name' => 'ACTIVE',
            'state' => 1,
        ]);
        factory(State::class)->create([
            'code' => '2',
            'name' => 'INACTIVE',
            'state' => 1,
        ]);
        factory(State::class)->create([
            'code' => '3',
            'name' => 'DELETED',
            'state' => 1,
        ]);

        // Catalogues
        // Workday Principal
        factory(AttendanceCatalogue::class)->create([
            'code' => 'work',
            'name' => 'Jornada',
            'type' => 'workdays.principal',
            'icon' => 'pi pi-calendar',
        ]);

        // Workday Secundary
        factory(AttendanceCatalogue::class)->create([
            'code' => 'lunch',
            'name' => 'Almuerzo',
            'type' => 'workdays.secondary',
            'icon' => 'pi pi-briefcase',
        ]);

        // Task Processes
        factory(AttendanceCatalogue::class, 1)->create(
            [
                'code' => 'academic',
                'type' => 'tasks.process',
                'icon' => 'pi pi-calendar',
            ]
        )->each(function ($catalogue) {
            for ($i = 0; $i < 20; $i++) {
                $catalogue->children()->save(factory(AttendanceCatalogue::class)->make(
                    [
                        'code' => $i,
                        'type' => 'tasks.activity',
                        'icon' => 'pi pi-calendar',
                    ]
                ));
            }
        });

        factory(AttendanceCatalogue::class, 1)->create(
            [
                'code' => 'administrative',
                'type' => 'tasks.process',
                'icon' => 'pi pi-calendar',
            ]
        )->each(function ($catalogue) {
            for ($i = 0; $i < 20; $i++) {
                $catalogue->children()->save(factory(AttendanceCatalogue::class)->make(
                    [
                        'code' => $i,
                        'type' => 'tasks.activity',
                        'icon' => 'pi pi-calendar',
                    ]
                ));
            }
        });

        factory(AttendanceCatalogue::class, 1)->create(
            [
                'code' => 'entailment',
                'type' => 'tasks.process',
                'icon' => 'pi pi-calendar',
            ]
        )->each(function ($catalogue) {
            for ($i = 0; $i < 20; $i++) {
                $catalogue->children()->save(factory(AttendanceCatalogue::class)->make(
                    [
                        'code' => $i,
                        'type' => 'tasks.activity',
                        'icon' => 'pi pi-calendar',
                    ]
                ));
            }
        });

        factory(AttendanceCatalogue::class, 1)->create(
            [
                'code' => 'investigation',
                'type' => 'tasks.process',
                'icon' => 'pi pi-calendar',
            ]
        )->each(function ($catalogue) {
            for ($i = 0; $i < 20; $i++) {
                $catalogue->children()->save(factory(AttendanceCatalogue::class)->make(
                    [
                        'code' => $i,
                        'type' => 'tasks.activity',
                        'icon' => 'pi pi-calendar',
                    ]
                ));
            }
        });

        // Ethnic origin
        for ($i = 0; $i < 20; $i++) {
            factory(IgnugCatalogue::class)->create([
                'code' => $i,
                'type' => 'users.ethnic_origin',
            ]);
        }
        // Sex
        factory(IgnugCatalogue::class)->create([
            'code' => '1',
            'name' => 'HOMBRE',
            'type' => 'users.sex',
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '2',
            'name' => 'MUJER',
            'type' => 'users.sex',
        ]);
        // Gender
        factory(IgnugCatalogue::class)->create([
            'code' => '1',
            'name' => 'MASCULINO',
            'type' => 'users.gender',
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '2',
            'name' => 'FEMENINO',
            'type' => 'users.gender',
        ]);

        // Indetification Type
        factory(IgnugCatalogue::class)->create([
            'code' => '1',
            'name' => 'CEDULA',
            'type' => 'users.identification_type',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '2',
            'name' => 'PASAPORTE',
            'type' => 'users.identification_type',
            'state_id' => 1,
        ]);

        // Blood Type
        factory(IgnugCatalogue::class)->create([
            'code' => '1',
            'name' => 'A+',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '2',
            'name' => 'A-',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '3',
            'name' => 'B+',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '4',
            'name' => 'B-',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '5',
            'name' => 'AB+',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '6',
            'name' => 'AB-',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '7',
            'name' => 'O+',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '8',
            'name' => 'O-',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);

        // career modality
        factory(IgnugCatalogue::class)->create([
            'code' => '1',
            'name' => 'PRESENCIAL',
            'type' => 'career_modality',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '2',
            'name' => 'SEMI-PRESENCIAL',
            'type' => 'career_modality',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '3',
            'name' => 'DISTANCIA',
            'type' => 'career_modality',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '4',
            'name' => 'DUAL',
            'type' => 'career_modality',
            'state_id' => 1,
        ]);

        // career type
        factory(IgnugCatalogue::class)->create([
            'code' => '1',
            'name' => 'TECNICATURA',
            'type' => 'career_type',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '2',
            'name' => 'TECNOLOGIA',
            'type' => 'career_type',
            'state_id' => 1,
        ]);
        factory(IgnugCatalogue::class)->create([
            'code' => '2',
            'name' => 'ECUATORIANO/A',
            'type' => 'nationality_type',
            'state_id' => 1,
        ]);

        factory(IgnugCatalogue::class)->create([
            'code' => '2',
            'name' => 'COLOMBIANO/A',
            'type' => 'nationality_type',
            'state_id' => 1,
        ]);

        // location
        for ($i = 0; $i < 2; $i++) {
            factory(IgnugLocation::class)->create([
                'type' => 'users.country',
            ])->each(function ($location) {
                for ($j = 0; $j < 2; $j++) {
                    $location->children()->save(factory(IgnugLocation::class)->make(
                        [
                            'type' => 'users.state',
                        ]
                    ));
                }
            });
        }
        factory(Category::class, 100)->create();
        factory(JobBoardCatalogue::class, 100)->create();
        factory(JobBoardLocation::class, 100)->create();

        // Institutes
        factory(IgnugInstitution::class)->create([
            'code' => 'ITSBJ',
            'name' => 'BENITO JUAREZ',
            'slogan' => 'Instituto Tecnologico Superior Benito Juarez',
            'state_id' => '1',
        ]);
        factory(IgnugInstitution::class)->create([
            'code' => 'ITS24M',
            'name' => '24 DE MAYO',
            'slogan' => 'Instituto Tecnologico Superior 24 de Mayo',
            'state_id' => '1',
        ]);
        factory(IgnugInstitution::class)->create([
            'code' => 'YEC',
            'name' => 'YAVIRAC ENGLISH CENTER - CENEPA',
            'slogan' => 'Centro de idiomas yavirac',
            'state_id' => '1',
        ]);


        

        

        // Career
        factory(IgnugCareer::class)->create([
            'institution_id' => '1',
            'code' => '1',
            'name' => 'DESARROLLO DE SOFTWARE',
            'description' => 'Carrera de fase dual',
            'modality_id' => '38',
            'resolution_number' => 'null',
            'title' => 'DESARROLLO DE SOFTWARE',
            'acronym' => 'DDS',
            'type_id' => '40',
            'state_id' => '1',
        ]);

        factory(IgnugCareer::class)->create([
            'institution_id' => '2',
            'code' => '1',
            'name' => 'MARKETING Y VENTAS',
            'description' => 'Carrera de marketing y negocios y finanzas',
            'modality_id' => '35',
            'resolution_number' => 'null',
            'title' => 'MARKETING Y VENTAS',
            'acronym' => 'M',
            'type_id' => '40',
            'state_id' => '1',
        ]);

        factory(IgnugCareer::class)->create([
            'institution_id' => '2',
            'code' => '1',
            'name' => 'ARTE CULINARIO',
            'description' => 'Carrera de arte culinario y resetario internacional',
            'modality_id' => '35',
            'resolution_number' => 'null',
            'title' => 'ARTE CULINARIO',
            'acronym' => 'AC',
            'type_id' => '39',
            'state_id' => '1',
        ]);

        factory(IgnugCareer::class)->create([
            'institution_id' => '3',
            'code' => '1',
            'name' => 'YAVIRAC ENGLISH CENTER',
            'description' => 'Centro de idiomas Yavirac, heroes del cenepa',
            'modality_id' => '35',
            'resolution_number' => 'null',
            'title' => 'YAVIRAC ENGLISH CENTER',
            'acronym' => 'YAC',
            'type_id' => '39',
            'state_id' => '1',
        ]);


        // roles system
        // factory(IgnugCatalogue::class)->create([
        //     'code' => 'attendance',
        //     'name' => 'Attendance',
        //     'type' => 'roles.system',
        // ])->each(function ($system) {
        //     factory(Role::class)->create([
        //         'code' => '1',
        //         'name' => 'DOCENTE',
        //         'system_id' => $system->id,
        //     ])->each(function ($role) {
        //         $user = factory(User::class)->create([
        //             'user_name' => '1234567891',
        //         ]);
        //         $user->teacher()->save(factory(Teacher::class)->make());
        //         $user->roles()->attach($role->id);
        //     });
        //     factory(Role::class)->create([
        //         'code' => '2',
        //         'name' => 'ADMINISTRATIVO',
        //         'system_id' => $system->id,
        //     ])->each(function ($role) {
        //         $user = factory(User::class)->create([
        //             'user_name' => '1234567892',
        //         ]);
        //         $user->teacher()->save(factory(Teacher::class)->make());
        //         $user->roles()->attach($role->id);
        //     });
        // });

        // factory(IgnugCatalogue::class)->create([
        //     'code' => 'attendance',
        //     'name' => 'Attendance',
        //     'type' => 'roles.system',
        // ])->each(function ($system) {
        //     factory(Role::class)->create([
        //         'code' => '1',
        //         'name' => 'DOCENTE',
        //         'system_id' => $system->id,
        //     ])->each(function ($role) {
        //         $user = factory(User::class)->create([
        //             'user_name' => '1234567891',
        //         ]);
        //         $user->teacher()->save(factory(Teacher::class)->make());
        //         $user->roles()->attach($role->id);
        //     });
        //     factory(Role::class)->create([
        //         'code' => '2',
        //         'name' => 'ADMINISTRATIVO',
        //         'system_id' => $system->id,
        //     ])->each(function ($role) {
        //         $user = factory(User::class)->create([
        //             'user_name' => '1234567892',
        //         ]);
        //         $user->teacher()->save(factory(Teacher::class)->make());
        //         $user->roles()->attach($role->id);
        //     });
        // });

        // factory(IgnugCatalogue::class)->create([
        //     'code' => 'jobboard',
        //     'name' => 'JobBoard',
        //     'type' => 'roles.system',
        // ])->each(function ($system) {
        //     factory(Role::class)->create([
        //         'code' => '1',
        //         'name' => 'PROFESSIONAL',
        //         'system_id' => $system->id,
        //     ])->each(function ($role) {
        //         $user = factory(User::class)->create([
        //             'user_name' => '1234567892',
        //         ]);
        //         $professional = $user->professional()->save(factory(Professional::class)->make());
        //         $professional->academicFormations()->save(factory(AcademicFormation::class)->make());
        //         $professional->abilities()->save(factory(Ability::class)->make());
        //         $professional->languages()->save(factory(Language::class)->make());
        //         $professional->courses()->save(factory(Course::class)->make());
        //         $professional->professionalExperiences()->save(factory(ProfessionalExperience::class)->make());
        //         $professional->professionalReferences()->save(factory(ProfessionalReference::class)->make());
        //         $user->roles()->attach($role->id);
        //     });
        //     factory(Role::class)->create([
        //         'code' => '2',
        //         'name' => 'COMPANY',
        //         'system_id' => $system->id,
        //     ])->each(function ($role) {
        //         $user = factory(User::class)->create([
        //             'user_name' => '1234567894',
        //         ]);
        //         $company = $user->company()->save(factory(Company::class)->make());
        //         $offer = $company->offers()->save(factory(Offer::class)->make());
        //         $offer->categories()->attach(random_int(1, 100));
        //         $offer->professionals()->attach(random_int(1, 1));
        //         $company->professionals()->attach(random_int(1, 1));
        //         $user->roles()->attach($role->id);
        //     });
        // });

        // factory(IgnugCatalogue::class)->create([
        //     'code' => 'web',
        //     'name' => 'Web',
        //     'type' => 'roles.system',
        // ])->each(function ($system) {
        //     factory(Role::class)->create([
        //         'code' => '1',
        //         'name' => 'ADMINISTRATOR',
        //         'system_id' => $system->id,
        //     ])->each(function ($role) {
        //         $user = factory(User::class)->create([
        //             'user_name' => '1234567895',
        //         ]);
        //         $user->roles()->attach($role->id);
        //     });
        // });


        //SCHEMA CECY SEEDS -------------------------------------------------------
        // areas
        factory(CecyCatalogue::class)->create([
            'code' => 'A',
            'name' => 'ADMINISTRACIÓN Y LEGISLACIÓN',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'B',
            'name' => 'AGRONOMÍA',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'C',
            'name' => 'ZOOTECNIA',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'D',
            'name' => 'ALIMENTACIÓN, GASTRONOMÍA Y TURISMO',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'E',
            'name' => 'TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'F',
            'name' => 'FINANZAS, COMERCIO Y VENTAS',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'H',
            'name' => 'CONSTRUCCIÓN E INFRAESTRUCTURA',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'I',
            'name' => 'FORESTAL, ECOLOGÍA Y AMBIENTE',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'J',
            'name' => 'EDUCACIÓN Y CAPACITACIÓN',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'K',
            'name' => 'ELECTRICIDAD Y ELECTRÓNICA',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'L',
            'name' => 'ESPECIES ACUÁTICAS Y PESCA',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'M',
            'name' => 'COMUNICACIÓN Y ARTES GRÁFICAS',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'N',
            'name' => 'MECÁNICA AUTOMOTRIZ',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'O',
            'name' => 'MECÁNICA INDUSTRIAL Y MINERÍA',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'P',
            'name' => 'PROCESOS INDUSTRIALES',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'Q',
            'name' => 'TRANSPORTE Y LOGÍSTICA',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'R',
            'name' => 'ARTES Y ARTESANÍA',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'S',
            'name' => 'SERVICIOS SOCIOCULTURALES Y A LA COMUNIDAD',
            'type' => 'areas',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'T',
            'name' => 'INDUSTRIA AGROPECUARIA ',
            'type' => 'areas',
            'state_id' => 1,
        ]);

        // participant_type
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Adultos',
            'type' => 'participant_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Estudiantes',
            'type' => 'participant_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Profesores',
            'type' => 'participant_type',
            'state_id' => 1,
        ]);

        // modality
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'PRESENCIAL',
            'type' => 'modality',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'DUAL',
            'type' => 'modality',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'VIRTUAL',
            'type' => 'modality',
            'state_id' => 1,
        ]);

        // levels
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Primero',
            'type' => 'levels',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Segundo',
            'type' => 'levels',
            'state_id' => 1,
        ]);

        // schedule
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => '13:00 - 15:00',
            'type' => 'schedule',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => '15:00 - 17:00',
            'type' => 'schedule',
            'state_id' => 1,
        ]);

        // course_type
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Administrativo',
            'type' => 'course_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Técnico',
            'type' => 'course_type',
            'state_id' => 1,
        ]);

        // academic_period
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'PRIMERO',
            'type' => 'academic_period',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'SEGUNDO',
            'type' => 'academic_period',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'TERCERO',
            'type' => 'academic_period',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'CUARTO',
            'type' => 'academic_period',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'QUINTO',
            'type' => 'academic_period',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'SEXTO',
            'type' => 'academic_period',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'SEPTIMO',
            'type' => 'academic_period',
            'state_id' => 1,
        ]);

        // specialty
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 1,
            'code' => 'A.1',
            'name' => 'Administración General (Pública, Empresas, Microempresas, Cooperativas, Aduanera, Agrícola, Agropecuaria, Agroindustrial, Bancaria, Financiera, Forestal, Hospitalaria, Hotelera, Inmobiliaria, Pesquera, Minera, Etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 1,
            'code' => 'A.2',
            'name' => 'Gestión del Talento Humano (Manejo de Personal, Desempeño, Motivación, Liderazgo, Coaching, Trabajo en Equipo, Selección por Competencias, Plan Interno de Carrera, Comunicación Organizacional, Profesiogramas)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 1,
            'code' => 'A.3',
            'name' => 'Administración Contable y de Costos (Matemática Financiera, Estadística, Tributaria, Normas de Contabilidad, Auditorías Financieras, Contables, de Costos y Relacionadas, Normas Internacionales de Información Financiera Niif)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 1,
            'code' => 'A.4',
            'name' => 'Evaluación de Proyectos (Económica, Financiera)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 1,
            'code' => 'A.5',
            'name' => 'Atención y Servicios de Oficina: Secretariado (Operación de Máquinas de Oficina, Taquigrafía, Lectura Rápida, Oratoria, Redacción Y Ortografía), Recepción, Servicio al Cliente, Archivo, Conserjería, Limpieza. Relaciones Humanas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 1,
            'code' => 'A.6',
            'name' => 'Legislación (Aduanera, Negociación, Mediación, Arbitraje, Patentes, Propiedad Intelectual, Tributaria, Laboral, Previsión Social, Agrícola, Financiera, Etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 1,
            'code' => 'A.7',
            'name' => 'Gestión de la Calidad (Normas, Auditorías de Sistemas de Calidad y Mejoramiento Continuo)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 2,
            'code' => 'B.1',
            'name' => 'Agricultura Orgánica',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 2,
            'code' => 'B.2',
            'name' => 'Semillas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 2,
            'code' => 'B.3',
            'name' => 'Semillas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 2,
            'code' => 'B.4',
            'name' => 'Cultivos (Siembra, Cosecha, Postcosecha, Manejo Nutricional de las Plantas)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 2,
            'code' => 'B.5',
            'name' => 'Leguminosas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 2,
            'code' => 'B.7',
            'name' => 'Floricultura',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 2,
            'code' => 'B.8',
            'name' => 'Fruticultura',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 2,
            'code' => 'B.9',
            'name' => 'Jardinería y Poda',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 2,
            'code' => 'B.10',
            'name' => 'Horticultura',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 2,
            'code' => 'B.11',
            'name' => 'Sanidad Vegetal (Control Fitosanitario, Control de Plagas y Malezas)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 2,
            'code' => 'B.12',
            'name' => 'Suelos y Agua (Manejo de Insumos Agrícolas, Fertilizantes, Riego, Abonos)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 2,
            'code' => 'B.13',
            'name' => 'Viticultura y Enología',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 3,
            'code' => 'C.1',
            'name' => 'Sanidad Pecuaria (Veterinaria)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 3,
            'code' => 'C.6',
            'name' => 'Esquila (Ovejas, Conejos, Llamas, Cabras)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 3,
            'code' => 'C.9',
            'name' => 'Ganadería Mayor (Bovinos-leche/carne-,Ovino, Caprino, Camélido, Equinos)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 3,
            'code' => 'C.10',
            'name' => 'Ganadería Menor (Cuy, Conejo, Aves, Abejas, Anfibios, Moluscos, Porcinos, Anélidos)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 3,
            'code' => 'C.11',
            'name' => 'Helicicultura (Caracoles)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 3,
            'code' => 'C.12',
            'name' => 'Inseminación Artificial y Técnicas de Manejo Genético',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 3,
            'code' => 'C.15',
            'name' => 'Producción de Pastos',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 3,
            'code' => 'C.16',
            'name' => 'Alimentación de Rumiantes',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 3,
            'code' => 'C.17',
            'name' => 'Alimentación de Monogástricos',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 4,
            'code' => 'D.1',
            'name' => 'Elaboración, Tecnología y Producción de Alimentos (Higiene, Manipulación, Seguridad Alimentaria, Empaques, Etiquetado y Trazabilidad); y, Hazard.',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 4,
            'code' => 'D.2',
            'name' => 'Banquetería',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 4,
            'code' => 'D.3',
            'name' => 'Cocina Nacional e Internacional (Chef, Cocinero)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 4,
            'code' => 'D.4',
            'name' => 'Panadería y Pastelería',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 4,
            'code' => 'D.5',
            'name' => 'Repostería y Confitería',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 4,
            'code' => 'D.6',
            'name' => 'Catering y Servicio de Bar y Comedores (Barman, Mesero)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 4,
            'code' => 'D.7',
            'name' => 'Servicio de Recepción, Limpieza, Pisos y Afines (Recepcionista, Ama de Llaves, Botones, Camarera de Pisos, Encargado de Mantenimiento)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 4,
            'code' => 'D.8',
            'name' => 'Turismo (Ecoturismo, Agroturismo, Etnoturismo, Turismo de Aventura, Turismo Comunitario, Guía Nacional, Guía Especializado, Información, Organización y Coordinación de Eventos)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 4,
            'code' => 'D.9',
            'name' => 'Servicio de Agencias de Viaje (Operación, Transporte, Seguridad, Ventas, Operadores, Reservas)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 4,
            'code' => 'D.10',
            'name' => 'Diversificación de destinos y Desarrollo de Inclusión Comunitaria',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.1',
            'name' => 'Servicios Telemáticos y Generados de Valor Agregado',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.2',
            'name' => 'Telecomunicaciones (Comunicación Telefónica, Telegráfica, Satelital)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.3',
            'name' => 'Instalación, Mantenimiento y Reparación de Fibra Óptica',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.4',
            'name' => 'Enlace de datos',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.5',
            'name' => 'Transmisión, Emisión y Recepción de Información',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.6',
            'name' => 'Servicios de Comunicación en Voz y Datos',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.7',
            'name' => 'Base de Datos Relacional (Oracle, Sybase, Sql, Server, Db2, Access, Informix, Datacom, Unicenter Tng)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.7',
            'name' => 'Base de Datos Relacional (Oracle, Sybase, Sql, Server, Db2, Access, Informix, Datacom, Unicenter Tng)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.7',
            'name' => 'Base de Datos Relacional (Oracle, Sybase, Sql, Server, Db2, Access, Informix, Datacom, Unicenter Tng)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.8',
            'name' => 'Control de Calidad (Auditoría Computacional, Evaluación de Software, Sistemas de Seguridad)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.9',
            'name' => 'Hardware y Equipos (Arquitectura de Pc, Mantenimiento, Configuración)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.10',
            'name' => 'Internet E Intranet(Administración de Firewall, Correo Electrónico, Navegadores)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.11',
            'name' => 'Programas de Escritorio (Office, Hojas Electrónicas, Procesadores de Texto, Power Point), Computación Básica U Operación de Computadoras.',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.12',
            'name' => 'Software Especializado (Flex, Smartsuit, Autocad, Softland, Arc View, 3d)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.13',
            'name' => 'Redes (Comunidades de Redes Tecnológicas, Servicios, Protocolos, Señalización, Armado, Operación, Mantenimiento y Conectividad) ',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.14',
            'name' => 'Sistema Operativo (Ms-Dos, Windows 3xx, 95, 98, 2000, Vms, Computación  Básica u Operación de Comput, Solaris, Novell, Unix)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.15',
            'name' => 'Análisis de Sistemas ( Proyectos Informáticos, Problemas, Modelamiento de Información,  Reingeniería)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.16',
            'name' => 'Lenguaje de Programación (Pascal, Básic, Cobol, Visual Básic, C+++, Power Builder, Clipper, Java, PHP, Puntonet)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 5,
            'code' => 'E.17',
            'name' => 'Codificación y Decodificación de Señales en Medios de Comunicación',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 6,
            'code' => 'F.1',
            'name' => 'Marketing y Ventas (Negociación, Comercialización, Marketing y Ventas de Productos y Servicios)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 6,
            'code' => 'F.2',
            'name' => 'Comercio Exterior y Cambios',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 6,
            'code' => 'F.3',
            'name' => 'Comercio y Distribución Interna',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 6,
            'code' => 'F.4',
            'name' => 'Economía Aplicada',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 6,
            'code' => 'F.5',
            'name' => 'Crédito y Cobranzas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 6,
            'code' => 'F.6',
            'name' => 'Detección de Circulante y Documentos Falsos',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 6,
            'code' => 'F.7',
            'name' => 'Negocios y Comercio Electrónico',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 6,
            'code' => 'F.8',
            'name' => 'Mercado Financiero (Bolsa de Valores, Capitales, Monetarios, Futuros, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 6,
            'code' => 'F.9',
            'name' => 'Presupuestos y Flujo de Caja',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 6,
            'code' => 'F.10',
            'name' => 'Riesgo Financiero (Análisis, Solvencia, Liquidez, Endeudamiento, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 6,
            'code' => 'F.11',
            'name' => 'Seguros (Análisis, Costos, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 6,
            'code' => 'F.12',
            'name' => 'Trámites de exportación e Importación',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.1',
            'name' => 'Albañilería',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.2',
            'name' => 'Cañonería (Conducción de Agua, Gas, Petróleo)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.3',
            'name' => 'Carpintería de Obra Gruesa (Paneles, Puertas, Vigas, Ventanas)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.4',
            'name' => 'Gasfitería',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.5',
            'name' => 'Carpintería y Estructura Metálica',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.6',
            'name' => 'Hojalatería (Bajadas de Agua, Canales)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.7',
            'name' => 'Instalaciones Sanitarias (Alcantarillado, Gasfitería)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.8',
            'name' => 'Mantenimiento de Edificios y Acabados',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.9',
            'name' => 'Obras (Caminos, Puentes, Túneles)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.10',
            'name' => 'Enfierradura',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.11',
            'name' => 'Recubrimiento de Interiores y Exteriores (Pintura, Alfombra, Azulejos)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.13',
            'name' => 'Tecnología de la Construcción (Planos, Materiales, Estructuras, Equipos, Etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.14',
            'name' => 'Arquitectura y Urbanismo (Proyectos, Restauración de Edificios y Vivienda)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.15',
            'name' => 'Dibujo Técnico',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.16',
            'name' => 'Construcciones Rurales',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 7,
            'code' => 'H.17',
            'name' => 'Plomería',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.1',
            'name' => 'Contaminación Ambiental',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.2',
            'name' => 'Gestión e Impacto Ambiental',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.3',
            'name' => 'Manejo y Conservación de Recursos Naturales',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.4',
            'name' => 'Producción Limpia',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.5',
            'name' => 'Tratamiento de Residuos (Líquidos, Sólidos, Gaseosos)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.6',
            'name' => 'Remediación Ambiental',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.7',
            'name' => 'Economía Ambiental',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.8',
            'name' => 'Combate de Incendios Forestal',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.9',
            'name' => 'Plantación, Conservación y Explotación de especies forestales (Poda, Raleo Forestación, Reforestación, Agroforestería, Viveros)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.10',
            'name' => 'Sanidad  y Manejo Forestal',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.11',
            'name' => 'Silvicultura',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.12',
            'name' => 'Geofísica (Sismología, Meteorología, Climatología)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);

        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 8,
            'code' => 'I.13',
            'name' => 'Energías Alternativas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 9,
            'code' => 'J.1',
            'name' => 'Capacitación (Identificación de Necesidades, Procesos de Capacitación Continua y por Competencias Laborales, Evaluación y Seguimiento)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 9,
            'code' => 'J.2',
            'name' => 'Diseño Educativo y Curricular (Elaboración de Proyectos Educativos, Planes y Programas de Educación, Capacitación y Formación)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 9,
            'code' => 'J.3',
            'name' => 'Evaluación del Aprendizaje',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 9,
            'code' => 'J.4',
            'name' => 'Formación de Instructores, Facilitadores, Monitores, Maestros, Guías, Formadores',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 9,
            'code' => 'J.5',
            'name' => 'Medios y Materiales Didácticos (Diseño, Elaboración)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 9,
            'code' => 'J.6',
            'name' => 'Metodología y Técnica De Aprendizaje (Pre Básica, Básica, Media,  Diferencial, Adulto, Superior)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 9,
            'code' => 'J.7',
            'name' => 'Orientación Vocacional',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 10,
            'code' => 'K.1',
            'name' => 'Electricidad Domiciliaria (Reparación, Manejo y Mantenimiento)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 10,
            'code' => 'K.2',
            'name' => 'Electricidad  Automotriz',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 10,
            'code' => 'K.3',
            'name' => 'Electrodomésticos (Reparación, Manejo y Mantenimiento)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 10,
            'code' => 'K.4',
            'name' => 'Electromecánica (Instalación y Mantenimiento de Motores Eléctricos)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 10,
            'code' => 'K.5',
            'name' => 'Electrónica Industrial',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 10,
            'code' => 'K.6',
            'name' => 'Electrotecnia y Luminotecnia (Uso Industrial y Artístico del Sistema de Alumbrado, Voltaje, Resistencia)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 10,
            'code' => 'K.7',
            'name' => 'Instalación Telefónica (Reparación, Manejo y mantenimiento)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 10,
            'code' => 'K.8',
            'name' => 'Redes Eléctricas (Baja, Media y Alta Tensión, Instalaciones)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 10,
            'code' => 'K.9',
            'name' => 'Electricidad Industrial (Reparación, Manejo y Mantenimiento)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 10,
            'code' => 'K.10',
            'name' => 'Electrónica Automotriz (Inyección)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 11,
            'code' => 'L.1',
            'name' => 'Biología Marina (Selección Genética de Especies Acuáticas)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 11,
            'code' => 'L.2',
            'name' => 'Manejo de Especies Acuáticas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 11,
            'code' => 'L.3',
            'name' => 'Cultivo de Especies Acuáticas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 11,
            'code' => 'L.4',
            'name' => 'Pesca Artesanal y Buceo',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 11,
            'code' => 'L.5',
            'name' => 'Pesca Industrial',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 11,
            'code' => 'L.6',
            'name' => 'Tratamiento de Especies Acuáticas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 11,
            'code' => 'L.7',
            'name' => 'Patologías de Especies Acuáticas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 11,
            'code' => 'L.8',
            'name' => 'Piscicultura (Producción de Peces)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 12,
            'code' => 'M.2',
            'name' => 'Medios de Comunicación Social (Televisión, Radio, Prensa Escrita)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 12,
            'code' => 'M.3',
            'name' => 'Medios Audiovisuales (Videos, Películas, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 12,
            'code' => 'M.4',
            'name' => 'Métodos y Técnicas de Promoción y Difusión',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 12,
            'code' => 'M.5',
            'name' => 'Traducción e Interpretación',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 12,
            'code' => 'M.6',
            'name' => 'Lenguaje (Señas, Tacto, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 12,
            'code' => 'M.8',
            'name' => 'Grabados y Litografía',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 12,
            'code' => 'M.9',
            'name' => 'Gráfica (Impresión, Encuadernación, Diseño y Diagramación Gráfica, Fotomecánica Full Color, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 12,
            'code' => 'M.10',
            'name' => 'Periodismo e Investigación (Radio, TV. y Prensa)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 12,
            'code' => 'M.11',
            'name' => 'Edición',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 12,
            'code' => 'M.12',
            'name' => 'Fotografía (Digital y No Digital)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 13,
            'code' => 'N.1',
            'name' => 'Ajuste y Mantenimiento de Motores',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 13,
            'code' => 'N.2',
            'name' => 'Carrocería (Mantenimiento, Reparación, Enderezada y Pintura)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 13,
            'code' => 'N.3',
            'name' => 'Diagnóstico y Reparación de Sistemas Automotrices',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 13,
            'code' => 'N.4',
            'name' => 'Interpretación de Catálogos y Diagramas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 13,
            'code' => 'N.5',
            'name' => 'Mecánica General (Básica)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 13,
            'code' => 'N.6',
            'name' => 'Sistemas de Dirección, Frenos, Suspensión, Transmisión',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 13,
            'code' => 'N.7',
            'name' => 'Vulcanización (Montaje y Desmontaje Neumáticos, Balanceo de Ruedas, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.1',
            'name' => 'Construcción y Reparación de Hornos',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.2',
            'name' => 'Exploración y Explotación Minera (Extracción, Perforación de Cobre, Hierro, Petróleo, Otros)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.3',
            'name' => 'Forja (Fabricación de Piezas Mediante Calor y Compresión)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.4',
            'name' => 'Fresado (Fabricación de Piezas, Engranajes, etc., Mediante Fresadora)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.5',
            'name' => 'Fundición (Fabricación de Piezas Mediante la Fusión de Metales)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.6',
            'name' => 'Matricería (Fabricación de Moldes y Matrices de Piezas en Serie)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.7',
            'name' => 'Mecánica de Banco (Fabricación de Piezas Mediante Herramientas de Mano)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.8',
            'name' => 'Metalmecánica Metalurgia (Estructuras Metálicas, Autopartes a fin de Obtener Plantas de Proceso Llave en Mano, Superestructuras, Equipos con Alto Grado de Automatización y Componente Tecnológico)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.9',
            'name' => 'Balance Metalúrgico (Preparación de Muestras, Análisis Químico y Balance de Materiales)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.10',
            'name' => 'Geología (Mineralogía, Petrología, Cristalografía, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.11',
            'name' => 'Rectificación (Terminación de Piezas y Medidas Mediante Abrasivos)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.12',
            'name' => 'Soldadura (Eléctrica y Oxigas, Radiografía, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.13',
            'name' => 'Tornería (Fabricación de Piezas y Partes Mediante Torno)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.14',
            'name' => 'Tratamientos Térmicos (Mejoramiento de Propiedades de los Metales Mediante Calor y Frío)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.15',
            'name' => 'Hidráulica',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 14,
            'code' => 'O.15',
            'name' => 'Explosivos',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.1',
            'name' => 'Petróleo (Exploración, Extracción, Procesamiento, Tratamiento y Distribución)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.3',
            'name' => 'Anticorrosivos (Cromado, Niquelado, Plastificado)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.4',
            'name' => 'Automatización Industrial y Robótica',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.5',
            'name' => 'Madera (Diseño, Técnicas, Procesamiento y Acabado, Muebles de Hogar, Cocina, Oficina, Industria de la Construcción, Puertas, Ventanas, Pallets)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.6',
            'name' => 'Cemento (Materiales de Construcción )',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.7',
            'name' => 'Cerámica y Vidrio (Diseño, Técnicas, Tallado, Procesamiento y Acabado, Diversificación en la Concentración del Sector Cerámico)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.8',
            'name' => 'Cuero y Calzado (Diseño, Técnicas y Acabado)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.9',
            'name' => 'Envases y Embalajes',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.10',
            'name' => 'Refrigeración (Cadena de Frio)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.11',
            'name' => 'Textil (Diseño, Patronaje y Confección de Prendas, Transformación de Plantillas, Costura, Sastrería)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.12',
            'name' => 'Tapicería',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.14',
            'name' => 'Seguridad, Prevención de Riesgos e Higiene Industrial',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.15',
            'name' => 'Industria Química (Galvanoplastia, Tinturas, Abonos, Plaguicidas, Barnices,  Lacas, Jabones, Cosméticos, Farmoquímica, Petroquímica, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.16',
            'name' => 'Lavandería, Tintorería y Planchado Industrial',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.17',
            'name' => 'Lubricantes',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.19',
            'name' => 'Calderos (Operación, Mantenimiento y Reparación)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.20',
            'name' => 'Operación, Reparación y Mantenimiento de Máquinas y Equipos (Agrícola, Agropecuario, Forestal, de Construcción, Textil, Minera, Pesquera, Médicos, de Comunicación, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.21',
            'name' => 'Papeles y Cartones',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.23',
            'name' => 'Plásticos y Cauchos',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.24',
            'name' => 'Prácticas de Manufactura (Estrategia de Producción y Gestión de Materia Prima, Programas de Diversificación Sectorial, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 15,
            'code' => 'P.25',
            'name' => 'Energía Renovable: Bioethanol (Materia Prima: Caña de Azúcar, Rechazo de Banano, Sorgo Dulce, Algas, Desechos, Bioethanol Artesanal, etc.), Biodiesel (Materia Prima: Aceite de Palma Africana, Piñón, Colza, Soya, Biodiesel Artesanal), Biogás (Materia Prima: Residuos Orgánicos), Extracción de Alcohol Artesanal.',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 16,
            'code' => 'Q.1',
            'name' => 'Conducción de Vehículos Terrestres',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 16,
            'code' => 'Q.3',
            'name' => 'Mantenimiento de Aeronaves y Naves',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 16,
            'code' => 'Q.4',
            'name' => 'Transporte de Carga y de Pasajeros (Aéreo, Fluvial, Marítimo, Terrestre)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 16,
            'code' => 'Q.5',
            'name' => 'Aeronáutica (Control de Operaciones, Tránsito Aéreo, Diseño y Construcción de Aeronaves, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 16,
            'code' => 'Q.6',
            'name' => 'Pilotaje  y Técnicas de Navegación (Aéreo, Fluvial, Marítimo, Visual,  Instrumental, y/o Radar, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 16,
            'code' => 'Q.7',
            'name' => 'Logística Integral (Diseño, Producción, Entrega y Uso de un Producto o Servicio en el Mercado)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 16,
            'code' => 'Q.8',
            'name' => 'Cadenas de Abastecimiento (Información, Trazabilidad, Integración, Gestión de Nodos Logísticos Productivos Locales, Centros de Distribución Logística Internacional)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 16,
            'code' => 'Q.9',
            'name' => 'Manejo Integral de Bodegas y Almacenes',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 16,
            'code' => 'Q.10',
            'name' => 'Sistemas de Información Geográfica y Rutas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 16,
            'code' => 'Q.10',
            'name' => 'Sistemas de Información Geográfica y Rutas',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 16,
            'code' => 'Q.11',
            'name' => 'Geodesia (Agrimensura, Cartografía, Fotogrametría, Topografía)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 17,
            'code' => 'R.12',
            'name' => 'Peluquería y Belleza, Barbería y Estilismo',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 17,
            'code' => 'R.13',
            'name' => 'Cosmetología',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 17,
            'code' => 'R.14',
            'name' => 'Artesanía (Cuero, Madera, Vidrio, Piedras, Metales, Telas, Cerámica, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 18,
            'code' => 'S.1',
            'name' => 'Gestión Cultural',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 18,
            'code' => 'S.4',
            'name' => 'Género',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 18,
            'code' => 'S.6',
            'name' => 'Salud y Medicina (Medicina General Tradicional y Alternativa, Nutrición, Tratamientos y Atención Infantil, Familiar, Ocupacional, Primeros Auxilios, Emergencias y Catástrofes, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 18,
            'code' => 'S.10',
            'name' => 'Servicios Domésticos',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 18,
            'code' => 'S.12',
            'name' => 'Servicios de Seguridad Física, Guardianía',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 19,
            'code' => 'T.1',
            'name' => 'Transformación de Productos, Subproductos (Agrícola, Ganadero, Pesca, Forestal)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 19,
            'code' => 'T.2',
            'name' => 'Conglomerados Agroindustriales (Cárnico, Madera, Lácteos, Frutas y Vegetales, Pescado, etc.)',
            'type' => 'specialty',
            'state_id' => 1,
        ]);

        // ethnic_origin
        factory(CecyCatalogue::class)->create([
            'code' => '1',
            'name' => 'INDIGENA',
            'type' => 'ethnic_origin',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '2',
            'name' => 'AFROECUATORIANO',
            'type' => 'ethnic_origin',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '3',
            'name' => 'NEGRO',
            'type' => 'ethnic_origin',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '4',
            'name' => 'MULATO',
            'type' => 'ethnic_origin',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '5',
            'name' => 'MONTUBIO',
            'type' => 'ethnic_origin',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '6',
            'name' => 'MESTIZO',
            'type' => 'ethnic_origin',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '7',
            'name' => 'BLANCO',
            'type' => 'ethnic_origin',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '8',
            'name' => 'OTRO',
            'type' => 'ethnic_origin',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '9',
            'name' => 'NO REGISTRA',
            'type' => 'ethnic_origin',
            'state_id' => 1,
        ]);

        // sex
        factory(CecyCatalogue::class)->create([
            'code' => '1',
            'name' => 'HOMBRE',
            'type' => 'sex',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '2',
            'name' => 'MUJER',
            'type' => 'sex',
            'state_id' => 1,
        ]);

        // gender
        factory(CecyCatalogue::class)->create([
            'code' => '1',
            'name' => 'MASCULINO',
            'type' => 'gender',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '2',
            'name' => 'FEMENINO',
            'type' => 'gender',
            'state_id' => 1,
        ]);

        // identification_type
        factory(CecyCatalogue::class)->create([
            'code' => '1',
            'name' => 'CEDULA',
            'type' => 'identification_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '2',
            'name' => 'PASAPORTE',
            'type' => 'identification_type',
            'state_id' => 1,
        ]);

        // blood_type
        factory(CecyCatalogue::class)->create([
            'code' => '1',
            'name' => 'A+',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '2',
            'name' => 'A-',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '3',
            'name' => 'B+',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '4',
            'name' => 'B-',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '5',
            'name' => 'AB+',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '6',
            'name' => 'AB-',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '7',
            'name' => 'O+',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => '8',
            'name' => 'O-',
            'type' => 'blood_type',
            'state_id' => 1,
        ]);

        // location
        factory(CecyCatalogue::class)->create([
            'code' => 'ec',
            'name' => 'ECUADOR',
            'type' => 'country',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 30,
            'code' => '17',
            'name' => 'PICHINCHA',
            'type' => 'province',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'parent_code_id' => 261,
            'code' => '1',
            'name' => 'QUITO',
            'type' => 'canton',
            'state_id' => 1,
        ]);

        //catalogos jornada
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'MATUTINA',
            'type' => 'jornada',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'NOCTURNA',
            'type' => 'jornada',
            'state_id' => 1,
        ]);
        //catalogos paralelo
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'A',
            'type' => 'paralelo',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'B',
            'type' => 'paralelo',
            'state_id' => 1,
        ]);
        //display
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Lunes',
            'type' => 'Dias',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Martes',
            'type' => 'Dias',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Miercoles',
            'type' => 'Dias',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Jueves',
            'type' => 'Dias',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Viernes',
            'type' => 'Dias',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Sábado',
            'type' => 'Dias',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Domingo',
            'type' => 'Dias',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Curso',
            'type' => 'capacitation_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Taller',
            'type' => 'capacitation_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Webinar',
            'type' => 'capacitation_type',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'SENESCYT',
            'type' => 'entity_certification',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'CECY',
            'type' => 'entity_certification_cecy',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'SETEC',
            'type' => 'entity_certification',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Retirado',
            'type' => 'registration_status',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Desertado',
            'type' => 'registration_status',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Matriculado',
            'type' => 'registration_status',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Instituto Tecnologico Superior Yavirac',
            'type' => 'course_location',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Rector',
            'type' => 'position_autority',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Coord. Cecy',
            'type' => 'position_autority',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Coord. Senescyt',
            'type' => 'position_autority',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Coord. Setec',
            'type' => 'position_autority',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Suspendido',
            'type' => 'status_position_autority',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Retirado',
            'type' => 'status_position_autority',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Vigente',
            'type' => 'status_position_autority',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Entregado',
            'type' => 'status_certificate',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'Proceso',
            'type' => 'status_certificate',
            'state_id' => 1,
        ]);
        factory(CecyCatalogue::class)->create([
            'code' => 'pruebas',
            'name' => 'No Entregado',
            'type' => 'status_certificate',
            'state_id' => 1,
        ]);



        // roles
        factory(Role::class)->create([
            'id' => 3,
            'code' => '3',
            'name' => 'PARTICIPANTE',
            'system_id' => 1,
            'state_id' => 1,
        ]);

        // Instructors
        factory(User::class, 50)->create([
            'nationality' => 1
        ]);

        factory(User::class, 4)->create([
            'nationality' => 1
        ]);



        //Autoridades
        factory(Authority::class)->create([
            'user_id' => 51,
            'state_id' => 1,
            'status_id' => 290,
            'position_id' => 284,
            'start_position' => '2020-08-26',
            'end_position' => '2023-08-26'
        ]);

        //Autoridades
        factory(Authority::class)->create([
            'user_id' => 52,
            'state_id' => 1,
            'status_id' => 290,
            'position_id' => 285,
            'start_position' => '2020-08-26',
            'end_position' => '2023-08-26'
        ]);

        //Autoridades
        factory(Authority::class)->create([
            'user_id' => 53,
            'state_id' => 1,
            'status_id' => 290,
            'position_id' => 286,
            'start_position' => '2020-08-26',
            'end_position' => '2023-08-26'
        ]);

        //Autoridades
        factory(Authority::class)->create([
            'user_id' => 54,
            'state_id' => 1,
            'status_id' => 290,
            'position_id' => 287,
            'start_position' => '2020-08-26',
            'end_position' => '2023-08-26'
        ]);





        // External Institutes
        factory(CecyInstitution::class)->create([
            'code' => 'ITSY',
            'authorities_id' => 1,
            'ruc' => '17-040',
            'logo' => 'Nombre_logo',
            'name' => 'iNSTITUTO TECNOLÓGICO SUPERIOR YAVIRAC',
            'slogan' => 'Instituto Tecnologico Superior Benito Juarez',
            'state_id' => '1',
        ]);
        factory(CecyInstitution::class)->create([
            'code' => 'ITSBJ',
            'authorities_id' => 1,
            'ruc' => '17-043',
            'logo' => 'Nombre_logo',
            'name' => 'INSTITUTO TECNOLÓGICO SUPERIOR BENITO JUAREZ',
            'slogan' => 'Instituto Tecnologico Superior Benito Juarez',
            'state_id' => '1',
        ]);
        factory(CecyInstitution::class)->create([
            'code' => 'ITSGC',
            'authorities_id' => 1,
            'ruc' => '17-035',
            'logo' => 'Nombre_logo',
            'name' => 'INSTITUTO TECNOLÓGICO SUPERIOR GRAN COLOMBIA',
            'slogan' => 'Instituto Tecnologico Superior Gran Colombia',
            'state_id' => '1',
        ]);
        factory(CecyInstitution::class)->create([
            'code' => 'YECC',
            'authorities_id' => 1,
            'ruc' => '17-141',
            'logo' => 'Nombre_logo',
            'name' => 'YAVIRAC ENGLISH CENTER - CENEPA',
            'slogan' => 'Centro de idiomas yavirac',
            'state_id' => '1',
        ]);

        
        for ($i = 2; $i <= 4; $i++) {
            factory(Instructor::class)->create([
                'state_id' => 1,
                'user_id' => $i,
                'status_certificate_id' => 293,
                'location_certificate' => 'null',
                'code_certificate' => 'null',
                'main_firm_id' => 1,
                'secondary_firm_id' => $i
            ]);
        }

        //horarios
        factory(Schedule::class)->create([
            'state_id' => 1,
            'start_time' => '14:00',
            'end_time' => '16:00',
            'day_id' => 267,
        ]);
        factory(Schedule::class)->create([
            'state_id' => 1,
            'start_time' => '14:00',
            'end_time' => '16:00',
            'day_id' => 268,
        ]);


        // courses
        factory(CecyCourse::class)->create([
            'code' => 'YEC-ST',
            'name' => 'Curso Senescyt - Prueba - Desarrollo',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            //'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            // 'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            //"need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 274,
            "entity_certification_type_id" => 277,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 32,
            "setec_name" => "null",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-ST',
            'name' => 'Curso Senescyt - Prueba - Desarrollo2',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            //'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            // 'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            //"need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 275,
            "entity_certification_type_id" => 277,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 32,
            "setec_name" => "null",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-ST',
            'name' => 'Curso Senescyt - Prueba - Marketing',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            //'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            // 'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            //"need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 276,
            "entity_certification_type_id" => 277,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 32,
            "setec_name" => "null",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-ST',
            'name' => 'Curso Senescyt - Prueba - Marketing',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            //'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            // 'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            //"need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 274,
            "entity_certification_type_id" => 277,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 32,
            "setec_name" => "null",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-ST',
            'name' => 'Curso Senescyt - Prueba - Arte',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            //'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            // 'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            //"need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 275,
            "entity_certification_type_id" => 277,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 32,
            "setec_name" => "null",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-ST',
            'name' => 'Curso Senescyt - Prueba - Arte',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            //'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            // 'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            //"need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 276,
            "entity_certification_type_id" => 277,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 32,
            "setec_name" => "null",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-ST',
            'name' => 'Curso Senescyt - Prueba - Arte',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            //'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            // 'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            //"need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 274,
            "entity_certification_type_id" => 277,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 32,
            "setec_name" => "null",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-ST',
            'name' => 'STARTER',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            //'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            // 'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            //"need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 274,
            "entity_certification_type_id" => 279,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 32,
            "setec_name" => "CAPACITACIÓN CONTINUA EN EL IDIOMA INGLÉS STARTER",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-A1.1',
            'name' => 'A1.1',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            // 'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            //'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            // "need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 275,
            "entity_certification_type_id" => 279,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 33,
            "setec_name" => "CAPACITACIÓN CONTINUA EN EL IDIOMA INGLÉS A1.1",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-A1.2',
            'name' => 'A1.2',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            // 'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            //'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            // "need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 276,
            "entity_certification_type_id" => 279,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 34,
            "setec_name" => "CAPACITACIÓN CONTINUA EN EL IDIOMA INGLÉS A1",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-A2.1',
            'name' => 'A2.1',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            // 'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            // 'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            // "need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 274,
            "entity_certification_type_id" => 279,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 35,
            "setec_name" => "CAPACITACIÓN CONTINUA EN EL IDIOMA INGLÉS A2.1",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-A2.2',
            'name' => 'A2.2',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            //    'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            // 'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            //    "need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 275,
            "entity_certification_type_id" => 279,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 36,
            "setec_name" => "CAPACITACIÓN CONTINUA EN EL IDIOMA INGLÉS A2",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-B1.1',
            'name' => 'B1.1',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            // 'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            //'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            // "need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 276,
            "entity_certification_type_id" => 279,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 37,
            "setec_name" => "CAPACITACIÓN CONTINUA EN EL IDIOMA INGLÉS B1.1",
        ]);
        factory(CecyCourse::class)->create([
            'code' => 'YEC-B1.2',
            'name' => 'B1.2',
            'cost' => 0,
            'photo'  => 'imagen.jpg',
            //  'summary' => '',
            'duration' => 80,
            'modality_id' => 23, //presencial
            'free' => true,
            'state_id' => 2, //inactivo
            'observation' => '',
            'objective' => '',
            // 'needs' => '["test"]',
            'facilities' => '["test"]',
            'theoretical_phase' => '["test"]',
            'practical_phase' => '["test"]',
            'cross_cutting_topics' => '["test"]',
            'bibliography' => '["test"]',
            'teaching_strategies' => '["test"]',
            'participant_type_id' => 21, //estudiantes
            'area_id' => 1,
            "level_id" => 26, //niveles curso
            "required_installing_sources" => "",
            "practice_hours" => 40,
            "theory_hours" => 40,
            "practice_required_resources" => "",
            "aimtheory_required_resources" => "",
            "learning_teaching_strategy" => "",
            // "person_proposal_id" => 2,
            "proposed_date" => "2020-08-26",
            "approval_date" => "2020-08-26",
            //"need_date" => "2020-08-26",
            "local_proposal" => "",
            "schedules_id" => 1,
            "canton_dictate_id" => 262,
            "project" => "",
            "capacity" => 20,
            "capacitation_type_id" => 274,
            "entity_certification_type_id" => 279,
            // "classroom_id" => "",
            "course_type_id" => 31,
            "specialty_id" => 39,
            "academic_period_id" => 38,
            "setec_name" => "CAPACITACIÓN CONTINUA EN EL IDIOMA INGLÉS B1",
        ]);

        // school_periods
        factory(SchoolPeriod::class)->create([
            'code' => "test",
            'name' => "test",
            'start_date' => "2020-08-28",
            'end_date' => "2020-08-28",
            'ordinary_start_date' => "2020-08-28",
            'ordinary_end_date' => "2020-08-28",
            'extraordinary_start_date' => "2020-08-28",
            'extraordinary_end_date' => "2020-08-28",
            'especial_start_date' => "2020-08-28",
            'especial_end_date' => "2020-08-28",
            "state_id" => 1,
        ]);



        //planificacion
        factory(Planification::class)->create([
            'date_start' => '2020-08-28',
            'date_end' => '2020-10-28',
            'course_id' => 1,
            'career_id' => 1,
            'instructor_id'  => 1,
            'main_firm_id' => 1,
            'secondary_firm_id' => 2,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            'summary' => 'sfdsf',
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,

        ]);
        factory(Planification::class)->create([
            'date_start' => '2020-03-28',
            'date_end' => '2020-12-28',
            'course_id' => 2,
            'career_id' => 1,
            'instructor_id'  => 2,
            'main_firm_id' => 1,
            'secondary_firm_id' => 3,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            'summary' => 'sfdsf',
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,

        ]);
        factory(Planification::class)->create([
            'date_start' => '2020-03-28',
            'date_end' => '2021-12-28',
            'course_id' => 3,
            'career_id' => 2,
            'instructor_id'  => 3,
            'main_firm_id' => 1,
            'secondary_firm_id' => 4,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            'summary' => 'sfdsf',
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,

        ]);
        factory(Planification::class)->create([
            'date_start' => '2020-12-28',
            'date_end' => '2021-08-28',
            'course_id' => 4,
            'career_id' => 2,
            'instructor_id'  => 1,
            'main_firm_id' => 1,
            'secondary_firm_id' => 2,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            'summary' => 'sfdsf',
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,

        ]);
        factory(Planification::class)->create([
            'date_start' => '2020-03-28',
            'date_end' => '2020-12-28',
            'course_id' => 5,
            'career_id' => 3,
            'instructor_id'  => 2,
            'main_firm_id' => 1,
            'secondary_firm_id' => 3,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            'summary' => 'sfdsf',
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,

        ]);
        factory(Planification::class)->create([
            'date_start' => '2021-03-28',
            'date_end' => '2022-12-28',
            'course_id' => 6,
            'career_id' => 3,
            'instructor_id'  => 3,
            'main_firm_id' => 1,
            'secondary_firm_id' => 4,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            'summary' => 'sfdsf',
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,

        ]);
        factory(Planification::class)->create([
            'date_start' => '2020-03-28',
            'date_end' => '2020-12-28',
            'course_id' => 7,
            'career_id' => 3,
            'instructor_id'  => 1,
            'main_firm_id' => 1,
            'secondary_firm_id' => 2,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            'summary' => 'sfdsf',
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,

        ]);


        //Planification external institutes
        factory(SetecPlanification::class)->create([
            'date_start' => '2021-03-28',
            'date_end' => '2023-12-28',
            'course_id' => 8,
            'institution_id' => 1,
            'instructor_id'  => 2,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,
            'autority_subscribe_certificate' => 2
        ]);
        factory(SetecPlanification::class)->create([
            'date_start' => '2020-03-28',
            'date_end' => '2020-12-28',
            'course_id' => 9,
            'institution_id' => 2,
            'instructor_id'  => 3,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,
            'autority_subscribe_certificate' => 2

        ]);
        factory(SetecPlanification::class)->create([
            'date_start' => '2022-03-28',
            'date_end' => '2023-12-28',
            'course_id' => 10,
            'institution_id' => 3,
            'instructor_id'  => 1,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,
            'autority_subscribe_certificate' => 2

        ]);
        factory(SetecPlanification::class)->create([
            'date_start' => '2021-01-28',
            'date_end' => '2021-06-28',
            'course_id' => 11,
            'institution_id' => 4,
            'instructor_id'  => 2,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,
            'autority_subscribe_certificate' => 2

        ]);
        factory(SetecPlanification::class)->create([
            'date_start' => '2020-03-28',
            'date_end' => '2020-12-28',
            'course_id' => 12,
            'institution_id' => 1,
            'instructor_id'  => 3,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,
            'autority_subscribe_certificate' => 2

        ]);
        factory(SetecPlanification::class)->create([
            'date_start' => '2020-03-28',
            'date_end' => '2020-12-28',
            'course_id' => 13,
            'institution_id' => 2,
            'instructor_id'  => 1,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,
            'autority_subscribe_certificate' => 2

        ]);
        factory(SetecPlanification::class)->create([
            'date_start' => '2020-03-28',
            'date_end' => '2020-12-28',
            'course_id' => 14,
            'institution_id' => 3,
            'instructor_id'  => 2,
            'state_id' => 1,
            'summary' => 'sfdsf',
            'needs' => ['sndfk', 'afdsa'],
            'need_date' => '2020-10-28',
            // 'status_id' => 1,
            'school_period_id' => 1,
            // 'classroom_id' => 1,
            'planned_end_date' => '2020-10-28',
            'capacity' => '20',
            'observation' => '',
            'conference' => 263,
            // 'responsible_id' => 1,
            'parallel' => 265,
            'site_dictate' => 283,
            'autority_subscribe_certificate' => 2

        ]);


        

        //Participants
        for ($i = 1; $i <= 50; $i++) {
            factory(CecyParticipant::class)->create([
                'user_id' => $i,
                'person_type_id' => 21,
                'state_id' => 1,
            ]);

            factory(CecyParticipantDetail::class)->create([
                'participant_id' => $i,
                'institution_name' => 'Prueba Instituto'.$i,
                'address_institution' => 'Prueba adress'.$i,
                'institution_email' => "instututo$i@instituto.com",
                'institution_phone' => '0987654321',
                'institution_activity' => 'Prueba Activity',
                'participant_works' => true,
                'sponsored' => 'Prueba sponsored',
                'contact_sponsored' => 'Prueba contact sponsored',
                'course_info' => 'prueba info course',
                'comments' => '-'
            ]);
        }

        //Registros
        for ($i = 1; $i <= 33; $i++) {
            factory(CecyRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 1
            ]);
        }

        for ($i = 6; $i <= 49; $i++) {
            factory(CecyRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 2
            ]);
        }

        for ($i = 11; $i <= 30; $i++) {
            factory(CecyRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 3
            ]);
        }

        for ($i = 1; $i <= 40; $i++) {
            factory(CecyRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 4
            ]);
        }

        for ($i = 3; $i <= 50; $i++) {
            factory(CecyRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 5
            ]);
        }

        for ($i = 5; $i <= 25; $i++) {
            factory(CecyRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 6
            ]);
        }

        for ($i = 1; $i <= 45; $i++) {
            factory(CecyRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 7
            ]);
        }






        //Registros Setec
        for ($i = 1; $i <= 38; $i++) {
            factory(CecySetecRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 1
            ]);
        }

        for ($i = 6; $i <= 16; $i++) {
            factory(CecySetecRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 2
            ]);
        }

        for ($i = 11; $i <= 42; $i++) {
            factory(CecySetecRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 3
            ]);
        }

        for ($i = 6; $i <= 22; $i++) {
            factory(CecySetecRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 4
            ]);
        }

        for ($i = 1; $i <= 38; $i++) {
            factory(CecySetecRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 5
            ]);
        }

        for ($i = 5; $i <= 25; $i++) {
            factory(CecySetecRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 6
            ]);
        }

        for ($i = 1; $i <= 50; $i++) {
            factory(CecySetecRegistration::class)->create([
                'date_registration' => '2020-08-26',
                'participant_id' => $i,
                'state_id' => 1,
                'type_id' => 30,
                'number' => 1,
                'planification_id' => 7
            ]);
        }







        //Detail registrations
        //Estado de la matricula (status_id) = 280:retirado, 281:desertado, 282:matriculado.
        $array_matricula = array(280, 281, 282);
        //$array_matricula = array(282);
        $array_notas = array(60.40, 70.10, 90.80, 80.00, 40.00, 85.00, 100.00, 98.90, 90.00, 30.90);
        shuffle($array_matricula);
        shuffle($array_notas);
        for ($i = 1; $i <= 251; $i++) {
            $random_matriculas = array_rand($array_matricula, 1);
            $random_notas = array_rand($array_notas, 1);
            factory(CecyDetailRegistration::class)->create([
                'registration_id' => $i,
                'state_id' => 1,
                'status_id' => $array_matricula[$random_matriculas],
                'status_certificate_id' => 293,
                'location_certificate' => 'null',
                'code_certificate' => 'null',
                'final_grade' => $array_notas[$random_notas],
                'certificate_withdrawn' => '2020-08-26',
                'observation' => 'null'
            ]);
        }






        //Detail registrations setec
        //Estado de la matricula (status_id) = 280:retirado, 281:desertado, 282:matriculado.
        $array_matricula = array(280, 281, 282);
        //$array_matricula = array(282);
        $array_notas = array(60.40, 70.10, 90.80, 80.00, 40.00, 85.00, 100.00, 98.90, 90.00, 30.90);
        shuffle($array_matricula);
        shuffle($array_notas);
        for ($i = 1; $i <= 207; $i++) {
            $random_matriculas = array_rand($array_matricula, 1);
            $random_notas = array_rand($array_notas, 1);
            factory(SetecDetailRegistration::class)->create([
                'registration_id' => $i,
                'state_id' => 1,
                'status_id' => $array_matricula[$random_matriculas],
                'status_certificate_id' => 293,
                'location_certificate' => 'null',
                'code_certificate' => 'null',
                'final_grade' => $array_notas[$random_notas],
                'certificate_withdrawn' => '2020-08-26',
                'observation' => 'null'
            ]);
        }








        $topics_course = array(
            'La estigmatización de las personas con trastornos mentales y neurológicos',
            'La pena de muerte',
            'La inmigración ilegal',
            'La igualdad',
            'La violencia de pareja y de género',
            'La eutanasia',
            'La experimentación animal',
            'La evolución de la tecnología',
            'La ética en la vida cotidiana y a nivel profesional',
            'La imagen en la sociedad',
            'La censura',
            'El cambio climático',
            'La legalización de la prostitución',
            'Las drogas en la sociedad',
            'La fidelidad e infidelidad en la pareja',
            'Los estereotipos sociales',
            'La privacidad y el derecho a la intimidad',
            'La globalización',
            'El empleo hoy en día',
            'El aborto',
            'La religión y la espiritualidad',
            'La presión social',
            'Supersticiones',
            'El derecho a la vivienda',
            'Lo políticamente correcto y la libertad de expresión',
            'Los impuestos'
        );
        shuffle($topics_course);
        for ($i = 1; $i <= 14; $i++) {
            $random_topic = array_rand($topics_course, 1);
            factory(CecyTopic::class)->create([
                'description' => $topics_course[$random_topic],
                'parent_code_id' => null,
                'state_id' => 1,
                'type_id' => 30,
                'course_id' => $i,
            ]);

            $random_topic2 = array_rand($topics_course, 1);
            factory(CecyTopic::class)->create([
                'description' => $topics_course[$random_topic2],
                'parent_code_id' => null,
                'state_id' => 1,
                'type_id' => 30,
                'course_id' => $i,
            ]);

            $random_topic3 = array_rand($topics_course, 1);
            factory(CecyTopic::class)->create([
                'description' => $topics_course[$random_topic3],
                'parent_code_id' => null,
                'state_id' => 1,
                'type_id' => 30,
                'course_id' => $i,
            ]);
        }

        /*
            drop schema if exists public cascade;
            drop schema if exists authentication cascade;
            drop schema if exists attendance cascade;
            drop schema if exists ignug cascade;
            drop schema if exists job_board cascade;
            drop schema if exists web cascade;
            drop schema if exists teacher_eval cascade;
            drop schema if exists cecy cascade;



            create schema authentication;
			create schema attendance;
			create schema ignug;
			create schema job_board;
			create schema web;
			create schema teacher_eval;
            create schema cecy;
            




UPDATE authentication.users SET gender_id =23, nationality =41  WHERE id = 1;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 2;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 3;
UPDATE authentication.users SET gender_id =24, nationality =42   WHERE id = 4;
UPDATE authentication.users SET gender_id =23, nationality =42   WHERE id = 5;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 6;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 7;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 8;
UPDATE authentication.users SET gender_id =23, nationality =42   WHERE id = 9;
UPDATE authentication.users SET gender_id =24, nationality =42   WHERE id = 10;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 11;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 12;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 13;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 14;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 15;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 16;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 17;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 18;
UPDATE authentication.users SET gender_id =23, nationality =42   WHERE id = 19;
UPDATE authentication.users SET gender_id =24, nationality =42   WHERE id = 20;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 21;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 22;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 23;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 24;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 25;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 26;
UPDATE authentication.users SET gender_id =23, nationality =42   WHERE id = 27;
UPDATE authentication.users SET gender_id =24, nationality =42   WHERE id = 28;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 29;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 30;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 31;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 32;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 33;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 34;
UPDATE authentication.users SET gender_id =23, nationality =42   WHERE id = 35;
UPDATE authentication.users SET gender_id =24, nationality =42   WHERE id = 36;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 37;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 38;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 39;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 40;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 41;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 42;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 43;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 44;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 45;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 46;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 47;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 48;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 49;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 50;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 51;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 52;
UPDATE authentication.users SET gender_id =23, nationality =41   WHERE id = 53;
UPDATE authentication.users SET gender_id =24, nationality =41   WHERE id = 54;






        */
    }
}
