@extends('layouts.master')


@section('title')
        About Us
@endsection

@section('content')
const myModal = new bootstrap.Modal('#myModal', {
  keyboard: false
})

<!doctype html>
<html lang="en">
  <head>
  <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body class="p-3 m-0 border-0 bd-example">
    
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="display: none;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Add Onedevice</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="/save-onedevices" method="POST">
          <input type="hidden" name="_token" value="{{ csrf_token() }}">
          <div class="modal-body">
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">device_id:</label>
                <input type="text" name="deviceid" class="form-control" id="recipient-name">
              </div>
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">plant_id:</label>
                <input type="text" name="plantid" class="form-control" id="recipient-name">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">plantname:</label>
                <input type="text" name="plantnme" class="form-control" id="recipient-name">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">Temperature:</label>
                <input type="text" name="temp" class="form-control" id="recipient-name">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">Mositure:</label>
                <input type="text" name="mosi" class="form-control" id="recipient-name">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">Humidity:</label>
                <input type="text" name="hum" class="form-control" id="recipient-name">
              </div>
              

            
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Save</button>
          </div>
</form>
        </div>
      </div>
    </div>
    
    <!-- End Example Code -->
  </body>
</html>

<div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title"> One device & multiple device
                <button type="button" class="btn btn-primary float-right" data-bs-toggle="modal" data-bs-target="#exampleModal">ADD</button>
                </h4>
                @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                 @endif
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
                    <th>id</th>
                      <th>device_id</th>
                      <th>plant_id </th>
                      <th>plantname</th>
                      <th>Temperature</th>
                      <th>Mositure</th>
                      <th>Humidity</th>
                      
                      <th>EDIT</th>
                      <th>DELETE</th>
                    </thead>
                    <tbody>
                      @foreach($onedeviceus as $max)
                      <tr>
                      <td> {{$max->id}} </td>
                      <td> {{$max->device_id}} </td>
                      <td> {{$max->plant_id}} </td>
                      <td> {{$max->plantname}} </td>
                      <td> {{$max->Temperature}} </td> 
                      <td> {{$max->Mositure}} </td> 
                      <td> {{$max->Humidity}} </td>    
                       
                        <td>
                        <a href="{{url('onedevices-us/'.$max->id)}}" class="btn btn-success">EDIT</a>
                        </td>
                        <td>
                        <form method="POST" action="{{ route('onedevices.delete', $max->id) }}">
                          <input type="hidden" name="_token" value="{{ csrf_token() }}">
                          {{method_field('DELETE')}}
                          <button type="submit" class="btn btn-xs btn-danger btn-flat show_confirm" data-toggle="tooltip" title='Delete'>DELETE</button>
                        
</form>
                      </td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
@endsection

@section('scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
<script type="text/javascript">
 
     $('.show_confirm').click(function(event) {
          var form =  $(this).closest("form");
          var name = $(this).data("name");
          event.preventDefault();
          swal({
              title: `Are you sure you want to delete this record?`,
              text: "If you delete this, it will be gone forever.",
              icon: "warning",
              buttons: true,
              dangerMode: true,
          })
          .then((willDelete) => {
            if (willDelete) {
              form.submit();
            }
          });
      });
  
</script
@endsection