<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCecyLocationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //locations
        Schema::connection('pgsql-cecy')->create('locations', function (Blueprint $table) {
            $table->id();
            $table->string('name',150); //nombre
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
        Schema::connection('pgsql-cecy')->dropIfExists('locations');
    }
}
