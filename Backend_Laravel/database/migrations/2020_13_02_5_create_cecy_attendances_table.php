<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyAttendancesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //tabla asistencia
        Schema::connection('pgsql-cecy')->create('attendances', function (Blueprint $table) {
            $table->id();
            $table->foreignId('state_id')->constrained('ignug.states');//estado
            $table->integer('duration'); //duracion en horas del curs
            $table->date('date'); //fecha_asistencia
            $table->foreignId('status_id')->constrained('ignug.catalogues');//Presente,ausente,inasistente 
            $table->foreignId('detail_registration_id')->constrained('detail_registrations'); //id_detalle matricula
            $table->timestamps();//fecha y hora
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection('pgsql-cecy')->dropIfExists('attendances');
    }
}
