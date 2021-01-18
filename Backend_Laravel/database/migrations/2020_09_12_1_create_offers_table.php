<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOffersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection('pgsql-job-board')->create('offers', function (Blueprint $table) {
            $table->id();
            $table->foreignId('company_id')->constrained();
            $table->string('code', 100);
            $table->string('contact', 200);
            $table->string('email', 100);
            $table->string('phone', 20);
            $table->string('cell_phone', 20)->nullable();
            $table->foreignId('contract_type_id')->constrained('catalogues');
            $table->string('position');
            $table->string('training_hours')->nullable();
            $table->string('experience_time')->nullable();
            $table->string('remuneration')->nullable();
            $table->string('working_day')->nullable();
            $table->string('number_jobs')->nullable();
            $table->date('start_date');
            $table->date('end_date');
            $table->json('activities');
            $table->text('aditional_information')->nullable();
            $table->foreignId('location_id')->constrained();
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
        Schema::connection('pgsql-job-board')->dropIfExists('offers');
    }
}
