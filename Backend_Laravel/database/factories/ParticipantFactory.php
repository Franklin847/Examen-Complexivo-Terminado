<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Cecy\Participant;
use Faker\Generator as Faker;

$factory->define(Participant::class, function (Faker $faker) {
    return [
        'state_id' => 1,
        'person_type_id' => 21
    ];
});
