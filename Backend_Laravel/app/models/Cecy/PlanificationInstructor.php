<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class PlanificationInstructor extends Model implements Auditable
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
        return $this->belongsTo(Instructor::class,'instructor_id');
    }
    public function planification()
    {
        return $this->belongsTo(Planification::class,'planification_id');
    }
    public function detail()
    {
        return $this->belongsTo(DetailRegistration::class,'detail_registration_id');
    }
}
