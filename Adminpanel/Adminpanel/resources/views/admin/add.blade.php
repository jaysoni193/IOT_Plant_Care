@extends('layouts.master')


@section('title')
       plant data
@endsection

@section('content')
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body class="p-3 m-0 border-0 bd-example">

    <!-- Example Code -->
    
    
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" >ADD</button>
    
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Plant database</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            < action="add.php" method="POST">
              <div class="mb-3">
                <label for="plant_id" class="col-form-label">plant_id:</label>
                <input type="text" class="form-control" name="plantid" >
              </div>
              <div class="mb-3">
                <label for="plant-name" class="col-form-label">plantname:</label>
                <input type="text" class="form-control" name="plantname" >
              </div>
              <div class="mb-3">
                <label for="image" class="col-form-label">image:</label>
                <input type="text" class="form-control" name="image">
              </div>
              <div class="mb-3">
                <label for="short_description" class="col-form-label">short_description:</label>
                <textarea class="form-control" name="short_desc" ></textarea>
              </div>
              <div class="mb-3">
                <label for="description" class="col-form-label">description:</label>
                <textarea class="form-control" name="description" ></textarea>
              </div>
        
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button"  name="add" class="btn btn-primary">Save</button>
          </div>
</form>
        </div>
      </div>
    </div>
    
    <!-- End Example Code -->
  </body>
</html>


@endsection
@section('scripts')

@endsection