<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ChangeEcommerceSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ecommerce_settings', function (Blueprint $table) {
            $table->longText('custom_css')->change();
            $table->longText('custom_js')->change();
            $table->text('chat_code')->change();
            $table->text('analytics_code')->change();
            $table->text('fb_pixel_code')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
