<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class ProposalCourses extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
    ];
    public function user()
    {
        return $this->belongsTo(User::class,'person_instructor_id');
    }

    public function course()
    {
        return $this->belongsTo(Course::class,'course_code_id');
    }

    public function type()
    {
        return $this->belongsTo(Catalogue::class,'course_type_id');
    }
    public function state()
    {
        return $this->belongsTo(State::class,'state_id');
    }
}
