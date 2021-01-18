<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection('pgsql-ignug')->create('files', function (Blueprint $table) {
            $table->id();
            $table->morphs('fileable');
            $table->string('code', 100);
            $table->string('name', 200);
            $table->string('description', 500);
            $table->string('type', 200);
            $table->string('icon', 200)->nullable();
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
        Schema::connection('pgsql-ignug')->dropIfExists('files');
    }
}
