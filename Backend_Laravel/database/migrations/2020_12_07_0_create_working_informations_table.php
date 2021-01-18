<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWorkingInformationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //informacion_laboral
        Schema::connection('pgsql-cecy')->create('working_informations', function (Blueprint $table) {
            $table->id();
            $table->string('name',150); //empresa_nombre
            $table->string('address',150); //empresa_direccion
            $table->string('email',150); //empresa_correo
            $table->string('phone',150); //empresa_telefono
            $table->string('activity',150); //empresa_actividad
            $table->string('summmary',255); //empresa_resumen
            $table->boolean('sponsor'); //empresa_auspiciado
            $table->string('sponsor_name',255); //nombre_auspiciante
            $table->foreignId('instructor_id')->constrained('instructors'); //id_persona_instructor
            $table->foreignId('state_id')->constrained('ignug.states'); //id_estado
            $table->string('knowledge_course',150); //conocimiento_curso
            $table->string('recomendation_course',150); //recomendacion_curso
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
        Schema::connection('pgsql-cecy')->dropIfExists('working_informations');
    }
}
