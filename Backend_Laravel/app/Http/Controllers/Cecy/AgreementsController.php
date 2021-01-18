<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Agreement;
use Illuminate\Http\Request;

class AgreementsController extends Controller
{
    public function index(Request $request)
    {
        $agreements = Agreement::all();

        return response()->json([
                'data' => [
                    'type' => 'agreements',
                    'attributes' => $agreements
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $agreements = Agreement::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'agreements',
                    'attributes' => $agreements
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        Agreement::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'agreements'
            ]
        ], 201);
    }

    public function update(Request $request, $id, Agreement $Agreement)
    {
        $data = $request->all();

        $Agreement = Agreement::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'agreements',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $agreements = Agreement::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'agreements'
            ]
        ], 201);
    }
}
