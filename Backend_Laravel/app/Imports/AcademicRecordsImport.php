<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToModel;
use App\Models\Cecy\Registration;

class AcademicRecordsImport implements ToModel
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $collection)
    {
        //
    }

    /**
     * @param array $row
     *
     * @return User|null
     */
    public function model(array $row)
    {
        return new Registration([
           'date_registration' => $row[0],
           'number' => $row[1], 
           'state_id' => $row[2],
           'participant_id' => $row[3],
           'type_id' => $row[4],
           'planification_id' => $row[5],
        ]);
    }
}
