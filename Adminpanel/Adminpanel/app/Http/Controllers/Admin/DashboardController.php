<?php

namespace App\Http\Controllers\Admin;
use App\Models\User;
use App\Models\Abouts;
use App\Models\Plants;
use App\Models\Onedevices;
use App\Models\Contacts;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public  function index1()
    {
            $totalabouts=Abouts::count();
            $totalcontact=Contacts::count();
            $totalplant=Plants::count();
            $totalAllUser=User::count();
            $totalUser = User::whereNull('usertype')->count();
   
                    
            $totalAdmin=User::where('usertype','admin')->count();
            $totalonedev=Onedevices::count();
            
           

            return view('admin.dashboard',compact('totalabouts','totalcontact','totalplant','totalAllUser','totalAdmin','totalUser','totalonedev'));

    }
   
    public function registered()
    
    {
        $users=User::all();
        return view('admin.register')->with('users',$users);
    }
    public function registeredit(Request $request,$id)
    {
            $users = User::findOrFail($id);
            return view('admin.register-edit')->with('users',$users);
    }
    public function registerupdate(Request $request,$id)
    {
        $users=User::find($id);
        $users->name=$request->input('username');
        $users->usertype=$request->input('usertype');
        $users->update();
        return redirect('/role-register')->with('status','Your Data is Updated');
    }
    public function registerdelete( Request $request, $id)
    {
        User::find($id)->delete();
  
        return back();
        
    }
}
?>