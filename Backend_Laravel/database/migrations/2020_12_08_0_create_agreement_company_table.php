<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAgreementCompanyTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //empresa_convenio
        Schema::connection('pgsql-cecy')->create('agreement_companies', function (Blueprint $table) {
            $table->id();
            $table->foreignId('agreement_id')->constrained('agreements'); //id_agreement
            $table->foreignId('state_id')->constrained('ignug.states'); //id_estado
            $table->string('objective',255); //objetivo
            $table->date('date_agreement_signature'); //fecha_firma_convenio
            $table->date('expiry_date'); //fecha_caducidad
            $table->string('representative',150); //persona_representante
            $table->string('social_reason',200); //razon_social
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
        Schema::connection('pgsql-cecy')->dropIfExists('agreement_companies');
    }
}
