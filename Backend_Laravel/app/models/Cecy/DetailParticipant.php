<?php

namespace App\Models\Cecy;

use App\User;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class DetailParticipant extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [];

    public function user()
    {
        return $this->belongsTo(Participant::class,'participant_id');
    }

}
