<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Guarantor extends Model
{
    protected $table = "guarantor";

    public function user()
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }
    public function borrower()
    {
        return $this->hasOne(Borrower::class, 'id', 'borrower_id');
    }
    public function guarantee()
    {
        return $this->hasOne(Borrower::class, 'id', 'guarantor_id');
    }

}
