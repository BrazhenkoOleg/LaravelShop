@extends('layouts.header')

@section('title', 'Корзина')

@section('content')
    <h1>Корзина</h1>
    <p>Оформление заказа</p>
    <div class="panel">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Название</th>
                <th>Кол-во</th>
                <th>Цена</th>
                <th>Стоимость</th>
            </tr>
            </thead>
            <tbody>
            @foreach($order->products as $product)
                <tr>
                    <td>
                        <a href="{{ route('product', [$product->categories->first()->code, $product->code]) }}">
{{--                            <img height="56px"--}}
{{--                                 src="http://laravel-diplom-1.rdavydov.ru/storage/products/iphone_x.jpg">--}}
                                <img height="56px" src="{{ Storage::url($product->images->first()->path) }}" alt="{{ $product->name }}">
                            {{ $product->name }}
                        </a>
                    </td>
                    <td><span class="badge text-bg-secondary">{{ $product->pivot->count }}</span>
                        <div class="btn-group form-inline">
                            <form action="{{ route('basket-remove', $product) }}" method="POST">
                                <button type="submit" class="btn btn-danger"><span aria-hidden="true">-</span></button>
                                @csrf
                            </form>
                            <form action="{{ route('basket-add', $product) }}" method="POST">
                                <button type="submit" class="btn btn-success"><span aria-hidden="true">+</span></button>
                                @csrf
                            </form>
                        </div>
                    </td>
                    <td>{{ $product->price }} руб.</td>
                    <td>{{ $product->getTotalPriceForProductAttribute() }} руб.</td>
                </tr>
            @endforeach
            <tr>
                <td colspan="3">Общая стоимость:</td>
                <td>{{ $order->getTotalPriceAttribute() }} руб.</td>
            </tr>
            </tbody>
        </table>
        <br>
        <div class="btn-group pull-right" role="group">
            <a type="button" class="btn btn-success" href="{{ route('basket-place') }}">Оформить заказ</a>
        </div>
    </div>
@endsection
