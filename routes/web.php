<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PageController;
use App\Http\Controllers\BasketController;

Route::get('/', [PageController::class, 'index'])->name('index');
Route::get('/categories', [PageController::class, 'categories'])->name('categories');
Route::get('/basket', [BasketController::class, 'basket'])->name('basket');
Route::get('/basket/place', [BasketController::class, 'basketPlace'])->name('basket-place');
Route::post('/basket/place', [BasketController::class, 'basketConfirm'])->name('basket-confirm');
Route::post('/basket/add/{id}', [BasketController::class, 'basketAdd'])->name('basket-add');
Route::post('/basket/remove/{id}', [BasketController::class, 'basketRemove'])->name('basket-remove');
Route::get('/{category}', [PageController::class, 'category'])->name('category');
Route::get('/{category}/{product?}', [PageController::class, 'product'])->name('product');

