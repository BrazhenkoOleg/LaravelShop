@extends('layouts.header')

@section('title', 'Категории')

@section('content')
    @foreach($categories as $category)
        <div class="panel">
            <a href='{{ route('category', $category->code) }}'>
                <img src="{{ Storage::url($category->path_image) }}">
                <h2>{{ $category->name }}</h2>
            </a>
            <p>
                {{ $category->description }}
            </p>
        </div>
    @endforeach
@endsection
