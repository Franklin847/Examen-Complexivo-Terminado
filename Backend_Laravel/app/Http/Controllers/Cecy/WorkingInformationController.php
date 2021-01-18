<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\WorkingInformation;
use Illuminate\Http\Request;

class WorkingInformationController extends Controller
{
    public function index(Request $request)
    {
        $working_information = WorkingInformation::all();

        return response()->json([
                'data' => [
                    'type' => 'working_information',
                    'attributes' => $working_information
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $working_information = WorkingInformation::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'working_information',
                    'attributes' => $working_information
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        WorkingInformation::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'working_information'
            ]
        ], 201);
    }

    public function update(Request $request, $id, WorkingInformation $WorkingInformation)
    {
        $data = $request->all();

        $WorkingInformation = WorkingInformation::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'working_information',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $working_information = WorkingInformation::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'working_information'
            ]
        ], 201);
    }
}
