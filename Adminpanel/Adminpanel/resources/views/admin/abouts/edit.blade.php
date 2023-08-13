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
                <h4 class="card-title" >Device-Edit data</h4>
                 </div>
                 <form action="{{url('aboutus-update/'.$aboutus->id)}}" method="POST">
          <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        {{method_field('PUT')}}
          <div class="modal-body">
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">device_id:</label>
                <input type="text" name="deviceid" class="form-control" value="{{$aboutus->device_id}}">
              </div>
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">user_id:</label>
                <input type="text" name="userid" class="form-control" value="{{$aboutus->user_id}}">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">Temperature:</label>
                <input type="text" name="temp" class="form-control"value="{{$aboutus->Temperature}}">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">Moisture:</label>
                <input type="text" name="mosi" class="form-control"value="{{$aboutus->Mositure}}" >
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">Humidity:</label>
                <input type="text" name="hum" class="form-control" value="{{$aboutus->Humidity}}">
              </div>

            
          </div>
          <div class="modal-footer">
            <a href="{{url('abouts')}}" class="btn btn-secondary" data-bs-dismiss="modal">Close</a>
            <button type="submit" class="btn btn-primary">UPDATE</button>
          </div>
</form>
      
    
</div>
</div>
</div>

@endsection