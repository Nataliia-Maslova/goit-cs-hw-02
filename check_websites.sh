#!/bin/bash

# Список вебсайтів для перевірки
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Ім'я файлу логів
log_file="website_status.log"

# Очищуємо старий лог-файл, якщо він існує
> $log_file

# Перевірка кожного сайту у списку
for site in "${websites[@]}"; do
    # Використовуємо curl для перевірки доступності сайту
    http_status=$(curl -o /dev/null -s -w "%{http_code}\n" -L "$site")

    # Перевіряємо статусний код відповіді
    if [ "$http_status" -eq 200 ]; then
        echo "$site is UP" >> $log_file
    else
        echo "$site is DOWN" >> $log_file
    fi
done

# Виводимо повідомлення про завершення роботи
echo "Результати перевірки записані у файл: $log_file"
