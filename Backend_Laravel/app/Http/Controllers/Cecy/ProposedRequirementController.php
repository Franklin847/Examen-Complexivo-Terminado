<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\ProposedRequirement;
use Illuminate\Http\Request;

class ProposedRequirementController extends Controller
{
    public function index(Request $request)
    {
        $proposed_requirement = ProposedRequirement::all();

        return response()->json([
                'data' => [
                    'type' => 'proposed_requirement',
                    'attributes' => $proposed_requirement
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $proposed_requirement = ProposedRequirement::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'proposed_requirement',
                    'attributes' => $proposed_requirement
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        ProposedRequirement::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'proposed_requirement'
            ]
        ], 201);
    }

    public function update(Request $request, $id, ProposedRequirement $ProposedRequirement)
    {
        $data = $request->all();

        $ProposedRequirement = ProposedRequirement::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'proposed_requirement',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $proposed_requirement = ProposedRequirement::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'proposed_requirement'
            ]
        ], 201);
    }
}
