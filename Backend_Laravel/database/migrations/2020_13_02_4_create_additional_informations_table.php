<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdditionalInformationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //convenios
        Schema::connection('pgsql-cecy')->create('additional_informations', function (Blueprint $table) {
            $table->id();
            $table->string('company_name',200); //nombre de empresa
            $table->string('company_address',150); //direccion fisica de empresa
            $table->string('company_phone',150); //correo electronico  de empresa
            $table->string('company_activity',150); //actividad de la empresa
            $table->boolean('company_sponsor',150); //la empresa patrocina ek curso (auspiciada)
            $table->string('name_contact',150); //nombre de contacnto q patrocina
            $table->json('know_course'); //como se entero del curso? Array
            $table->json('course_follow'); //cursos que t gustaria seguir? Array
            $table->boolean('works'); //el participante trabaja?
            $table->foreignId('state_id')->constrained('ignug.states');//estado
            $table->foreignId('registration_id')->constrained('registrations'); //id_matricula
            $table->foreignId('level_instruction')->constrained('catalogues'); //id_nivel de instruccion
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
        Schema::connection('pgsql-cecy')->dropIfExists('additional_informations');
    }
}
