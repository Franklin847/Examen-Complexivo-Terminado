<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLinksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection('pgsql-web')->create('links', function (Blueprint $table) {
            $table->id();
            $table->morphs('linkable');
            $table->text('image');
            $table->text('url');
            $table->text('name');
            $table->text('icon');
            $table->text('description')->nullable();
            $table->foreignId('status_id')->constrained('catalogues');
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
        Schema::connectio('pgsql-web')->dropIfExists('links');
    }
}
