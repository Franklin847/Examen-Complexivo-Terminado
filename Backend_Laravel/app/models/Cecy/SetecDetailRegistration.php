<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class SetecDetailRegistration extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
        'final_grade',
    ];
    public function registration()
    {
        return $this->belongsTo(SetecRegistration::class,'registration_id');
    }
    public function state()
    {
        return $this->belongsTo(State::class,'state_id');
    }
}
