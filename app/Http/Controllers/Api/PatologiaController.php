<?php

namespace App\Http\Controllers\Api;

use App\Models\Patologia;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Spatie\QueryBuilder\QueryBuilder;

class PatologiaController extends Controller
{

    public function index(){
        $patologias = QueryBuilder::for(Patologia::class)
        ->allowedFilters(Patologia::allowedFilters())
        ->allowedSorts(Patologia::allowedSorts())
        ->allowedIncludes(Patologia::allowedIncludes())
        ->orderBy('id', 'desc')
        ->with('sintomas')
        ->paginate();
       return $patologias;

    }
}
