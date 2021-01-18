<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\CourseInstructor;
use Illuminate\Http\Request;

class CourseInstructorController extends Controller
{
    public function index(Request $request)
    {
        $course_instructor = CourseInstructor::all();

        return response()->json([
                'data' => [
                    'type' => 'course_instructor',
                    'attributes' => $course_instructor
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $course_instructor = CourseInstructor::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'course_instructor',
                    'attributes' => $course_instructor
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        CourseInstructor::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'course_instructor'
            ]
        ], 201);
    }

    public function update(Request $request, $id, CourseInstructor $CourseInstructor)
    {
        $data = $request->all();

        $CourseInstructor = CourseInstructor::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'course_instructor',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $course_instructor = CourseInstructor::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'course_instructor'
            ]
        ], 201);
    }
}
