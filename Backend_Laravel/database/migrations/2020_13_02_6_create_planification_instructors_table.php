<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlanificationInstructorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //curso_instructores
        Schema::connection('pgsql-cecy')->create('planification_instructors', function (Blueprint $table) {
            $table->id();
            $table->foreignId('state_id')->constrained('ignug.states'); //id_estado
            $table->foreignId('instructor_id')->constrained('instructors'); //id_persona_instructor
            $table->foreignId('planification_id')->constrained('planifications'); //id_planificaion
            $table->foreignId('detail_registration_id')->constrained('detail_registrations'); //id_detalle_matricula
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
        Schema::connection('pgsql-cecy')->dropIfExists('planification_instructors');
    }
}
