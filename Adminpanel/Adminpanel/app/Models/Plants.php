<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Plants extends Model
{
    use HasFactory;
    protected $table ='plants';
    protected $fillable=[
        'plant_id',
        'plantname',
        'image',
        'short_description',
        'description',
    ];
}
