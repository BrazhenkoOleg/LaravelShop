-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Янв 20 2025 г., 15:30
-- Версия сервера: 8.0.40
-- Версия PHP: 8.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `path_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `code`, `name`, `description`, `path_image`, `created_at`, `updated_at`) VALUES
(1, 'mobiles', 'Мобильные телефоны', 'В этом разделе вы найдёте самые популярные мобильные телефонамы по отличным ценам!', '/images/categories/mobile.jpg', NULL, NULL),
(2, 'portable', 'Портативная техника', 'Раздел с портативной техникой.', '/images/categories/portable.jpg', NULL, NULL),
(3, 'appliances', 'Бытовая техника', 'Раздел с бытовой техникой.', '/images/categories/appliance.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `category_product`
--

CREATE TABLE `category_product` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category_product`
--

INSERT INTO `category_product` (`id`, `category_id`, `product_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 3, 8),
(9, 3, 9),
(10, 3, 10),
(11, 3, 11),
(12, 2, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE `images` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`id`, `product_id`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, '/images/products/iphone_x.jpg', NULL, NULL),
(2, 2, '/images/products/iphone_x_silver.jpg', NULL, NULL),
(3, 3, '/images/products/htc_one_s.png', NULL, NULL),
(4, 4, '/images/products/iphone_5.jpg', NULL, NULL),
(5, 5, '/images/products/beats.jpg', NULL, NULL),
(6, 6, '/images/products/gopro.jpg', NULL, NULL),
(7, 7, '/images/products/video_panasonic.jpg', NULL, NULL),
(8, 8, '/images/products/delongi.jpg', NULL, NULL),
(9, 9, '/images/products/haier.jpg', NULL, NULL),
(10, 10, '/images/products/moulinex.jpg', NULL, NULL),
(11, 11, '/images/products/bosch.jpg', NULL, NULL),
(12, 1, '/images/products/iphone_x_silver.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '0001_01_01_000000_create_users_table', 1),
(6, '2025_01_17_234020_create_products_table', 1),
(7, '2025_01_17_235529_create_categories_table', 1),
(8, '2025_01_18_004125_create_category_product_table', 1),
(9, '2025_01_18_004704_create_images_table', 1),
(10, '2025_01_20_093808_create_orders_table', 2),
(11, '2025_01_20_094503_create_order_product_table', 3),
(12, '2025_01_20_105508_update_order_product_table', 4),
(13, '2025_01_20_134902_update_categories_table', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `status`, `name`, `phone`, `created_at`, `updated_at`) VALUES
(1, 1, 'Олег', '+7 (952) 577 54 61', '2025-01-20 07:06:55', '2025-01-20 09:08:12'),
(2, 0, NULL, NULL, '2025-01-20 09:10:45', '2025-01-20 09:10:45'),
(3, 0, NULL, NULL, '2025-01-20 09:11:07', '2025-01-20 09:11:07'),
(4, 0, NULL, NULL, '2025-01-20 09:19:50', '2025-01-20 09:19:50'),
(5, 1, 'Олег', '+7 (952) 577 54 61', '2025-01-20 09:22:36', '2025-01-20 09:23:12'),
(6, 1, 'Олег', '+7 (952) 577 54 61', '2025-01-20 09:23:28', '2025-01-20 09:23:44'),
(7, 0, NULL, NULL, '2025-01-20 09:28:35', '2025-01-20 09:28:35'),
(8, 0, NULL, NULL, '2025-01-20 09:29:54', '2025-01-20 09:29:54'),
(9, 1, NULL, NULL, '2025-01-20 09:29:57', '2025-01-20 09:30:26'),
(10, 1, NULL, NULL, '2025-01-20 09:30:28', '2025-01-20 09:33:12'),
(11, 1, 'Олег', '+7 (952) 577 54 61', '2025-01-20 09:39:19', '2025-01-20 09:39:27'),
(12, 0, NULL, NULL, '2025-01-20 09:39:35', '2025-01-20 09:39:35'),
(13, 1, 'Олег', '+7 (952) 577 54 61', '2025-01-20 11:06:07', '2025-01-20 11:19:04'),
(14, 1, NULL, NULL, '2025-01-20 11:19:05', '2025-01-20 11:22:14'),
(15, 1, NULL, NULL, '2025-01-20 11:25:14', '2025-01-20 11:25:58'),
(16, 1, 'Олег', '+7 (952) 577 54 61', '2025-01-20 11:26:00', '2025-01-20 11:39:53'),
(17, 1, 'gddf', 'dfdf', '2025-01-20 11:39:57', '2025-01-20 11:40:02'),
(18, 1, 'Олег', '+7 (952) 577 54 61', '2025-01-20 11:40:14', '2025-01-20 12:01:07'),
(19, 1, 'Олег', '+7 (952) 577 54 61', '2025-01-20 12:19:48', '2025-01-20 12:20:12'),
(20, 1, NULL, NULL, '2025-01-20 12:20:16', '2025-01-20 12:21:31');

-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `count` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `count`, `created_at`, `updated_at`) VALUES
(53, 1, 1, 3, '2025-01-20 09:08:00', '2025-01-20 09:08:03'),
(55, 5, 1, 1, '2025-01-20 09:23:07', '2025-01-20 09:23:07'),
(57, 6, 1, 2, '2025-01-20 09:23:39', '2025-01-20 09:23:40'),
(59, 7, 1, 1, '2025-01-20 09:29:54', '2025-01-20 09:29:54'),
(60, 8, 1, 1, '2025-01-20 09:29:57', '2025-01-20 09:29:57'),
(61, 9, 1, 1, '2025-01-20 09:30:21', '2025-01-20 09:30:21'),
(62, 10, 1, 1, '2025-01-20 09:33:10', '2025-01-20 09:33:10'),
(63, 11, 1, 2, '2025-01-20 09:39:19', '2025-01-20 09:39:20'),
(67, 12, 1, 1, '2025-01-20 10:36:12', '2025-01-20 10:36:12'),
(68, 13, 1, 1, '2025-01-20 11:12:16', '2025-01-20 11:12:16'),
(69, 13, 2, 2, '2025-01-20 11:15:25', '2025-01-20 11:18:56'),
(70, 14, 1, 2, '2025-01-20 11:22:01', '2025-01-20 11:22:10'),
(71, 18, 2, 1, '2025-01-20 11:42:12', '2025-01-20 12:01:02'),
(72, 19, 1, 2, '2025-01-20 12:19:54', '2025-01-20 12:20:04'),
(73, 20, 1, 1, '2025-01-20 12:21:20', '2025-01-20 12:21:27');

-- --------------------------------------------------------

--
-- Структура таблицы `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  `remain` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `code`, `name`, `description`, `price`, `remain`, `created_at`, `updated_at`) VALUES
(1, 'iphone_x_64', 'iPhone X 64GB', 'Отличный продвинутый телефон с памятью на 64 gb', 71990, 15, NULL, NULL),
(2, 'iphone_x_256', 'iPhone X 256GB', 'Отличный продвинутый телефон с памятью на 256 gb', 89990, 9, NULL, NULL),
(3, 'htc_one_s', 'HTC One S', 'Зачем платить за лишнее? Легендарный HTC One S', 12490, 50, NULL, NULL),
(4, 'iphone_5se', 'iPhone 5SE', 'Отличный классический iPhone', 17221, 35, NULL, NULL),
(5, 'beats_audio', 'Наушники Beats Audio', 'Отличный звук от Dr. Dre', 20221, 90, NULL, NULL),
(6, 'gopro', 'Камера GoPro', 'Снимай самые яркие моменты с помощью этой камеры', 12000, 58, NULL, NULL),
(7, 'panasonic_hc-v770', 'Камера Panasonic HC-V770', 'Для серьёзной видео съемки нужна серьёзная камера. Panasonic HC-V770 для этих целей лучший выбор!', 27900, 97, NULL, NULL),
(8, 'delongi', 'Кофемашина DeLongi', 'Хорошее утро начинается с хорошего кофе!', 25200, 74, NULL, NULL),
(9, 'haier', 'Холодильник Haier', 'Для большой семьи большой холодильник!', 40200, 32, NULL, NULL),
(10, 'moulinex', 'Блендер Moulinex', 'Для самых смелых идей', 4200, 56, NULL, NULL),
(11, 'bosch', 'Мясорубка Bosch', 'Любите домашние котлеты? Вам определенно стоит посмотреть на эту мясорубку!', 9200, 43, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AVLzJCObpc2PPPFL5gDZ0ddebE7xJUioU90jIWBc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 OPR/115.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYjFoWTZCNTE1WHJTdGNXcm1xbkFaOFBFbE5aN2FablZQVHJYeERLaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly9sYXJhdmVsLXNob3AudGVzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6Nzoib3JkZXJJZCI7aToxMjt9', 1737386254),
('S8xRMLWVU0yDEkdOrJ8PvqzcWYLH3KwI0HJwDi7L', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36 OPR/115.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0lhQVdnYWtxdU9PTGZPeFpaeEJQMVNEdUVqZ3JlR1Y0b3k1SHl3NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1737386491);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
