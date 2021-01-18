<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class ProfileInstructorCourse extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
        'required_knowledge',
        'required_experience',
        'required_skills',
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
