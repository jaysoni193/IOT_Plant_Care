<?php

namespace App\Http\Controllers\Admin;
use App\Models\Onedevices;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class OneedeviceController extends Controller
{
    public function one()
    {
        $onedeviceus=Onedevices::all();
    return view('admin.onedevices')
    ->with('onedeviceus',$onedeviceus);
    }
    public function store3(Request $request)
    {
        $onedeviceus=new Onedevices;
        $onedeviceus->device_id=$request->input('deviceid');
        $onedeviceus->plant_id=$request->input('plantid');
        $onedeviceus->plantname=$request->input('plantnme');
        $onedeviceus->Temperature=$request->input('temp');
        $onedeviceus->Mositure=$request->input('mosi');
        $onedeviceus->Humidity=$request->input('hum');
      

        $onedeviceus->save();
        return redirect('/onedevicess')->with('success','Data Added for one device ');
    }
    public function add2($id)
    {
        $onedeviceus=Onedevices::findOrFail($id);
        return view('admin.abouts.edit4')
        ->with('onedeviceus',$onedeviceus);
       // ->with('aboutus',)
    }
    public function updatee2(Request $request,$id)
    { $onedeviceus=new Onedevices;
        $onedeviceus->device_id=$request->input('deviceid');
        $onedeviceus->plant_id=$request->input('plantid');
        $onedeviceus->plantname=$request->input('plantnme');
        $onedeviceus->Temperature=$request->input('temp');
        $onedeviceus->Mositure=$request->input('mosi');
        $onedeviceus->Humditiy=$request->input('hum');
        
        $onedeviceus->update();
        return redirect('onedevicess')->with('status','Data is updated for onedevices ');
    }
    public function delete3($id)
    {
        Onedevices::find($id)->delete();
  
        return back();
    }
}
?>