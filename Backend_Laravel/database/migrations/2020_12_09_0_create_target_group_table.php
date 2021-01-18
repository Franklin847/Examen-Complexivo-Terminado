<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTargetGroupTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //publico_objetivo
        Schema::connection('pgsql-cecy')->create('target_groups', function (Blueprint $table) {
            $table->id();
            $table->foreignId('population_id')->constrained('catalogues'); //id_poblacion
            $table->foreignId('course_id')->constrained('courses'); //id_codigo_curso
            $table->foreignId('state_id')->constrained('ignug.states'); //id_estado
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
        Schema::connection('pgsql-cecy')->dropIfExists('target_groups');
    }
}
