<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Cecy\Instructor;
use Faker\Generator as Faker;

$factory->define(Instructor::class, function (Faker $faker) {
    return [
      'state_id' => 1,
    ];
});
