# 🎓 Angela Yu iOS Development Course Projects

Привет! Здесь вы можете познакомится с iOS приложением,которое содержит коллекцию проектов из курса iOS разработки Angela Yu. Каждый проект демонстрирует различные аспекты iOS разработки с использованием UIKit и программного создания интерфейса.

## Архитектура

Проект построен на основе модульной архитектуры с использованием MVVM паттерна:
```
studyProjectUIkit/
├── Core/
│ ├── Extensions/
│ ├── Protocols/
│ └── Services/
├── UI/
│ ├── Common/
│ │ ├── Components/
│ │ └── Styles/
│ └── Screens/
│ ├── 4_DiceeGame/
│ │ ├── Views/
│ │ │ └── DiceeGameSceneViewController.swift
│ │ └── ViewModels/
│ └── 5_Magic8Ball/
│ ├── Views/
│ └── ViewModels/
├── Resources/
│ ├── Images/
│ └── Assets.xcassets/
└── Supporting/
└── Info.plist
```


### Основные принципы архитектуры:

1. **Модульность**
   - Каждый проект - отдельный модуль
   - Независимые компоненты
   - Возможность легкого добавления новых проектов

2. **MVVM Pattern**
   - View: UIViewController + UIView
   - ViewModel: Бизнес-логика и обработка данных
   - Model: Структуры данных и сервисы

3. **Clean Architecture**
   - Разделение на слои
   - Зависимости направлены внутрь
   - Независимость от фреймворков

4. **Dependency Injection**
   - Внедрение зависимостей через инициализаторы
   - Легкое тестирование
   - Гибкая замена компонентов

## 🛠 Технологии

- Swift
- UIKit
- Auto Layout (программно)
- MVVM
- Protocol-Oriented Programming

## 📦 Установка

1. Клонируйте репозиторий
```bash
git clone https://github.com/yourusername/AngelaYu_AllinOne.git
```

2. Откройте проект в Xcode
```bash
cd AngelaYu_AllinOne
open studyProjectUIkit.xcodeproj
```

3. Запустите проект (⌘R)

## 🎯 Цели проекта

1. Изучение iOS разработки
2. Практика создания UI программно
3. Изучение различных iOS компонентов
4. Применение паттернов проектирования
5. Создание портфолио проектов

## 📱 Проекты

### 1. 🎲 Dicee Game
- Простая игра в кости
- Демонстрация работы с UIButton, UIImageView
- Использование Auto Layout программно
- Генерация случайных чисел

### 2. 🎱 Magic 8 Ball (В разработке)
- Приложение-предсказатель
- ...

## 📝 План развития
- [ ] I'm rich
- [ ] I'm poor
- [x] Dicee Game
- [ ] Magic 8 Ball
- [ ] Другие проекты из курса...

## 🤝 Вклад в проект

1. Форкните репозиторий
2. Создайте ветку для ваших изменений (`git checkout -b feature/AmazingFeature`)
3. Зафиксируйте изменения (`git commit -m 'Add some AmazingFeature'`)
4. Отправьте изменения в ветку (`git push origin feature/AmazingFeature`)
5. Откройте Pull Request

## 📚 Обучение

Этот проект является частью курса [iOS & Swift - The Complete iOS App Development Bootcamp](https://www.udemy.com/course/ios-13-app-development-bootcamp/) от Angela Yu.

## 👤 Автор

Евгений Кириллов - [@icleverstyle](https://github.com/iCleverStyle)
TG channel: [t.me/isilverdev](https://t.me/isilverdev)

## 📄 Лицензия

Этот проект распространяется под лицензией MIT. См. файл `LICENSE` для получения дополнительной информации.
