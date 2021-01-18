<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\Participant;
use Illuminate\Http\Request;

class ParticipantController extends Controller
{
    public function index(Request $request)
    {
        $participant = Participant::all();

        return response()->json([
                'data' => [
                    'type' => 'participant',
                    'attributes' => $participant
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $participant = Participant::where('free', $request->free)->orderBy('id')->get();
        return response()->json([
                'data' => [
                    'type' => 'participant',
                    'attributes' => $participant
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        Participant::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'participant'
            ]
        ], 201);
    }

    public function update(Request $request, $id, Participant $Participant)
    {
        $data = $request->all();

        $Participant = Participant::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'participant',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $participant = Participant::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'participant'
            ]
        ], 201);
    }
}
