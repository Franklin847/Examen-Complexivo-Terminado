<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Schedule extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
      'start_time',
      'end_time',
      'place',
    ];
    public function state()
    {
        return $this->hasMany(State::class, 'state_id');
    }
    public function day()
    {
        return $this->hasMany(Catalogue::class, 'day_id');
    }
}
