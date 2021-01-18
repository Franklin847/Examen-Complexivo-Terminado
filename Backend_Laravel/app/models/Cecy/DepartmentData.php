<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class DepartmentData extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
        'name',
        'address',
    ];
    public function user()
    {
        return $this->belongsTo(Instructor::class,'charge_id');
    }
    public function schedule()
    {
        return $this->belongsTo(Catalogue::class,'schedule_id');
    }
    public function state()
    {
        return $this->belongsTo(State::class,'state_id');
    }
}
