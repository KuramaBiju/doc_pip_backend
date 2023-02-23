<?php

namespace App\Models;

use App\Models\Imagen;
use App\Models\Patologia;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Algoritmo extends Model
{
    use HasFactory;
    protected $table = 'algoritmos';

    protected $fillable = [
        'nombre',
    ];

    public function patologias()
    {
        return $this->belongsToMany(Patologia::class, 'alg_pat', 'id_algoritmo', 'id_patologia');
    }

    public function imagenes()
    {
        return $this->belongsToMany(Imagen::class, 'algoritmo_img', 'id_algoritmo', 'id_img');
    }
}
