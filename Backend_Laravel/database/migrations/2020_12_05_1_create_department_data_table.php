<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDepartmentDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //datos_departamento
        Schema::connection('pgsql-cecy')->create('department_data', function (Blueprint $table) {
            $table->id();
            $table->string('name',150); //nombre
            $table->string('address',150); //direccion
            $table->foreignId('charge_id')->constrained('instructors'); //id_persona_encargada
            $table->foreignId('state_id')->constrained('ignug.states'); //id_estado
            $table->foreignId('schedule_id')->constrained('catalogues'); //id_horario
            $table->foreignId('canton_id')->constrained('locations'); //id_canton
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
        Schema::connection('pgsql-cecy')->dropIfExists('department_data');
    }
}
