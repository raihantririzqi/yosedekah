<?php

use App\Http\Controllers\AuthController;
use App\Livewire\Akunting\AkunLivewire;
use App\Livewire\Akunting\OperasionalLivewire;
use App\Livewire\Dashboard;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [AuthController::class, 'index'])->middleware('guest')->name('login');

Route::post('/login', [AuthController::class, 'login']);
Route::get('/logout', [AuthController::class, 'logout']);

Route::middleware('auth:admin')->group(function () {
    Route::get('/dashboard', Dashboard::class);
    Route::get('/akun', AkunLivewire::class);
    Route::get('/operasional', OperasionalLivewire::class);
});
