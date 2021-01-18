<?php

namespace App\Models\Ignug;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Career extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-ignug';
    protected $fillable = [
        'code',
        'name',
        'description',
        'resolution_number',
        'title',
        'acronym',
    ];

    public function teachers()
    {
        return $this->morphedByMany(Teacher::class, 'careerable');
    }

    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }

    public function modality()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function type()
    {
        return $this->belongsTo(Catalogue::class);
    }

    public function state()
    {
        return $this->belongsTo(State::class);
    }
}
