<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Registration;
use Illuminate\Http\Request;
use App\Imports\AcademicRecordsImport;
use Maatwebsite\Excel\Facades\Excel;

class RegistrationController extends Controller
{
    public function index(Request $request)
    {
        $registration = Registration::all();

        return response()->json([
                'data' => [
                    'type' => 'registration',
                    'attributes' => $registration
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $registration = Registration::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'registration',
                    'attributes' => $registration
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        Registration::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'registration'
            ]
        ], 201);
    }

    public function update(Request $request, $id, Registration $Registration)
    {
        $data = $request->all();

        $Registration = Registration::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'registration',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $registration = Registration::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'registration'
            ]
        ], 201);
    }

    public function import() 
    {
        Excel::import(new AcademicRecordsImport, request()->file('your_file'));
        
        return response()->json([
            'data' => [
                'msm' => "OK",
                'type' => 'import Academic Records'
            ]
        ], 201);
        // return redirect('/')->with('success', 'All good!');
    }
}
