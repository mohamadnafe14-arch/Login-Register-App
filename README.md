# Login & Register App

[![Flutter](https://img.shields.io/badge/Flutter-3.19.2-02569B?logo=flutter)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.3.0-0175C2?logo=dart)](https://dart.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-Core-FFCA28?logo=firebase)](https://firebase.google.com/)
[![Clean Architecture](https://img.shields.io/badge/Architecture-Clean-success)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A premium Flutter application demonstrating a robust, secure, and modern authentication flow. Built with **Clean Architecture**, **BLoC**, and **Firebase**, designed to be scalable and maintainable.

## 📑 Table of Contents
- [Features](#-features)
- [Screenshots](#-screenshots)
- [Tech Stack](#-tech-stack)
- [Architecture](#-architecture)
- [Getting Started](#-getting-started)
- [Testing](#-testing)
- [Contributing](#-contributing)
- [License](#-license)

## 📱 Features

- **🎨 Modern UI/UX**:
  - **Dark Mode**: Fully supported dark theme implementation.
  - **Responsive**: Pixel-perfect adaptation using `flutter_screenutil`.
  - **Splash Screen**: Animated entry experience.
- **🔐 Secure Authentication**:
  - Email & Password Login/Registration.
  - Integration with **Firebase Auth**.
- **🏗 Robust Architecture**:
  - **BLoC Pattern**: Separation of business logic and UI.
  - **Dependency Injection**: Decoupled modules via `GetIt`.
  - **Functional Error Handling**: Using `dartz` for `Either<Failure, Success>`.
- **🧭 Named Routing**: Centralized navigation management with `GoRouter`.

## 📸 Screenshots

| Splash Screen | Login Screen | Register Screen |
|:---:|:---:|:---:|
| <img src="screenshots/splash.png" width="200" alt="Splash" /> | <img src="screenshots/login.png" width="200" alt="Login" /> | <img src="screenshots/register.png" width="200" alt="Register" /> |

*> **Note:** Replace the paths above with your actual screenshot files.*

## 🛠 Tech Stack

| Category | Technology | Description |
|:--- |:--- |:--- |
| **Framework** | [Flutter](https://flutter.dev/) | Cross-platform UI toolkit |
| **Language** | [Dart](https://dart.dev/) | Optimized for UI |
| **Backend** | [Firebase Auth](https://firebase.google.com/docs/auth) | Authentication Service |
| **State Mgmt** | [flutter_bloc](https://pub.dev/packages/flutter_bloc) | Predictable state management |
| **Navigation** | [go_router](https://pub.dev/packages/go_router) | Declarative routing |
| **DI** | [get_it](https://pub.dev/packages/get_it) | Service Locator |
| **Utils** | [dartz](https://pub.dev/packages/dartz) | Functional programming |

## 📂 Architecture

This project strictly follows **Clean Architecture** to ensure independent layers:

```
lib/
├── core/                  # Core Layer
│   ├── errors/            # Failure definitions (ServerFailure, etc.)
│   ├── utils/             # ServiceLocator, Router, Constants
│   └── usecase/           # Base UseCase classes
├── features/              # Feature Layer (e.g., Auth)
│   ├── data/              # Data Layer
│   │   ├── datasources/   # Remote/Local Data Sources
│   │   ├── models/        # DTOs (Data Transfer Objects)
│   │   └── repos/         # Repository Implementations
│   ├── domain/            # Domain Layer (Inner-most)
│   │   ├── entities/      # Core Business Objects
│   │   ├── repos/         # Repository Interfaces
│   │   └── usecases/      # Business Logic execution
│   └── presentation/      # Presentation Layer
│       ├── manager/       # BLoC/Cubits
│       ├── pages/         # Screens
│       └── widgets/       # Reusable Widgets
└── main.dart              # Entry Point
```

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x.x or later)
- active [Firebase Project](https://console.firebase.google.com/)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Start-Tech-Academy/login_and_register_app.git
   cd login_and_register_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase:**
   - Ensure `google-services.json` is in `android/app/`.
   - Ensure `GoogleService-Info.plist` is in `ios/Runner/`.

4. **Run the app:**
   ```bash
   flutter run
   ```

## 🧪 Testing

To run the full test suite:

```bash
flutter test
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the project.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.
