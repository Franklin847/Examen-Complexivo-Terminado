<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBschedulesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection('pgsql-cecy')->create('schedules', function (Blueprint $table) {
            $table->id();
            $table->foreignId('state_id')->constrained('ignug.states');
            $table->string('start_time', 50);//hora inicio
            $table->string('end_time', 50);//hora fin
            $table->foreignId('day_id')->constrained('catalogues'); //id_tipo_curso
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
        Schema::connection('pgsql-cecy')->dropIfExists('schedules');
    }
}
