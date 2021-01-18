<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Registration extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
        'date_registration',
        'number',
    ];
    public function state()
    {
        return $this->belongsTo(State::class,'state_id');
    }
    public function user()
    {
        return $this->belongsTo(Participant::class,'participant_id');
    }
    public function registration()
    {
        return $this->hasMany(Catalogue::class, 'type_id');
    }
    public function planifications()
    {
        return $this->hasMany(Planification::class, 'planification_id');
    }
}
