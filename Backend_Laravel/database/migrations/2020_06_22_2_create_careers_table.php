<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCareersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection('pgsql-ignug')->create('careers', function (Blueprint $table) {
            $table->id();
            $table->foreignId('institution_id')->constrained();
            $table->string('code', 50)->nullable();;
            $table->string('name', 200);
            $table->string('description', 500);
            $table->foreignId('modality_id')->constrained('catalogues');
            $table->string('resolution_number', 500)->nullable();
            $table->string('title', 500);
            $table->string('acronym', 100);
            $table->foreignId('type_id')->constrained('catalogues');
            $table->foreignId('state_id')->constrained();
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
        Schema::connection('pgsql-ignug')->dropIfExists('careers');
    }
}
