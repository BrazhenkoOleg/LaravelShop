<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\View\View;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function index() : View
    {
        $products = Product::with('images')->get();
        return view('index', compact('products'));
    }

    public function categories() : View
    {
        $categories = Category::get();
        return view('categories', compact('categories'));
    }

    public function category($code) : View
    {
        $category = Category::where('code', $code)->firstOrFail();
        return view('category', compact('category'));
    }

    public function product($category, $product = null) : View
    {
        $product = Product::where('code', $product)->firstOrFail();
        $images = $product->images;
        return view('product', compact('product', 'images'));
    }
}
