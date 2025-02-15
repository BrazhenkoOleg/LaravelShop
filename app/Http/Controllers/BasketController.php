<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class BasketController extends Controller
{
    public function basket() : View
    {
        $orderId = session('orderId');
        if (!is_null($orderId)) {
            //$order = Order::findOrFail($orderId);
            $order = Order::with('products.images')->find($orderId);
        }
        else {
            $order = Order::create();
            session(['orderId' => $order->id]);
        }

        return view('basket', compact('order'));
    }

    public function basketConfirm(Request $request) : RedirectResponse
    {
        $orderId = session('orderId');
        if (is_null($orderId)) {
            return redirect()->route('index');
        }
        $order = Order::find($orderId);
        $success = $order->saveOrder($request->name, $request->phone);

        if ($success) {
            session()->flash('success', 'Ваш заказ принят в обработку!');
        } else {
            session()->flash('warning', 'Произошла ошибка');
        }

        return redirect()->route('index');
    }

    public function basketPlace() : RedirectResponse|View
    {
        $orderId = session('orderId');
        if (is_null($orderId)) {
            return redirect()->route('index');
        } else {
            $order = Order::find($orderId);
            return view('order', compact('order'));
        }
    }

    public function basketAdd($productId) : RedirectResponse
    {
        $orderId = session('orderId');
        if (is_null($orderId)) {
            $order = Order::create();
            session(['orderId' => $order->id]);
        } else {
            $order = Order::find($orderId);
        }

        if ($order->products->contains($productId)) {
            $pivotRow = $order->products()->where('product_id', $productId)->first()->pivot;
            $pivotRow->count++;
            $pivotRow->update();
        } else {
            $order->products()->attach($productId);
        }
        $product = Product::find($productId);
        session()->flash('success', 'Добавлен товар ' . $product->name);

        return redirect()->route('basket');
    }

    public function basketRemove($productId) : RedirectResponse
    {
        $orderId = session('orderId');
        if (is_null($orderId)) {
            return redirect()->route('basket');
        }
        $order = Order::find($orderId);

        if ($order->products->contains($productId)) {
            $pivotRow = $order->products()->where('product_id', $productId)->first()->pivot;
            if ($pivotRow->count < 2) {
                $order->products()->detach($productId);
            } else {
                $pivotRow->count--;
                $pivotRow->update();
            }
        }
        $product = Product::find($productId);
        session()->flash('warning', 'Удален товар  ' . $product->name);

        return redirect()->route('basket');
    }
}
