<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRequirementsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //requerimientos curso
        Schema::connection('pgsql-cecy')->create('requirements', function (Blueprint $table) {
            $table->id();
            $table->foreignId('course_id')->constrained('courses'); //id_curso
            $table->foreignId('state_id')->constrained('ignug.states'); //id_estado
            $table->foreignId('requirement_type_id')->constrained('catalogues'); //id_tipo_requerimiento_curso
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
        Schema::connection('pgsql-cecy')->dropIfExists('requirements');
    }
}
