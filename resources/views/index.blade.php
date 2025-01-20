@extends('layouts.header')

@section('title', 'Главная')

@section('content')
    <h1>Все товары</h1>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        @foreach($products as $product)
            @include('layouts.card', compact('product'))
        @endforeach
    </div>
@endsection
