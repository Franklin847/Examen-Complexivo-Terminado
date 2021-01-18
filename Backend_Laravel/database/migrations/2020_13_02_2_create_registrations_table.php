<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRegistrationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //matriculas
        Schema::connection('pgsql-cecy')->create('registrations', function (Blueprint $table) {
            $table->id();
            $table->string('date_registration', 50); //fecha_matricula
            $table->foreignId('participant_id')->constrained('participants'); //id_persona_participante
            $table->foreignId('state_id')->constrained("ignug.states"); //id_estado
            $table->foreignId('type_id')->constrained('catalogues'); //id_tipo_matricula
            $table->string('number',100); //numero_de_matricula
            $table->foreignId('planification_id')->constrained('planifications'); //id_planificación
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
        Schema::connection('pgsql-cecy')->dropIfExists('registrations');
    }
}
