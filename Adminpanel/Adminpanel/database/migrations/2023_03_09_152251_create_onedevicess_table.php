<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('onedevicess', function (Blueprint $table) {
            $table->id();
            $table->foreignId('device_id');
            $table->foreignId('plant_id');
            $table->string('plantname');
            $table->string('Temperature');
            $table->string('Mositure');
            $table->string('Humidity');
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
        Schema::dropIfExists('onedevicess');
    }
};
?>