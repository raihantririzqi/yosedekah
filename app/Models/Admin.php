<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Admin extends Authenticatable
{
    use HasFactory, Notifiable;
    protected $table = 'admin';
    protected $password = 'pass_laravel';

    protected $fillable = [
        'id',
        'user_name',
        'password',
        'email',
        'image',
        'level',
        'grup',
        'kota',
        'pass_laravel'
    ];

    protected $hidden = ['pass_laravel', 'remember_token'];
}
