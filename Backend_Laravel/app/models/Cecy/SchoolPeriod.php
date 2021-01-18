<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class SchoolPeriod extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
        'start',
        'end',
        'cancel',
        'start_ordinary',
        'end_ordinary',
        'cancel_ordinary',
        'start_extraordinary',
        'end_extraordinary',
        'cancel_extraordinary'
    ];
    public function state()
    {
        return $this->belongsTo(State::class,'state_id');
    }
}
