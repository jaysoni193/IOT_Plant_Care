@extends('layouts.master')

@section('title')
Device as EDIT
@endsection

@section('content')
<style>
      h4{text-align: center;}
    </style>
<div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card_header">
                <h4 class="card-title" >Contactus-Edit data</h4>
                 </div>
                 <form action="{{url('contactus-update/'.$contactus->id)}}" method="POST">
          <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        {{method_field('PUT')}}
          <div class="modal-body">
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">name:</label>
                <input type="text" name="nme" class="form-control" value="{{$contactus->name}}">
              </div>
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">email:</label>
                <input type="text" name="mail" class="form-control" value="{{$contactus->email}}">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">phone:</label>
                <input type="text" name="ph" class="form-control"value="{{$contactus->phone}}">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">comment:</label>
                <input type="text" name="cmmt" class="form-control"value="{{$contactus->comment}}" >
              </div>
             

            
          </div>
          <div class="modal-footer">
            <a href="{{url('contacts')}}" class="btn btn-secondary" data-bs-dismiss="modal">Close</a>
            <button type="submit" class="btn btn-primary">UPDATE</button>
          </div>
</form>
      
    
</div>
</div>
</div>

@endsection