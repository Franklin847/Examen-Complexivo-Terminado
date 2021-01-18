<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTopicsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //subtemas_curso
        Schema::connection('pgsql-cecy')->create('topics', function (Blueprint $table) {
            $table->id();
            $table->string('description', 500); //descripcion
            $table->bigInteger('parent_code_id')->nullable();
            $table->foreign('parent_code_id')->references('id')->on('topics');//id de la propia tabla
            $table->foreignId('state_id')->constrained('ignug.states'); //id_estado
            $table->foreignId('course_id')->constrained('courses'); //id_codigo_curso
            $table->foreignId('type_id')->constrained('catalogues'); //id_codigo_curso
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
        Schema::connection('pgsql-cecy')->dropIfExists('topics');
    }
}
