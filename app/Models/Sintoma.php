<?php

namespace App\Models;

use App\Models\Patologia;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Sintoma extends Model
{
    use HasFactory;
    protected $table = 'sintomas';

    protected $fillable = [
        'nombre',
    ];

    public function patologias()
    {
        return $this->belongsToMany(Patologia::class, 'patologia_sintoma', 'id_sintoma', 'id_patologia');
    }
}
