<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Product extends Model
{
    public function categories() : BelongsToMany
    {
        return $this->belongsToMany(Category::class);
    }

    public function images(): HasMany
    {
        return $this->hasMany(Image::class);
    }

    public function getTotalPriceForProductAttribute() : int
    {
        return ($this->pivot->count ?? 1) * $this->price;
    }

//    public function getCategories()
//    {
//        return $this->categories()->get();
//    }
}
