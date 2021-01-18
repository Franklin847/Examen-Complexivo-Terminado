<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMenusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection('pgsql-web')->create('menus', function (Blueprint $table) {
            $table->id();
            $table->foreignId('parent_code_id')->nullable()->constrained('menus');
            $table->text('name');
            $table->text('url');
            $table->text('icon');
            $table->text('description')->nullable();
            $table->integer('order');
            $table->foreignId('type_id')->constrained('catalogues'); /*para ver si esta arriba o abajo */
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
        Schema::connection('pgsql-web')->dropIfExists('main_menu');
    }
}
