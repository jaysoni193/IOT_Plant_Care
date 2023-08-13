<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Onedevices extends Model
{
    use HasFactory;
    protected $table ='onedevicess';
    protected $fillable=['device_id','plant_id','plantname','Temperature','Mositure','Humidity'];
}
?>