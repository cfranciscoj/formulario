<?php

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

Route::get('/home', 'HomeController@index')->name('home');

// Comun - Formulario
Route::get('/comun/formulario', 'Comun\FormularioController@index')->name('formulario');
Route::post('/comun/agrupacion', 'Comun\FormularioController@agrupacion')->name('agrupacion');
Route::post('/comun/agrupacion2', 'Comun\FormularioController@agrupacion2')->name('agrupacion2');
Route::post('/comun/etiqueta2', 'Comun\FormularioController@etiqueta2')->name('etiqueta2');

// Admin - Profile




/*
Route::get('/home', function() {
    return view('home');
})->name('home')->middleware('auth');

Auth::routes();

Route::get('/home', function() {
    return view('home');
})->name('home')->middleware('auth');

Auth::routes();

Route::get('/home', function() {
    return view('home');
})->name('home')->middleware('auth');
*/
