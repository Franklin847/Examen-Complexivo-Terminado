<?php

namespace App\Models\Cecy;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Requirement extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [

    ];
    public function requirement()
    {
        return $this->hasMany(Catalogue::class,'requirement_type_id');
    }
    public function course()
    {
        return $this->belongsTo(Course::class,'course_id');
    }
    public function state()
    {
        return $this->belongsTo(State::class,'state_id');
    }
}
