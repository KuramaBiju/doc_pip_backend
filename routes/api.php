<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PatologiaController;


Route::apiResource('patologias', PatologiaController::class);
