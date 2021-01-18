<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecySchoolPeriodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //periodo_lectivo
        Schema::connection('pgsql-cecy')->create('school_periods', function (Blueprint $table) {
            $table->id();
            $table->string('code', 100)->unique(); //codigo
            $table->string('name', 500)->unique(); //nombre
            $table->date('start_date'); //fecha_inicio
            $table->date('end_date'); //fecha_fin
            $table->date('ordinary_start_date'); //fecha_inicio_ordinario
            $table->date('ordinary_end_date'); //fecha_fin_ordinaria
            $table->date('extraordinary_start_date'); //fecha_inicio_extraordinaria
            $table->date('extraordinary_end_date'); //fecha_fin_extraordinaria
            $table->date('especial_start_date'); //fecha_inicio_especial
            $table->date('especial_end_date'); //fecha_fin_especial
            $table->foreignId('state_id')->constrained("ignug.states");
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
        Schema::connection('pgsql-cecy')->dropIfExists('school_periods');
    }
}
