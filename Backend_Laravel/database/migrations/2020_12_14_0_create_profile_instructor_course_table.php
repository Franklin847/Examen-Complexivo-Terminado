<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProfileInstructorCourseTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //perfil_instructor_cursos
        Schema::connection('pgsql-cecy')->create('profile_instructor_courses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('course_id')->constrained('courses'); //id_codigo_curso
            $table->foreignId('state_id')->constrained('ignug.states'); //id_estado
            $table->string('required_knowledge', 150); //conocimientos_requeridos
            $table->string('required_experience', 150); //experiencias_requeridas
            $table->string('required_skills', 150); //habilidades_requeridas
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
        Schema::connection('pgsql-cecy')->dropIfExists('profile_instructor_courses');
    }
}
