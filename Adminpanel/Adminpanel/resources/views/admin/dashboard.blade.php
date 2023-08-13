@extends('layouts.master')


@section('title')
        Dashboard
@endsection

@section('content')
<div class="row">
    <div class="col-md-12 grid-margin">
      @if(session('message'))
      <h6 class="alert alert-success">({session('message')}),</h6>
      @endif
    <div class="me-md-5 me-xl-8">
      <h2 style="align:top">Dashboard</h2>
      <p class="mb-md-4">your analytics dashboard </p>
      <hr>
</div>
  <div class="row">
    <div class="col-md-3">
      <div class="card card-body bg-primary text-white mb-3">
        <span class="icon" style="color:black; font-size: 50px"><ion-icon name="leaf-outline"></ion-icon></span>
        <label style="color:black; font-size: 20px">PlantData</label>
        <h1>{{$totalplant}}</h1>
        <a href="{{url('/plants')}}" class="text-white">view</a>

</div>
</div>

 
    <div class="col-md-3">
      <div class="card card-body bg-danger text-white mb-3">
        <span class="icon" style="color:black; font-size: 50px"><ion-icon name="phone-portrait-outline"></ion-icon></span>
        <label style="color:black; font-size: 20px">Device</label>
        <h1>{{$totalabouts}}</h1>
        <a href="{{url('/abouts')}}" class="text-white">view</a>

</div>
</div>


    <div class="col-md-3">
      <div class="card card-body bg-warning text-white mb-3">
      <span class="icon" style="color:black; font-size: 50px"><ion-icon name="chatbubble-ellipses-outline"></ion-icon></span>
      <label style="color:black; font-size: 20px">Contactus</label>
        <h1>{{$totalcontact}}</h1>
        <a href="{{url('/contacts')}}" class="text-white">view</a>
</div>
</div>



    <div class="col-md-3">
      <div class="card card-body bg-success text-white mb-5">
      <span class="icon" style="color:black; font-size: 50px"><ion-icon name="people-circle-outline"></ion-icon>
        <label style="color:black; font-size: 20px">TotalUser</label></span>
        <h1>{{$totalAllUser}}</h1>
        <a href="{{url('role-register')}}" class="text-white">view</a>
</div>
</div>
<div class="col-md-3">
      <div class="card card-body bg-danger text-white mb-5">
        <span class="icon" style="color:black; font-size: 50px"><ion-icon name="person-outline"></ion-icon></span>
        <label style="color:black; font-size: 20px">Admin</label>
        <h1 style="text-align:centre;">{{$totalAdmin}}</h1>
        <a href="{{url('role-register')}}" class="text-white">View</a>
</div>
</div>
<div class="col-md-3">
      <div class="card card-body bg-success text-white mb-5">
      <span class="icon" style="color:black; font-size: 50px"> <ion-icon name="person-circle-outline"></ion-icon></span>
        <label style="color:black; font-size: 20px" >User</label>
        <h1>{{$totalUser}}</h1>
        <a href="{{url('role-register')}}" class="text-white">view</a>
</div>
</div>
        <div class="col-md-3">
      <div class="card card-body bg-primary text-white mb-5">
      <span class="icon" style="color:black; font-size: 50px"><ion-icon name="desktop-outline"></ion-icon></span>
      <label style="color:black; font-size: 20px" >Onedevice</label>
        
        <h1>{{$totalonedev}}</h1>
        <a href="{{url('/onedevicess')}}" class="text-white">view</a>
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