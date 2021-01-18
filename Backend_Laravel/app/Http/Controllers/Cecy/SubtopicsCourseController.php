<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\SubtopicsCourse;
use Illuminate\Http\Request;

class SubtopicsCourseController extends Controller
{
    public function index(Request $request)
    {
        $subtopics_course = SubtopicsCourse::all();

        return response()->json([
                'data' => [
                    'type' => 'subtopics_course',
                    'attributes' => $subtopics_course
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $subtopics_course = SubtopicsCourse::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'subtopics_course',
                    'attributes' => $subtopics_course
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        SubtopicsCourse::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'subtopics_course'
            ]
        ], 201);
    }

    public function update(Request $request, $id, SubtopicsCourse $SubtopicsCourse)
    {
        $data = $request->all();

        $SubtopicsCourse = SubtopicsCourse::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'subtopics_course',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $subtopics_course = SubtopicsCourse::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'subtopics_course'
            ]
        ], 201);
    }
}
