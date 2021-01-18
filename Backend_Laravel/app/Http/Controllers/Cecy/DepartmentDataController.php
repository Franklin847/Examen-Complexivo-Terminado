<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\DepartmentData;
use Illuminate\Http\Request;

class DepartmentDataController extends Controller
{
    public function index(Request $request)
    {
        $department_data = DepartmentData::all();

        return response()->json([
                'data' => [
                    'type' => 'department_data',
                    'attributes' => $department_data
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $department_data = DepartmentData::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'department_data',
                    'attributes' => $department_data
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        DepartmentData::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'department_data'
            ]
        ], 201);
    }

    public function update(Request $request, $id, DepartmentData $DepartmentData)
    {
        $data = $request->all();

        $DepartmentData = DepartmentData::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'department_data',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $department_data = DepartmentData::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'department_data'
            ]
        ], 201);
    }
}
