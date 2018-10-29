<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SavingProduct extends Model
{
    protected $table = "savings_products";


    public function user()
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }



}
