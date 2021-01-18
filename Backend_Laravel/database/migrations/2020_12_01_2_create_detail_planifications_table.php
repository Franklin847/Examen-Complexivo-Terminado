<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDetailPlanificationsTable extends Migration
{
    /**
     * Run the migrations.
     
     * @return void
     */
    public function up()
    {
        Schema::connection('pgsql-cecy')->create('planifications', function (Blueprint $table) {
            $table->id();
            $table->date('date_start')->nullable()->comment('Fecha inicializacion del curso');
            $table->date('date_end')->nullable()->comment('Fecha finalizacion del curso');
            $table->string('summary',1000)->comment('Resumen');  //resumen
            $table->date('planned_end_date')->comment('fecha fin prevista');  //fecha fin prevista
            $table->foreignId('course_id')->constrained('courses')->comment('cursos_id'); //cursos_id
            $table->foreignId('career_id')->constrained('ignug.careers')->comment(''); //Se refiere a la carrera que le corresponde al curso
            $table->foreignId('instructor_id')->constrained('instructors')->comment('fk a la tabla de instructores'); 
            $table->foreignId('main_firm_id')->constrained('authorities')->comment('rector o autoridad principal'); 
            $table->foreignId('secondary_firm_id')->constrained('authorities')->comment('encargado o corrdinador del curso'); 
            $table->foreignId('state_id')->constrained('ignug.states')->comment('stado_id'); //stado_id
            // $table->foreignId('status_id')->constrained('catalogues')->comment(''); //status de la planificacion
           // $table->foreignId('schedule_id')->constrained('schedule')->comment(''); //horario
            $table->foreignId('school_period_id')->constrained('school_periods')->comment('Periodo escolar'); //periodo_id
            // $table->foreignId('classroom_id')->constrained('ignug.classrooms')->comment(''); //id_aula
            $table->integer('capacity')->comment('capacidad_curso');  //capacidad_curso
            $table->string('observation',1000)->comment('observaciones');  //observaciones
            $table->foreignId('conference')->constrained('catalogues')->comment('jornada');  //jornada
            // $table->foreignId('responsible_id')->constrained('authorities')->comment('');  //id autoridad a cargo responsable
            $table->foreignId('parallel')->constrained('catalogues')->comment('Paralelo del curso');  //Paralelo del curso
            $table->foreignId('site_dictate')->constrained('catalogues')->comment('lugar donde se dicta');  //lugar donde se dicta
            $table->json('needs')->comment('necesidades del curso es un array');  //necesidades del curso es un array
            $table->date('need_date')->comment('fecha_registro de necesidad');  //fecha_registro de necesidad
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection('pgsql-cecy')->dropIfExists('planifications');
    }
}
