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
                <h4 class="card-title" >Plant database-Edit data</h4>
                 </div>
                 <form action="{{url('plantus-update/'.$plantus->id)}}" method="POST">
          <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        {{method_field('PUT')}}
          <div class="modal-body">
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">plant_id:</label>
                <input type="text" name="plantid" class="form-control" value="{{$plantus->plantid}}">
              </div>
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">plantname:</label>
                <input type="text" name="plantnme" class="form-control" value="{{$plantus->plantname}}">
              </div>
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">image:</label>
                <input type="text" name="imge" class="form-control" value="{{$plantus->image}}">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">short_description:</label>
                <input type="text" name="short_desc" class="form-control"value="{{$plantus->shortdescription}}">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">description:</label>
                <input type="text" name="desc" class="form-control"value="{{$plantus->description}}" >
</div>
            
          </div>
          <div class="modal-footer">
            <a href="{{url('plants')}}" class="btn btn-secondary" data-bs-dismiss="modal">Close</a>
            <button type="submit" class="btn btn-primary">UPDATE</button>
          </div>
</form>
      
    
</div>
</div>
</div>

@endsection