<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\ProposalCourses;
use Illuminate\Http\Request;

class ProposalCoursesController extends Controller
{
    public function index(Request $request)
    {
        $proposal_courses = ProposalCourses::all();

        return response()->json([
                'data' => [
                    'type' => 'proposal_courses',
                    'attributes' => $proposal_courses
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $proposal_courses = ProposalCourses::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'proposal_courses',
                    'attributes' => $proposal_courses
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        ProposalCourses::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'proposal_courses'
            ]
        ], 201);
    }

    public function update(Request $request, $id, ProposalCourses $ProposalCourses)
    {
        $data = $request->all();

        $ProposalCourses = ProposalCourses::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'proposal_courses',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $proposal_courses = ProposalCourses::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'proposal_courses'
            ]
        ], 201);
    }
}
