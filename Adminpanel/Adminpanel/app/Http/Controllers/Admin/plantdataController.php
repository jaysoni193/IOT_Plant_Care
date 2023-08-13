<?php

namespace App\Http\Controllers\Admin;
use App\Models\Plants;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class plantdataController extends Controller
{
    public function plnt()
    {
       
        $plantus=Plants::all();
        return view('admin.plantdata')
        ->with('plantus',$plantus);;
    }
    public function store1(Request $request)
    {
        $plantus=new Plants;
        $plantus->plant_id=$request->input('plantid');
        $plantus-> plantname=$request->input('plantnme');
         $plantus-> image=$request->input('imge');
         $plantus-> short_description=$request->input('short_desc');
        $plantus-> description=$request->input('desc');
        if($request->hasfile('image'))
        {
            $file=$request->file('image');
            $extention=$file->getClientOriginalExtension();
            $filename=time().'.'.$extention;
            $file->move('storage/image/',$filename);
            $plantus->image=$filename;
        }

        $plantus->save();
        return redirect('/plants')->with('success','Data Added for plant database');
    }
    public function edit1($id)
    {
         $plantus=Plants::findOrFail($id);
        return view('admin.abouts.edit1')
        ->with('plantus',$plantus);
       // ->with('aboutus',)
    }
    public function update1(Request $request,$id)
    {
      $plantus=new Plants;
      $plantus->plant_id=$request->input('plantid');
      $plantus-> plantname=$request->input('plantnme');
       $plantus-> image=$request->input('imge');
       $plantus-> short_description=$request->input('short_desc');
      $plantus-> description=$request->input('desc');
        $plantus->update();
        return redirect('/plants')->with('status','Data is updated for Plant database ');
    }
    public function delete1($id)
    {
        $plantus=Plants::findOrFail($id);
        $plantus->delete();
        return redirect('/plants')->with('status','Data delete of plant database');
    }
}
?>