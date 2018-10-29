<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Loan extends Model
{
    use SoftDeletes;
    protected $table = "loans";

    public function schedules()
    {
        return $this->hasMany(LoanSchedule::class, 'loan_id', 'id');
    }

    public function comments()
    {
        return $this->hasMany(LoanComment::class, 'loan_id', 'id');
    }

    public function payments()
    {
        return $this->hasMany(LoanRepayment::class, 'loan_id', 'id');
    }

    public function collateral()
    {
        return $this->hasMany(Collateral::class, 'loan_id', 'id');
    }

    public function guarantors()
    {
        return $this->hasMany(Guarantor::class, 'loan_id', 'id');
    }

    public function borrower()
    {
        return $this->hasOne(Borrower::class, 'id', 'borrower_id');
    }

    public function loan_product()
    {
        return $this->hasOne(LoanProduct::class, 'id', 'loan_product_id');
    }

    public function loan_repayment_method()
    {
        return $this->hasOne(LoanRepaymentMethod::class, 'id', 'repayment_method_id');
    }

    public function loan_disbursed_by()
    {
        return $this->hasOne(LoanDisbursedBy::class, 'id', 'loan_disbursed_by_id');
    }
}
