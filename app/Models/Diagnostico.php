<?php

namespace App\Models;

use App\Models\Imagen;
use App\Models\Patologia;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Diagnostico extends Model
{
    use HasFactory;
    protected $table = 'diag_dx';

    protected $fillable = [
        'nombre',

    ];

    public function patologias()
    {
        return $this->belongsToMany(Patologia::class, 'dx_pat', 'id_diag_dx', 'id_patologia');

    }

    public function imagenes()
    {
        return $this->belongsToMany(Imagen::class, 'diag_dx_img', 'id_diag_dx', 'id_img');
    }

}
