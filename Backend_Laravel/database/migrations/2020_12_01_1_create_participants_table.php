<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParticipantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // participantes
        Schema::connection('pgsql-cecy')->create('participants', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('authentication.users'); //id_usuario
            $table->foreignId('person_type_id')->constrained('catalogues'); //id_tipo_persona=>estudiantes,profesores,adultos,niños etc.
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
        Schema::connection('pgsql-cecy')->dropIfExists('participants');
    }
}
