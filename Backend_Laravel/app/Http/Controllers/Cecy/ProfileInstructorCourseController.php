<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\ProfileInstructorCourse;
use Illuminate\Http\Request;

class ProfileInstructorCourseController extends Controller
{
    public function index(Request $request)
    {
        $profile_instructor_course = ProfileInstructorCourse::all();

        return response()->json([
                'data' => [
                    'type' => 'profile_instructor_course',
                    'attributes' => $profile_instructor_course
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $profile_instructor_course = ProfileInstructorCourse::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'profile_instructor_course',
                    'attributes' => $profile_instructor_course
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        ProfileInstructorCourse::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'profile_instructor_course'
            ]
        ], 201);
    }

    public function update(Request $request, $id, ProfileInstructorCourse $ProfileInstructorCourse)
    {
        $data = $request->all();

        $ProfileInstructorCourse = ProfileInstructorCourse::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'profile_instructor_course',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $profile_instructor_course = ProfileInstructorCourse::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'profile_instructor_course'
            ]
        ], 201);
    }
}
