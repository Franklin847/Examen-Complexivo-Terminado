<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Planification;
use Illuminate\Http\Request;

class PlanificationController extends Controller
{
    public function index(Request $request)
    {
        $planifications = Planification::all();

        return response()->json([
                'data' => [
                    'type' => 'planifications',
                    'attributes' => $planifications
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $planifications = Planifications::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'planifications',
                    'attributes' => $planifications
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        Planifications::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'planifications'
            ]
        ], 201);
    }

    public function update(Request $request, $id, Planifications $planifications)
    {
        $data = $request->all();

        $planifications = Planifications::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'planifications',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $planifications = Planifications::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'planifications'
            ]
        ], 201);
    }
}
