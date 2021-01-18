<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\TargetGroup;
use Illuminate\Http\Request;

class TargetGroupController extends Controller
{
    public function index(Request $request)
    {
        $target_group = TargetGroup::all();

        return response()->json([
                'data' => [
                    'type' => 'target_group',
                    'attributes' => $target_group
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $target_group = TargetGroup::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'target_group',
                    'attributes' => $target_group
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        TargetGroup::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'target_group'
            ]
        ], 201);
    }

    public function update(Request $request, $id, TargetGroup $TargetGroup)
    {
        $data = $request->all();

        $TargetGroup = TargetGroup::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'target_group',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $target_group = TargetGroup::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'target_group'
            ]
        ], 201);
    }
}
