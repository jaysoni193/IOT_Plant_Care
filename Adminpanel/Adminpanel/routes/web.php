<?php

use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});




Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::group(['middleware' => ['auth','admin']], function() {

    Route::get('/dashboard',[App\Http\Controllers\Admin\DashboardController::class,'index1']
    );

    Route::get('/role-register',[App\Http\Controllers\Admin\DashboardController::class, 'registered']);
    Route::get('/role-edit/{id}','App\Http\Controllers\Admin\DashboardController@registeredit');
});
Route::put('/role-register-update/{id}','App\Http\Controllers\Admin\DashboardController@registerupdate');
Route::delete('/role-register/{id}','App\Http\Controllers\Admin\DashboardController@registerdelete')->name('user.delete');
Route::get('/abouts','App\Http\Controllers\Admin\AboutusController@index');
Route::post('/save-aboutus','App\Http\Controllers\Admin\AboutusController@store');
Route::get('/about-us/{id}','App\Http\Controllers\Admin\AboutusController@edit');
Route::put('/aboutus-update/{id}','App\Http\Controllers\Admin\AboutusController@update');
Route::delete('/abouts/{id}','App\Http\Controllers\Admin\AboutusController@delete')->name('abouts.delete');
Route::get('/plants','App\Http\Controllers\Admin\plantdataController@plnt');
 Route::post('/image.store','App\Http\Controllers\Admin\plantdataController@store1');
Route::get('/plant-us/{id}','App\Http\Controllers\Admin\plantdataController@edit1');
Route::put('/plantus-update/{id}','App\Http\Controllers\Admin\plantdataController@update1');
Route::delete('/plants/{id}','App\Http\Controllers\Admin\plantdataController@delete1')->name('plants.delete');
Route::get('/contacts','App\Http\Controllers\Admin\ContactusController@cont');
Route::post('/save-contactus','App\Http\Controllers\Admin\ContactusController@store2');
Route::get('/contact-us/{id}','App\Http\Controllers\Admin\ContactusController@add');
Route::put('/contactus-update/{id}','App\Http\Controllers\Admin\ContactusController@updatee');
Route::delete('/contacts/{id}','App\Http\Controllers\Admin\ContactusController@delete2')->name('contacts.delete');

//Route::delete('/about_us_delete/{id}','App\Http\Controllers\Admin\AboutusController@delete');
Route::get('/onedevicess','App\Http\Controllers\Admin\OneedeviceController@one');
Route::post('/save-onedevices','App\Http\Controllers\Admin\OneedeviceController@store3');
Route::get('/onedevices-us/{id}','App\Http\Controllers\Admin\OneedeviceController@add2');
Route::put('/onedevices-update/{id}','App\Http\Controllers\Admin\OneedeviceController@updatee2');
Route::delete('/onedevices/{id}','App\Http\Controllers\Admin\OneedeviceController@delete3')->name('onedevices.delete');









