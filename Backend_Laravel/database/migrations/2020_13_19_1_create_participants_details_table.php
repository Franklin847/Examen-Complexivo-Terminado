<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParticipantsDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // detalle participantes
        Schema::connection('pgsql-cecy')->create('detail_participants', function (Blueprint $table) {
            $table->id();
            $table->foreignId('participant_id')->constrained('participants');
            $table->string('institution_name', 50);
            $table->string('address_institution', 50);
            $table->string('institution_email', 90);
            $table->string('institution_phone', 10);
            $table->string('institution_activity', 50);
            $table->boolean('participant_works');
            $table->string('sponsored', 50);
            $table->string('contact_sponsored', 50);
            $table->string('course_info', 50);
            $table->string('comments', 100);
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
        Schema::connection('pgsql-cecy')->dropIfExists('detail_participants');
    }
}
