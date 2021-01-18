<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class SubtopicsCourse extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
        'name',
    ];
    public function course()
    {
        return $this->belongsTo(Course::class,'course_id');
    }
    public function state()
    {
        return $this->belongsTo(State::class,'state_id');
    }
}
