<?php

namespace App\Http\Controllers\Cecy;

use App\Http\Controllers\Controller;
use App\Models\Cecy\AgreementCompany;
use Illuminate\Http\Request;

class AgreementCompanyController extends Controller
{
    public function index(Request $request)
    {
        $agreement_company = AgreementCompany::all();

        return response()->json([
                'data' => [
                    'type' => 'agreement_company',
                    'attributes' => $agreement_company
                ]]
            , 200);
    }

    public function filter(Request $request)
    {
        $agreement_company = AgreementCompany::where('name', $request->name)->orderBy('name')->get();
        return response()->json([
                'data' => [
                    'type' => 'agreement_company',
                    'attributes' => $agreement_company
                ]]
            , 200);
    }

    public function store(Request $request)
    {
        $data = $request->all();

        AgreementCompany::create($data);
        return response()->json([
            'data' => [
                'attributes' => $data,
                'type' => 'agreement_company'
            ]
        ], 201);
    }

    public function update(Request $request, $id, AgreementCompany $AgreementCompany)
    {
        $data = $request->all();

        $AgreementCompany = AgreementCompany::where('id', $id)->update($data);
        return response()->json([
            'data' => [
                'type' => 'agreement_company',
                'attributes' => $data
            ]
        ], 200);
    }

    public function destroy($id)
    {
        $agreement_company = AgreementCompany::destroy($id);
        return response()->json([
            'data' => [
                'attributes' => $id,
                'type' => 'agreement_company'
            ]
        ], 201);
    }
}
