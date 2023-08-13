@extends('layouts.master')


@section('title')
        Resgistered Edit
@endsection

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card_header">
                    <h1>Resgistered</h1>
                 </div>
                 
              <div class="card-body">
                <div class="row">
                    <div class="col_md_6">
                    <form action="/role-register-update/{{$users->id}}" method="POST">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        {{ method_field('PUT') }}
                     
                      <div class="form-group">
                           <label>Name</label>
                          <input type="text" class="form-control" name="username" value="{{ $users->name}}" >
                      </div>
                        <div class="form_group">
                          <label>Give Role</label>
                          <select name="usertype" class="form-control">
                              <option value="admin">Admin</option>
                              <option value="">None</option>
      </select>
      </div>
                          <button type="submit" class="btn btn-success">Update</button>
                          <a href ="/role-register" class="btn btn-danger">Cancel</a>
        
      </form>
</div>
</div>                
</div>
</div>
</div>
</div>
</div>


@endsection
@section('scripts')

@endsection