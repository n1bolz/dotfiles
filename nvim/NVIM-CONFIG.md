# Конфигурация Neovim - Полное руководство

Эта конфигурация Neovim представляет собой современную, полнофункциональную среду разработки с поддержкой множества языков программирования и мощными инструментами для продуктивности.

## 🚀 Быстрый старт

### Требования
- **Neovim** >= 0.10.0
- **Git** для клонирования репозитория и управления плагинами
- **Node.js** для некоторых LSP серверов
- **Go** для разработки на Go


### Установка

1. **Сделайте резервную копию существующей конфигурации:**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Клонируйте конфигурацию:**
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Запустите Neovim:**
   ```bash
   nvim
   ```

4. **Дождитесь установки плагинов:**
   - При первом запуске автоматически установится менеджер плагинов Lazy.nvim
   - Все плагины будут установлены автоматически
   - Mason автоматически установит необходимые LSP серверы, форматтеры и линтеры

5. **Проверьте установку:**
   - `:checkhealth` - проверка общего состояния
   - `:Mason` - проверка установленных инструментов
   - `:Lazy` - управление плагинами

## 📁 Структура конфигурации

```
~/.config/nvim/
├── init.lua                 # Точка входа конфигурации
├── lazy-lock.json          # Зафиксированные версии плагинов
├── stylua.toml             # Конфигурация форматтера Lua
├── .luacheckrc             # Конфигурация линтера Lua
├── ftplugin/               # Настройки для конкретных типов файлов
│   └── go.lua             # Настройки для Go файлов
├── lsp/                    # Конфигурации LSP серверов
│   ├── css-ls.lua         # CSS Language Server
│   ├── gopls.lua          # Go Language Server
│   ├── html-ls.lua        # HTML Language Server
│   ├── lua-ls.lua         # Lua Language Server
│   ├── tailwindcss.lua    # Tailwind CSS Language Server
│   ├── templ.lua          # Templ Language Server
│   ├── ts-ls.lua          # TypeScript Language Server
│   ├── vue-ls.lua         # Vue Language Server
│   └── zls.lua            # Zig Language Server
├── lua/
│   ├── config/            # Основные настройки
│   │   ├── autocmds.lua   # Автокоманды
│   │   ├── health-check.lua # Проверки здоровья
│   │   ├── icons.lua      # Иконки
│   │   ├── keymaps.lua    # Базовые кеймапы
│   │   ├── mason-verify.lua # Проверка Mason
│   │   ├── options.lua    # Опции Neovim
│   │   └── utils.lua      # Вспомогательные функции
│   ├── core/              # Ядро конфигурации
│   │   ├── lazy.lua       # Настройка Lazy.nvim
│   │   ├── lsp.lua        # Настройка LSP
│   │   └── mason-path.lua # Настройка путей Mason
│   └── plugins/           # Конфигурации плагинов

│       ├── blink.lua      # Автодополнение
│       ├── colorschemes.lua # Цветовые схемы
│       ├── conform.lua    # Форматирование кода
│       ├── dap.lua        # Отладка
│       ├── extra.lua      # Дополнительные плагины
│       ├── git.lua        # Git интеграция

│       ├── mason.lua      # Управление LSP/DAP/линтерами
│       ├── noice.lua      # Улучшенный UI
│       ├── nvim-lint.lua  # Линтинг
│       ├── nvim-newfile.lua # Создание новых файлов
│       ├── nvim-notes.lua # Заметки
│       ├── nvim-treesitter.lua # Синтаксис подсветка
│       ├── snacks.lua     # Утилиты и файловый менеджер
│       ├── tiny-inline-diagnostic.lua # Инлайн диагностика
│       ├── trouble.lua    # Диагностика и quickfix
│       └── which-key.lua  # Подсказки клавиш
└── plugin/
    └── ft.lua              # Определения типов файлов
```

## 🔧 Основные плагины и их назначение

### 📦 Менеджер плагинов
- **lazy.nvim** - Современный менеджер плагинов с ленивой загрузкой

### 🎨 Цветовые схемы
- **gruvbox-material** (активная) - Основная темная тема с высоким контрастом
- **catppuccin** - Альтернативная пастельная тема
- **forest-night** - Дополнительная природная тема

### 💡 Автодополнение и сниппеты
- **blink.cmp** - Быстрое автодополнение с поддержкой LSP
- **LuaSnip** - Мощная система сниппетов
- **friendly-snippets** - Коллекция готовых сниппетов


### 🔍 Поиск и навигация
- **snacks.nvim** - Универсальный файловый пикер и утилиты:
  - Поиск файлов (`<leader><space>`)
  - Grep по содержимому (`<leader>/`)
  - Буферы (`<leader>o`)
  - Git интеграция
  - LSP символы
  - Файловый менеджер (`<leader>e`)

### 🌳 Синтаксис и подсветка
- **nvim-treesitter** - Продвинутая подсветка синтаксиса
- **nvim-treesitter-textobjects** - Текстовые объекты на основе синтаксиса
- **nvim-ts-autotag** - Автозакрытие HTML/JSX тегов
- **nvim-ts-context-commentstring** - Контекстные комментарии

### 🛠️ LSP и инструменты разработки
- **mason.nvim** - Управление LSP серверами, DAP, линтерами и форматтерами
- Автоматически устанавливает:
  - **LSP серверы**: lua-language-server, gopls, zls, typescript-language-server, templ, html-lsp, css-lsp, vue-language-server, tailwindcss-language-server
  - **Форматтеры**: stylua, goimports, templ, prettier, black, isort, shfmt
  - **Линтеры**: golangci-lint, eslint_d, luacheck, shellcheck

### 🔧 Форматирование и линтинг
- **conform.nvim** - Универсальный форматтер кода
- **nvim-lint** - Асинхронный линтинг
- **editorconfig-vim** - Поддержка EditorConfig

### 🐛 Отладка (DAP)
- **nvim-dap** - Протокол адаптера отладки
- **nvim-dap-ui** - UI для отладчика
- **nvim-dap-virtual-text** - Виртуальный текст в отладчике
- **nvim-dap-go** - Отладка Go приложений

### 📝 Git интеграция
- **gitsigns.nvim** - Git аннотации в редакторе
- **diffview.nvim** - Просмотр Git diff
- **vim-fugitive** - Полная Git интеграция
- **vim-rhubarb** - GitHub интеграция
- **undotree** - Визуализация истории изменений

### 🚨 Диагностика и проблемы
- **trouble.nvim** - Красивый список диагностики
- **tiny-inline-diagnostic.nvim** - Компактные инлайн диагностические сообщения



### 📋 Заметки и утилиты
- **nvim-notes** - Система заметок
- **nvim-newfile** - Быстрое создание новых файлов
- **persistence.nvim** - Восстановление сессий
- **Comment.nvim** - Умные комментарии
- **flash.nvim** - Быстрая навигация по файлу

### 🎨 UI улучшения
- **noice.nvim** - Улучшенный UI для сообщений и уведомлений
- **dressing.nvim** - Улучшенные диалоги vim.ui
- **which-key.nvim** - Подсказки по горячим клавишам
- **fidget.nvim** - Прогресс LSP операций
- **mini.icons** - Красивые иконки

### 🐾 Дополнительные утилиты
- **vim-sleuth** - Автоматическое определение отступов
- **showkeys** - Отображение нажатых клавиш (для демонстраций)
- **vim-kitty** - Интеграция с терминалом Kitty

## ⚙️ Настройки Neovim

### Основные опции (lua/config/options.lua)
- **Leader key**: `<Space>`
- **Автосохранение**: отключено
- **Clipboard**: интеграция с системным буфером обмена
- **Поиск**: игнорирование регистра с умным поиском
- **Отступы**: 2 пробела, умные отступы
- **Номера строк**: относительные + абсолютные
- **Wrap**: отключен
- **Persistent undo**: включен
- **Updatetime**: 100ms для быстрого отклика

### Автокоманды (lua/config/autocmds.lua)
- Автоматическое удаление trailing пробелов
- Подсветка янка (копирования)
- Автоматическое форматирование при сохранении
- Восстановление позиции курсора при открытии файла

## 🎯 Поддерживаемые языки

### Полностью поддерживаемые языки:
- **Lua** - LSP, форматирование (stylua), линтинг (luacheck)
- **Go** - LSP (gopls), форматирование (goimports), линтинг (golangci-lint), отладка (delve)
- **Templ** - LSP, форматирование, синтаксис, интеграция с Tailwind CSS
- **JavaScript/TypeScript** - LSP, форматирование (prettier), линтинг (eslint_d)
- **Vue.js** - LSP, синтаксис, автодополнение
- **HTML/CSS** - LSP серверы, форматирование, автодополнение
- **Tailwind CSS** - LSP, автодополнение классов
- **Zig** - LSP (zls), базовая поддержка
- **Python** - форматирование (black, isort)
- **Bash/Shell** - форматирование (shfmt), линтинг (shellcheck)

### Дополнительно поддерживаемые:
- **JSON/YAML** - синтаксис, форматирование
- **Markdown** - синтаксис, предпросмотр
- **Terraform** - синтаксис
- **Protocol Buffers** - синтаксис

## 🔧 Настройка под себя

### Изменение цветовой схемы
В файле `lua/plugins/colorschemes.lua` измените:
```lua
vim.cmd.colorscheme("gruvbox-material")  -- измените на нужную тему
```

### Добавление новых LSP серверов
1. Добавьте сервер в `lua/plugins/mason.lua` в список `ensure_installed`
2. Создайте конфигурацию в `lsp/your-server.lua`
3. Включите сервер в `lua/core/lsp.lua`

### Настройка форматтеров
Редактируйте `lua/plugins/conform.lua` для добавления новых форматтеров или изменения существующих.

### Изменение кеймапов
- Базовые кеймапы: `lua/config/keymaps.lua`
- Плагин-специфичные: соответствующие файлы в `lua/plugins/`

## 🩺 Диагностика проблем

### Проверка здоровья системы
```vim
:checkhealth
```

### Проверка Mason
```vim
:Mason
```

### Проверка LSP
```vim
:LspInfo
```

### Проверка Treesitter
```vim
:TSInstallInfo
```

### Проверка плагинов
```vim
:Lazy
```

## 📚 Полезные команды

### Управление плагинами
- `:Lazy` - открыть менеджер плагинов
- `:Lazy update` - обновить все плагины
- `:Lazy sync` - синхронизировать плагины

### Mason (LSP/DAP/линтеры)
- `:Mason` - открыть Mason
- `:MasonUpdate` - обновить все инструменты
- `:MasonInstall <tool>` - установить инструмент

### Git
- `:Gitsigns preview_hunk` - предпросмотр изменений
- `:DiffviewOpen` - открыть diff
- `:Lazygit` - открыть Lazygit (если установлен)

### Отладка
- `<F5>` - запустить отладку
- `<F10>` - step over
- `<F11>` - step into
- `<F12>` - step out

## 🤝 Участие в разработке

1. Форкните репозиторий
2. Создайте ветку для ваших изменений
3. Протестируйте изменения
4. Создайте Pull Request

## 📝 Лицензия

MIT License - смотрите файл LICENSE для подробностей.

## 🙏 Благодарности

Эта конфигурация основана на работе множества разработчиков open-source сообщества Neovim. Особая благодарность авторам используемых плагинов.