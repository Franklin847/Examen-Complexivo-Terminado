<?php

namespace App\Models\Cecy;
use App\Models\Ignug\Career as IgnugCareer;
use App\Models\Ignug\State as IgnugState;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Topic extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
      'description',
      'parent_code_id'
    ];

    public function state()
    {
        return $this->belongsTo(IgnugState::class,'state_id');
    }
    public function course()
    {
        return $this->belongsTo(Course::class, 'course_id');
    }
    public function type()
    {
        return $this->belongsTo(Catalogue::class, 'type_id');
    }
    
}