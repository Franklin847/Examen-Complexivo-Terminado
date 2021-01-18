<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInstructorsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection('pgsql-cecy')->create('instructors', function (Blueprint $table) {
            $table->id();
            $table->foreignId('state_id')->constrained('ignug.states');
            $table->foreignId('user_id')->constrained('authentication.users');
            $table->foreignId('status_certificate_id')->constrained('catalogues'); //estado del certificado
            $table->string('location_certificate',900)->comment('ubicacion del certificado dentro del servidor');
            $table->string('code_certificate',200)->comment('ubicacion del certificado dentro del servidor'); 
            $table->foreignId('main_firm_id')->constrained('authorities')->comment('rector o autoridad principal'); 
            $table->foreignId('secondary_firm_id')->constrained('authorities')->comment('encargado o corrdinador del curso'); 
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
        Schema::connection('pgsql-cecy')->dropIfExists('instructors');
    }
}
