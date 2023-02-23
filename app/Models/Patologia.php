<?php

namespace App\Models;

use App\Models\Sintoma;
use App\Models\Algoritmo;
use App\Traits\QueryBuilder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Spatie\QueryBuilder\AllowedFilter;

class Patologia extends Model
{
    use HasFactory;
    use QueryBuilder;
    protected $table = 'patologias';

    protected $fillable = [
        'nombre',
        'edad',
        'genetica',
        'infeccion',
        'autoinmune',
        'transmisible',
        'genero',
        'pronostico',
        'libro',
        'clase',
        'experiencia',
        'tratamiento',
        'complicaciones',
        'fisiopatogenia',
        'diag_dif',
    ];

    protected $casts = [
        'genetica' => 'boolean',
        'infeccion' => 'boolean',
        'autoinmune' => 'boolean',
        'transmisible' => 'boolean',
    ];


    /**
     * Get the allowedFilters attributes for the model.
     *
     * @return array
     */
    static function allowedFilters()
    {
        return [
            'genetica',
            'infeccion',
            'autoinmune',
            'transmisible',
            'sintomas.nombre', // ToDo: Esto pasarlo a un scope, para despues poder buscar un array de textos puntuales. Y apartir de esto ver como cachear el filtro para "ToDo2"
            AllowedFilter::exact('genero'),
            AllowedFilter::scope('complicaciones'),
            AllowedFilter::scope('diag_dif')

           //TodO: Estos los buscamos a traves de los sintomas : libro-clase-fisio-tratamiento-exp
           //ToDo: Diag-dif = Diagnostico pepe sanchez juarez boquita. Excluyendo de la el del
        ];
    }
    //ToDo: Verificar la doc de query builder, porque a los boleanos(Cuando SOLO hay booleans en los filters) lo toma como and y no devuelve ningun registro si alguno falla. Y en los casos de cualquier otro tipo de dato, si solo coincide 1, lo devuelve


    public function scopeComplicaciones(Builder $query, $value): Builder
    {
        $parseValue = explode(" ", $value);
        if ($value) {
            foreach ($parseValue as $word) {
                $query->orWhere('complicaciones', 'LIKE', '%'.$word.'%');
            }
        }

        return $query;
    }


    public function scopeDiagDif(Builder $query, $value): Builder
    {
        $parseValue = explode(" ", $value);
        if ($value) {
            foreach ($parseValue as $word) {
                $query->orWhere('diag_dif', 'LIKE', '%'.$word.'%');
            }
        }

        return $query;
    }




    public function sintomas()
    {
        return $this->belongsToMany(Sintoma::class, 'patologia_sintoma', 'id_patologia', 'id_sintoma');
    }


    public function algoritmos()
    {
        return $this->belongsToMany(Algoritmo::class, 'alg_pat', 'id_patologia', 'id_algoritmo');
    }


    public function diagnosticos()
    {
        return $this->belongsToMany(Algoritmo::class, 'dx_pat', 'id_patologia', 'id_diag_dx');
    }
}
