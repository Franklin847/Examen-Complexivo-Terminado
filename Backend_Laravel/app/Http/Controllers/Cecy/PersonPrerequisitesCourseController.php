<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\PersonPrerequisitesCourse;
use Illuminate\Http\Request;

class PersonPrerequisitesCourseController extends Controller
{
    public function index(Request $request)
    {
        $person_prerequisites_course = PersonPrerequisitesCourse::all();

        return response()->json([
                'data' => [
                    'type' => 'person_prerequisites_course',
                    'attributes' => $person_prerequisites_course
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $person_prerequisites_course = PersonPrerequisitesCourse::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'person_prerequisites_course',
                    'attributes' => $person_prerequisites_course
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        PersonPrerequisitesCourse::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'person_prerequisites_course'
            ]
        ], 201);
    }

    public function update(Request $request, $id, PersonPrerequisitesCourse $PersonPrerequisitesCourse)
    {
        $data = $request->all();

        $PersonPrerequisitesCourse = PersonPrerequisitesCourse::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'person_prerequisites_course',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $person_prerequisites_course = PersonPrerequisitesCourse::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'person_prerequisites_course'
            ]
        ], 201);
    }
}
