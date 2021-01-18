<?php

namespace App\Models\Cecy;
use App\Models\Ignug\Career as IgnugCareer;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Course extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [
      'code',
      'name',
      'cost',
      'photo',
      'summary',
      'duration',
      'free',
      'observation',
      'objective',
      'needs' => 'array',
      'facilities' => 'array',
      'theoretical_phase' => 'array',
      'practical_phase' => 'array',
      'cross_cutting_topics' => 'array',
      'bibliography' => 'array',
      'teaching_strategies' => 'array',
      'required_installing_sources',
      'practice_hours',
      'theory_hours',
      'practice_required_resources',
      'aimtheory_required_resources',
      'learning_teaching_strategy',
      'proposed_date',
      'approval_date',
      'need_date',
      'local_proposal',
      'schedules_id',
      'canton_dictate_id',
      'project',
      'capacity',
      'capacitation_type_id',
      'career_id',
      'entity_certification_type_id',
      'setec_name'
    ];
    public function modality()
    {
        return $this->hasMany(Catalogue::class, 'modality_id');
    }
    public function state()
    {
        return $this->belongsTo(State::class,'state_id');
    }
    public function type()
    {
        return $this->belongsTo(Catalogue::class, 'participant_type_id');
    }
    public function area()
    {
        return $this->belongsTo(Catalogue::class, 'area_id');
    }
    public function level()
    {
        return $this->belongsTo(Catalogue::class, 'level_id');
    }
    public function user()
    {
        return $this->belongsTo(User::class,'person_proposal_id');
    }
    public function schedules()
    {
        return $this->belongsTo(Schedule::class,'schedules_id');
    }
    // public function classroom()
    // {
    //     return $this->belongsTo(Classroom::class,'classroom_id');
    // }
    public function course()
    {
        return $this->belongsTo(Catalogue::class,'course_type_id');
    }
    public function specialty()
    {
        return $this->belongsTo(Catalogue::class,'specialty_id');
    }
    public function period()
    {
        return $this->belongsTo(Catalogue::class,'academic_period_id');
    }
    public function career()
    {
        return $this->belongsTo(IgnugCareer::class,'career_id');
    }
    public function capacitation()
    {
        return $this->belongsTo(Catalogue::class,'capacitation_type_id');
    }
    public function entity()
    {
        return $this->belongsTo(Catalogue::class,'entity_certification_type_id');
    }
    public function canton()
    {
        return $this->belongsTo(Catalogue::class,'canton_dictate_id');
    }
}
