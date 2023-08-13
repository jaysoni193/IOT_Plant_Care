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
        @if(session('status'))
        <h6 class="alert alert-success">{{session('status')}}</h6>
        @endif
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Add Plant Databse</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <form action="{{ url('image.store') }}" method="POST" class="shadow p-12" enctype="multipart/form-data">
          <input type="hidden" name="_token" value="{{ csrf_token() }}">
          <div class="modal-body">
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">plant_id:</label>
                <input type="text" name="plantid" class="form-control" id="recipient-name">
              </div>
              <div class="mb-3">
                <label for="recipient-name" class="col-form-label">plantname:</label>
                <input type="text" name="plantnme" class="form-control" id="recipient-name">
              </div>
              @csrf
                <label class="block mb-4">Image
                    <span class="sr-only">Choose File</span>
                    <input type="file" name="image"
                        class="block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-full file:border-0 file:text-sm file:font-semibold file:bg-blue-50 file:text-blue-700 hover:file:bg-blue-100" />
                </label>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">short_description:</label>
                <input type="text" name="short_desc" class="form-control" id="recipient-name">
              </div>
              <div class="mb-3">
                <label for="message-text" class="col-form-label">description:</label>
                <input type="text" name="desc" class="form-control" id="recipient-name">
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
                <h4 class="card-title"> Plant database
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
                      <th>plant_id</th>
                      <th> plantname</th>
                      <th>image</th>
                      <th>short_description</th>
                      <th>description</th>
                      <th>EDIT</th>
                      <th>DELETE</th>
                    </thead>
                    <tbody>
                      @foreach($plantus as $dat)
                      <tr>
                      <td> {{$dat->id}} </td>
                      <td> {{$dat->plant_id}} </td>
                      <td> {{$dat->plantname}} </td>
                      <td>{{$dat->image}}</td>
                        <td> {{$dat->short_description}} </td>
                      <td> {{$dat->description}} </td>  
                      
                        <td>
                        <a href="{{url('plant-us/'.$dat->id)}}" class="btn btn-success">EDIT</a>
                        </td>
                        <td>
                        <form method="POST" action="{{ route('plants.delete', $dat->id) }}">
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