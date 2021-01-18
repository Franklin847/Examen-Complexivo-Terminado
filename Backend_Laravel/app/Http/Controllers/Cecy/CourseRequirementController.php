<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\CourseRequirement;
use Illuminate\Http\Request;

class CourseRequirementController extends Controller
{
    public function index(Request $request)
    {
        $course_requirement = CourseRequirement::all();

        return response()->json([
                'data' => [
                    'type' => 'course_requirement',
                    'attributes' => $course_requirement
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $course_requirement = CourseRequirement::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'course_requirement',
                    'attributes' => $course_requirement
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        CourseRequirement::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'course_requirement'
            ]
        ], 201);
    }

    public function update(Request $request, $id, CourseRequirement $CourseRequirement)
    {
        $data = $request->all();

        $CourseRequirement = CourseRequirement::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'course_requirement',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $course_requirement = CourseRequirement::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'course_requirement'
            ]
        ], 201);
    }
}
