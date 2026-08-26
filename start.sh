#!/bin/bash

# Port default jika $PORT tidak diset oleh Railway
PORT="${PORT:-8080}"

echo ">> Menyiapkan konfigurasi & cache Laravel..."
php artisan config:clear
php artisan cache:clear

echo ">> Menjalankan Migrasi Database..."
php artisan migrate --force || echo ">> Warning: Migrasi dilewati atau belum dapat terhubung ke database."

echo ">> Menghubungkan storage symlink..."
php artisan storage:link || true

echo ">> Memulai Web Server Laravel pada port $PORT..."
php artisan serve --host=0.0.0.0 --port=$PORT

