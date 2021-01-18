<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\SchoolPeriod;
use Illuminate\Http\Request;

class SchoolPeriodController extends Controller
{
    public function index(Request $request)
    {
        $school_period = SchoolPeriod::all();

        return response()->json([
                'data' => [
                    'type' => 'school_period',
                    'attributes' => $school_period
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $school_period = SchoolPeriod::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'school_period',
                    'attributes' => $school_period
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        SchoolPeriod::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'school_period'
            ]
        ], 201);
    }

    public function update(Request $request, $id, SchoolPeriod $SchoolPeriod)
    {
        $data = $request->all();

        $SchoolPeriod = SchoolPeriod::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'school_period',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $school_period = SchoolPeriod::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'school_period'
            ]
        ], 201);
    }
}
