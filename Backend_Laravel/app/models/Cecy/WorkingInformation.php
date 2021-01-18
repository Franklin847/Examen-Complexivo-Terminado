<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class WorkingInformation extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
        'name',
        'address',
        'email',
        'phone',
        'activity',
        'summmary',
        'sponsor',
        'sponsor_name',
        'knowledge_course',
        'recomendation_course',
    ];
    public function user()
    {
        return $this->belongsTo(Instructor::class, 'instructor_id');
    }
    public function state()
    {
        return $this->belongsTo(State::class,'state_id');
    }
}
