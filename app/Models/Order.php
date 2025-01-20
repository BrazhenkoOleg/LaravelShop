<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Order extends Model
{
    public function products() : BelongsToMany
    {
        return $this->belongsToMany(Product::class)->withPivot('count')->withTimestamps();
    }

    public function getTotalPriceAttribute() : int
    {
        $sum = 0;
        foreach ($this->products as $product) {
            $sum += $product->getTotalPriceForProductAttribute();
        }

        return $sum;
    }

    public function saveOrder($name, $phone) : bool
    {
        if ($this->status == 0) {
            $this->name = $name;
            $this->phone = $phone;
            $this->status = 1;
            $this->save();
            session()->forget('orderId');
            return true;
        }
        return false;
    }
}
