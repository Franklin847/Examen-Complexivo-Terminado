<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\DetailRegistration;
use Illuminate\Http\Request;

class DetailRegistrationController extends Controller
{
    public function index(Request $request)
    {
        $detail_registration = DetailRegistration::all();

        return response()->json([
                'data' => [
                    'type' => 'detail_registration',
                    'attributes' => $detail_registration
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $detail_registration = DetailRegistration::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'detail_registration',
                    'attributes' => $detail_registration
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        DetailRegistration::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'detail_registration'
            ]
        ], 201);
    }

    public function update(Request $request, $id, DetailRegistration $DetailRegistration)
    {
        $data = $request->all();

        $DetailRegistration = DetailRegistration::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'detail_registration',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $detail_registration = DetailRegistration::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'detail_registration'
            ]
        ], 201);
    }
}
