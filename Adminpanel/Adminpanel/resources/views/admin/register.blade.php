@extends('layouts.master')


@section('title')
        Resgistered Roles
@endsection

@section('content')
<div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title"> Admin Profile</h4>
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
                    <th>Id</th>
                      <th>Name</th>
                      <th> Phone</th>
                      <th>Email</th>
                      <th>Usertype</th>
                      <th>EDIT</th>
                      <th>DELETE</th>
                    </thead>
                    <tbody>
                        @foreach($users as $row)
                        
                      <tr>
                        <td> {{$row->id}} </td>
                      <td> {{$row->name}} </td>
                      <td>  {{$row->phone}}</td>
                      <td>  {{$row->email}} </td>
                      <td>  {{$row->usertype}} </td>
                        <td> 
                            <a href="/role-edit/{{$row->id}}" class="btn btn-success">EDIT</a>
                         </td>  
                         <td> 
                         <!-- <form action="/role-delete/{{$row->id}}" method="POST">
                          <input type="hidden" name="_token" value="{{ csrf_token() }}">
                             {{ method_field('DELETE') }}
                     
                            <button type="submit" class="btn btn-danger">DELETE</button>-->
                            <form method="POST" action="{{ route('user.delete', $row->id) }}">
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