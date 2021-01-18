<?php

namespace App\Models\Cecy;

use App\User;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Participant extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [];

    public function user()
    {
        return $this->belongsTo(Instructor::class,'user_id');
    }

    public function state()
    {
        return $this->belongsTo(State::class,'state_id');
    }

    public function participant()
    {
        return $this->belongsTo(Catalogue::class,'person_type_id');
    }
}
