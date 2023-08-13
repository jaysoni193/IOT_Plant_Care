<?php

namespace App\Http\Controllers\Admin;
use App\Models\Abouts;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AboutusController extends Controller
{
    public function index()
    {
        $aboutus=Abouts::all();
    return view('admin.aboutus')
    ->with('aboutus',$aboutus);
    }
    public function store(Request $request)
    {
        $aboutus=new Abouts;
        $aboutus->device_id=$request->input('deviceid');
        $aboutus-> user_id=$request->input('userid');
        $aboutus-> Temperature=$request->input('temp');
        $aboutus-> mositure=$request->input('mosi');
        $aboutus-> humidity=$request->input('hum');

        $aboutus->save();
        return redirect('/abouts')->with('success','Data Added for About Us');
    }
    public function edit($id)
    {
         $aboutus=Abouts::findOrFail($id);
        return view('admin.abouts.edit')
        ->with('aboutus',$aboutus);
       // ->with('aboutus',)
    }
    public function update(Request $request,$id)
    {
        $aboutus=Abouts::findOrFail($id);
        $aboutus->device_id=$request->input('deviceid');
        $aboutus-> user_id=$request->input('userid');
        $aboutus-> Temperature=$request->input('temp');
        $aboutus-> mositure=$request->input('mosi');
        $aboutus-> humidity=$request->input('hum');
        $aboutus->update();
        return redirect('abouts')->with('status','Data is updated for Device ');
    }
    public function delete($id)
    {
        Abouts::find($id)->delete();
  
        return back();
    }
}
?>