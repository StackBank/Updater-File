# Автообновление приложения

Этот скрипт предназначен для автоматического обновления вашего приложения с использованием WebSocket и HTTP-запросов.

## Установка

1. Убедитесь, что у вас установлены необходимые библиотеки: axios, config.
   
   ```lua
   local axios = require('libraries.axios')
   local config = require('libraries.config')
   ```

2. Загрузите скрипт в свой проект.

3. Укажите параметры конфигурации в файле `config.lua`:

   ```lua
   local data = {
       updater_url = "https://example.com/updater",
       token_check = "your_token_here"
   }

   return data
   ```

   Замените "https://example.com/updater" на URL вашего обновления и "your_token_here" на ваш токен авторизации.

## Использование

1. Запустите основной цикл обновления:

   ```lua
   while true do
       -- ваш код
   end
   ```

2. При необходимости внесите изменения в функцию `try_update()`, чтобы соответствовать вашей логике обновления.

## Зависимости

- [axios](https://discord.com/channels/1200897574379466772/1203459216140935259) - библиотека для HTTP-запросов.
- [config](https://discord.com/channels/1200897574379466772/1203452560720011364) - библиотека для работы с конфигурацией.

## Лицензия

Этот проект лицензирован в соответствии с условиями [MIT License](LICENSE).
