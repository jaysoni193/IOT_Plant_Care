<?php

namespace App\Http\Controllers\Admin;
use App\Models\Contacts;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ContactusController extends Controller
{
    //
    public function cont()
    {
        $contactus=Contacts::all();
    return view('admin.contactus')
    ->with('contactus',$contactus);
    }
    public function store2(Request $request)
    {
        $contactus=new Contacts;
        $contactus->name=$request->input('nme');
        $contactus-> email=$request->input('mail');
        $contactus-> phone=$request->input('ph');
        $contactus-> comment=$request->input('cmmt');
      

        $contactus->save();
        return redirect('/contacts')->with('success','Data Added for Contact Us');
    }
    public function add($id)
    {
        $contactus=Contacts::findOrFail($id);
        return view('admin.abouts.edit2')
        ->with('contactus',$contactus);
       // ->with('aboutus',)
    }
    public function updatee(Request $request,$id)
    {
        $contactus=Contacts::findOrFail($id);
        $contactus->name=$request->input('nme');
        $contactus-> email=$request->input('mail');
        $contactus-> phone=$request->input('ph');
        $contactus-> comment=$request->input('cmmt');
        $contactus->update();
        return redirect('contacts')->with('status','Data is updated for conatctus ');
    }
    public function delete2($id)
    {
        Contacts::find($id)->delete();
  
        return back();
    }
}
?>