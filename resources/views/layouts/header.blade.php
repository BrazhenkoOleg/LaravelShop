<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Интернет Магазин : @yield('title')</title>
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">
{{--    <link href="/css/bootstrap.min.css" rel="stylesheet">--}}
    <link href="/css/starter-template.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
{{--<nav class="navbar navbar-inverse navbar-fixed-top">--}}
{{--    <div class="container">--}}
{{--        <div class="navbar-header">--}}
{{--            <a class="navbar-brand" href="{{ route('index') }}">Интернет Магазин</a>--}}
{{--        </div>--}}
{{--        <div id="navbar" class="collapse navbar-collapse">--}}
{{--            <ul class="nav navbar-nav">--}}
{{--                <li  class="active" ><a href="{{ route('index') }}">Все товары</a></li>--}}
{{--                <li ><a href="{{ route('categories') }}">Категории</a></li>--}}
{{--                <li ><a href="/basket">В корзину</a></li>--}}
{{--                <li><a href="http://laravel-diplom-1.rdavydov.ru/reset">Сбросить проект в начальное состояние</a></li>--}}
{{--            </ul>--}}
{{--            <ul class="nav navbar-nav navbar-right">--}}
{{--                <li><a href="http://laravel-diplom-1.rdavydov.ru/admin/home">Панель администратора</a></li>--}}
{{--                <li ><a href="{{ route('basket') }}">Корзина</a></li>--}}
{{--            </ul>--}}
{{--        </div>--}}
{{--    </div>--}}
{{--</nav>--}}

<div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a href="{{ route('index') }}" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
            <span class="fs-4">Интернет Магазин</span>
        </a>

        <ul class="nav nav-pills">
            <li class="nav-item"><a href="{{ route('index') }}" class="nav-link active" aria-current="page">Все товары</a></li>
            <li class="nav-item"><a href="{{ route('categories') }}" class="nav-link">Категории</a></li>
            <li class="nav-item"><a href="{{ route('basket') }}" class="nav-link">Корзина</a></li>
        </ul>
    </header>
</div>

<div class="container">
    <div class="starter-template">
        @if(session()->has('success'))
            <p class="alert alert-success">{{ session()->get('success') }}</p>
        @endif
        @if(session()->has('warning'))
            <p class="alert alert-warning">{{ session()->get('warning') }}</p>
        @endif
        @yield('content')
    </div>
</div>
</body>
</html>
