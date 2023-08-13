@extends('layouts.master')

@section('title')
One device as EDIT
@endsection

@section('content')
<style>
      h4{text-align: center;}
    </style>
<div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card_header">
                <h4 class="card-title" >Onedevice-Edit data</h4>
                 </div>
                 <form action="{{url('onedevices-update/'.$onedeviceus->id)}}" method="POST">
          <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        {{method_field('PUT')}}
          <div class="modal-body">
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">device_id:</label>
                <input type="text" name="deviceid" class="form-control" value="{{$onedeviceus->device_id}}">
              </div>
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">plant_id:</label>
                <input type="text" name="plantid" class="form-control" value="{{$onedeviceus->plant_id}}">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">plantname:</label>
                <input type="text" name="plantnme" class="form-control"value="{{$onedeviceus->plantname}}">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">Temperature:</label>
                <input type="text" name="temp" class="form-control"value="{{$onedeviceus->Temperature}}" >
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">Mositure:</label>
                <input type="text" name="mosi" class="form-control"value="{{$onedeviceus->Mositure}}">
              </div>

              <div class="mb-3">
                <label for="message-text" class="col-form-label">Humidity:</label>
                <input type="text" name="hum" class="form-control"value="{{$onedeviceus->Humidity}}" >
</div>
             

            
          </div>
          <div class="modal-footer">
            <a href="{{url('onedevicess')}}" class="btn btn-secondary" data-bs-dismiss="modal">Close</a>
            <button type="submit" class="btn btn-primary">UPDATE</button>
          </div>
</form>
      
    
</div>
</div>
</div>

@endsection