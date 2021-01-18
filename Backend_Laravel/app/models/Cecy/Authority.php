<?php

namespace App\Models\Cecy;


use App\User;
use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Authority extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;

    protected $connection = 'pgsql-cecy';
    protected $fillable = [];


    public function position()
    {
        return $this->belongsTo(Catalogue::class,'position_id');
    }

    public function status()
    {
        return $this->belongsTo(Catalogue::class,'status_id');
    }
}
