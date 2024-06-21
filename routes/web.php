<?php

use App\Http\Controllers\SchoolController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::get('/', [SchoolController::class, 'index'])->name('index');

Route::get('/colegios', [SchoolController::class, 'schools'])->name('colegios');

Route::get('/colegios/{id}', [SchoolController::class, 'school']);

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile');
});

require __DIR__.'/auth.php';
