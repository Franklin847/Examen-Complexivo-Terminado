<?php

namespace App\Models\Ignug;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;
class Image extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    protected $connection = 'pgsql-ignug';
    protected $fillable = [
        'code',
        'name',
        'description',
        'type',
        'icon',
    ];

    public function imageable()
    {
        return $this->morphTo();
    }

    public function state()
    {
        return $this->belongsTo(State::class);
    }
}
