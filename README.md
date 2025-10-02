# 🎬 eMovie - Flutter Movies App

A modern Flutter application for discovering and exploring movies, built with Clean Architecture and modular design principles.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

## ✨ Features

- 🎥 **Trending Movies**: Discover the most popular movies
- 🔥 **Upcoming Movies**: Stay updated with upcoming releases
- 🎨 **Modern UI**: Clean and intuitive interface with dark theme
- 🏗️ **Modular Architecture**: Clean Architecture with feature-based modules
- 🔄 **State Management**: BLoC pattern for predictable state management
- 💾 **Offline Support**: Local caching with SharedPreferences
- 🌐 **Network Connectivity**: Smart handling of network states
- 📱 **Cross Platform**: iOS, Android, macOS, Web support

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a **modular monorepo** structure:

```
├── apps/
│   └── moviesappclients/          # Main Flutter application
└── packages/
    ├── movies_module/             # Movies feature module
    │   ├── data/                  # Data sources, models, repositories
    │   ├── domain/                # Entities, use cases, repository interfaces
    │   └── presentation/          # BLoCs, pages, widgets
    ├── splash_module/             # Splash screen feature
    ├── common_module/             # Shared UI components
    └── common_dependency_module/  # Shared dependencies
```

### 🔧 Tech Stack

- **Framework**: Flutter 3.16.6+
- **Language**: Dart
- **State Management**: flutter_bloc + Equatable
- **Dependency Injection**: flutter_modular
- **HTTP Client**: Dio
- **Local Storage**: shared_preferences
- **Image Caching**: cached_network_image
- **Network Detection**: connectivity_plus
- **Monorepo Management**: Melos

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.16.6 or higher
- Dart SDK 3.2.3 or higher
- An IDE (VS Code, Android Studio, IntelliJ)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/alemurillo104/movies-app-test.git
   cd movies-app-test
   ```

2. **Install Melos globally**
   ```bash
   dart pub global activate melos
   ```

3. **Bootstrap the project**
   ```bash
   melos bootstrap
   ```

4. **Set up API Key**
   
   Add your The Movie Database (TMDB) API key:
   - Get your API key from [TMDB](https://www.themoviedb.org/settings/api)
   - Replace `'API_KEY'` in `packages/common_module/lib/src/http/dio_client.http.dart`

5. **Run the application**
   ```bash
   melos run run:moviesappclients
   ```

## 📱 Usage

### Development Commands

```bash
# Run the main application
melos run run:moviesappclients

# Run static analysis
melos run analyze

# Run tests (selective - only packages with test directories)
melos run test:selective_unit_test

# Run all tests
melos run test:all_unit_tests

# Clean all packages
melos clean

# Get dependencies for all packages
melos bootstrap
```

### Individual Package Commands

```bash
# Run tests for specific package
flutter test packages/movies_module/

# Analyze specific package  
dart analyze packages/movies_module/

# Run the app directly
flutter run apps/moviesappclients/lib/main.dart
```

## 🏛️ Project Structure

### Core Modules

- **moviesappclients**: Main Flutter app with navigation setup
- **movies_module**: Core movies functionality following Clean Architecture
- **splash_module**: Animated splash screen with brand identity
- **common_module**: Shared UI components and HTTP client
- **common_dependency_module**: Centralized external dependencies

### Key Components

- **Navigation**: flutter_modular for dependency injection and routing
- **State Management**: BLoC pattern with flutter_bloc
- **Data Layer**: Repository pattern with local and remote data sources
- **UI Components**: Reusable widgets for movie posters and cards

## 🧪 Testing

The project includes comprehensive testing:

```bash
# Run all tests
melos run test:all_unit_tests

# Run tests for packages with test directories only
melos run test:selective_unit_test

# Run tests for specific module
flutter test packages/movies_module/test/
```

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Development Guidelines

- Follow Clean Architecture principles
- Write tests for new features
- Use BLoC pattern for state management
- Maintain modular structure
- Follow Dart/Flutter style guide

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [The Movie Database (TMDB)](https://www.themoviedb.org/) for providing the movie data API
- Flutter team for the amazing framework
- Community packages that made this project possible

## 📞 Support

If you have any questions or need help, feel free to:

- Open an issue on GitHub
- Contact the development team
- Check the documentation

---