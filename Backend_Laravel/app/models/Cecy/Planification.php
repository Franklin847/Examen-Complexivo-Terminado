<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Planification extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
        'date_start',
        'date_end',
        'classroom',
        'free',
        'planned_end_date',
        'capacity',
    ];
    protected $casts = [
        'needs'=>'array',
        
    ];
    public function state()
    {
        return $this->belongsTo(State::class,'state_id');
    }
    public function user()
    {
        return $this->belongsTo(Instructor::class,'teacher_id');
    }
    public function course()
    {
        return $this->belongsTo(Course::class,'course_id');
    }
    public function schedules()
    {
        return $this->hasMany(Schedule::class,'schedule_id');
    }
    public function school_period()
    {
        return $this->hasMany(SchoolPeriod::class,'school_period_id');
    }
    public function conference()
    {
        return $this->belongsTo(Catalogue::class,'conference');
    }
    public function parallel()
    {
        return $this->belongsTo(Catalogue::class,'parallel');
    }
    public function site_dictate()
    {
        return $this->belongsTo(Catalogue::class,'site_dictate');
    }
}
