<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Instructor extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
    ];
    public function state()
    {
        return $this->belongsTo(State::class,'state_id');
    }
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }
}
