<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyInstitutionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //periodo_lectivo
        Schema::connection('pgsql-cecy')->create('institutions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('state_id')->constrained("ignug.states")->nullable()->comment('id_estados clave foranea de state activo o inactivo'); 
            $table->foreignId('authorities_id')->constrained("cecy.authorities")->comment('Maxima autoridad de la institucion (rector)'); 
            $table->string('ruc',200)->comment('Ruc de la institución');
            $table->string('logo',200)->comment('logo de la institución');
            $table->string('name',200)->comment('nombre de la institución');
            $table->string('slogan', 500)->nullable()->comment('solgan  de la institución');
            $table->string('code', 200)->nullable()->comment('codigo de la institución');
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
        Schema::connection('pgsql-cecy')->dropIfExists('cecy_institutions');
    }
}
