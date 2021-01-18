<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCourseTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //cursos
        Schema::connection('pgsql-cecy')->create('courses', function (Blueprint $table) {
            $table->id();
            $table->string('code',100)->comment('codigo'); //codigo
            $table->string('name',200)->comment('nombre');  //nombre
            $table->decimal('cost', 3, 2)->comment('costo');  //costo
            $table->text('photo')->comment('foto');  //foto
          // $table->string('summary',1000)->comment('');  //resumen    //se coloco en planificación
            $table->integer('duration')->comment('duracion_horas');  //duracion_horas
            $table->foreignId('modality_id')->constrained('catalogues')->comment(' Matutino, vespertino');  //id_modalidad
            $table->boolean('free')->comment('gratuito');  //gratuito
            $table->foreignId('state_id')->constrained('ignug.states')->comment('id_estado');  //id_estado
            $table->string('observation',1000)->comment('observacion_curso');  //observacion_curso
            $table->string('objective',1000)->comment('objetivo');  //objetivo
           // $table->json('needs')->comment('');  //necesidades del curso es un array---Se coloco en planificación
            $table->json('facilities')->comment('instalaciones  entorno de aprendizaje');  //instalaciones  entorno de aprendizaje
            $table->json('theoretical_phase')->comment('fase teorica entorno de aprendizaje');  //fase teorica entorno de aprendizaje
            $table->json('practical_phase')->comment('fase practica entorno de aprendizaje');  //fase practica entorno de aprendizaje
            $table->json('cross_cutting_topics')->comment('temas trasversales');  //temas trasversales
            $table->json('bibliography')->comment('bibliografias');  //bibliografias
            $table->json('teaching_strategies')->comment('estrategias de enseñansa - aprendizaje');  //estrategias de enseñansa - aprendizaje
            $table->foreignId('participant_type_id')->constrained('catalogues')->comment('id_tipo_participante (estudiante, instructor)');  //id_tipo_participante
            $table->foreignId('area_id')->constrained('catalogues')->comment('id_area');  //id_area
            $table->foreignId('level_id')->constrained('catalogues')->comment('id_area');  //id_area
            $table->string('required_installing_sources',150)->comment('recursos_requeridos_instalacion');  //recursos_requeridos_instalacion
            $table->integer('practice_hours')->comment('horas_practicas');  //horas_practicas
            $table->integer('theory_hours')->comment('horas_teoricas');  //horas_teoricas
            $table->string('practice_required_resources',150)->comment('recursos_requeridos_practica');  //recursos_requeridos_practica
            $table->string('aimtheory_required_resources',150)->comment('recursos_requeridos_teoricos');  //recursos_requeridos_teoricos
            $table->string('learning_teaching_strategy',150)->comment('estrategias_enseñanza_aprendizaje');  //estrategias_enseñanza_aprendizaje
            // $table->foreignId('person_proposal_id')->constrained('authorities')->comment('');  //id_persona_propuesta
            $table->date('proposed_date')->comment('fecha_propuesta');  //fecha_propuesta
            $table->date('approval_date')->comment('fecha_aprobacion curso');  //fecha_aprobacion curso
          //  $table->date('need_date')->comment('');  //fecha_registro de necesidad
            $table->string('local_proposal',500)->comment('local_propuesta_a_dictar');  //local_propuesta_a_dictar
            $table->foreignId('schedules_id')->constrained('schedules')->comment('id_horario_propuesta');  //id_horario_propuesta
            $table->foreignId('canton_dictate_id')->constrained('catalogues')->comment('canton donde se dicta el curso');  //canton donde se dicta el curso
            $table->string('project',150)->comment('proyecto_curso');  //proyecto_curso
            $table->integer('capacity')->comment('capacidad_curso');  //capacidad_curso
            // $table->foreignId('classroom_id')->constrained('ignug.classrooms')->comment(''); //id_aula
            $table->foreignId('capacitation_type_id')->constrained('catalogues')->comment('/Se refiere a si la capacitacion es tipo curso, taller o webinar'); //Se refiere a si la capacitacion es tipo curso, taller o webinar
            $table->foreignId('entity_certification_type_id')->constrained('catalogues')->comment('Se refiere a la carrera que le corresponde al curso');  //id_entidad_certificacion (Senescyt, Cecy, Setec)
            $table->foreignId('course_type_id')->constrained('catalogues')->comment('id_tipo_curso');  //id_tipo_curso
            $table->foreignId('specialty_id')->constrained('catalogues')->comment('id_especialidad');  //id_especialidad
            $table->foreignId('academic_period_id')->constrained('catalogues')->comment('id_periodo_academico');  //id_periodo_academico
            $table->string('setec_name',200)->comment('nombre_setec');  //nombre_setec
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
        Schema::connection('pgsql-cecy')->dropIfExists('courses');
    }
}
