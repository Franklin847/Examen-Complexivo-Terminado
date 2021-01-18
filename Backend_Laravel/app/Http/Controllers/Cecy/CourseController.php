<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Course;
use Illuminate\Http\Request;

class CourseController extends Controller
{
    public function index(Request $request)
    {
        $courses = Course::all();

        return response()->json([
                'data' => [
                    'type' => 'courses',
                    'attributes' => $courses
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $courses = Course::where('for_free', $request->for_free)->orderBy('id')->get();
        return response()->json([
                'data' => [
                    'type' => 'courses',
                    'attributes' => $courses
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        Course::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'courses'
            ]
        ], 201);
    }

    public function update(Request $request, $id, Course $Course)
    {
        $data = $request->all();

        $Course = Course::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'courses',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $courses = Course::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'courses'
            ]
        ], 201);
    }
}
