<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAcademicFormationsTable extends Migration
{
    public function up()
    {
        Schema::connection('pgsql-job-board')->create('academic_formations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('professional_id')->constrained();
            $table->foreignId('category_id')->constrained();
            $table->foreignId('professional_degree_id')->constrained('catalogues');
            $table->date('registration_date')->nullable();
            $table->string('senescyt_code')->nullable();
            $table->boolean('has_titling')->nullable()->default(false);;
            $table->foreignId('state_id')->constrained('ignug.states');
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
        Schema::connection('pgsql-job-board')->dropIfExists('academic_formations');
    }
}
