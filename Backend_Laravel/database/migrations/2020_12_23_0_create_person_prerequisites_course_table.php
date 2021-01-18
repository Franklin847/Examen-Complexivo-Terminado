<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePersonPrerequisitesCourseTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //persona_curso_prerequisitos
        Schema::connection('pgsql-cecy')->create('person_prerequisites_courses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('participant_id')->constrained('instructors'); //id_persona_participante=>cecy
            $table->foreignId('course_id')->constrained('courses'); //id_curso_prerequisito
            $table->foreignId('state_id')->constrained('ignug.states'); //id_estado
            $table->boolean('payment'); //pago_matricula
            $table->string('certified', 155); //numero_certificado
            $table->date('withdrawal'); //fecha_retiro
            $table->boolean('withdrawn'); //certificado_retirado
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
        Schema::connection('pgsql-cecy')->dropIfExists('person_prerequisites_courses');
    }
}
