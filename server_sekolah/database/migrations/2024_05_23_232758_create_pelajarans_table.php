<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePelajaransTable extends Migration
{
    public function up()
    {
        Schema::create('pelajarans', function (Blueprint $table) {
            $table->id();
            $table->string('Nama_Pelajaran');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('pelajarans');
    }
}
