@extends('layouts.header')

@section('title', 'Товар')

@section('content')
    <h1>{{ $product->name }}</h1>
    <p>Цена: <b>{{ $product->price }} руб.</b></p>
{{--    <img src="/storage/images/products/iphone_x.jpg">--}}
{{--    @foreach($images as $image)--}}
{{--        <img src="{{ Storage::url($image->path) }}" alt="{{ $product->name }}">--}}
{{--    @endforeach--}}
    <div id="carouselExampleDark" class="carousel carousel-dark slide">
        <div class="carousel-inner">
            @foreach($images as $image)
                <div class="carousel-item active">
                    <img src="{{ Storage::url($image->path) }}" alt="{{ $product->name }}">
                </div>
            @endforeach
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <p>{{ $product->description }}</p>
    <form action="{{ route('basket-add', $product) }}" method="POST">
        <button type="submit" class="btn btn-success">Добавить в корзину</button>
        @csrf
    </form>
@endsection
