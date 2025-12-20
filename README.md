
<div align="center">

![Flutter Version](https://img.shields.io/badge/Flutter-3.19.0-blue?logo=flutter)
![Dart Version](https://img.shields.io/badge/Dart-3.9.0-blue?logo=dart)
![Provider Version](https://img.shields.io/badge/Provider-6.1.1-orange)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Android%2520%257C%2520iOS%2520%257C%2520Web-blueviolet)
![PRs](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)
![Code Style](https://img.shields.io/badge/code%2520style-flutter-blue)

</div>

# Flutter Provider State Management Examples

A comprehensive learning project demonstrating state management in Flutter using Provider.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Examples Included](#examples-included)
- [Project Structure](#project-structure)
- [Quick Start](#quick-start)
- [Installation](#installation)
- [Usage Guide](#usage-guide)
- [Code Architecture](#code-architecture)
- [Screenshots](#screenshots)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)
- [Support](#support)
- [Acknowledgments](#acknowledgments)

## 🎯 Overview

This project is a hands-on educational guide that demonstrates how to use the Provider Package for state management in Flutter applications. It contains various examples ranging from basic concepts to complete practical applications, perfect for both beginners and intermediate Flutter developers.

## ✨ Features

- ✅ **Progressive Examples**: From simple to complex implementations
- ✅ **Practical Applications**: Counter, Shopping Cart, MultiProvider examples
- ✅ **Professional Design**: Beautiful, responsive UI with RTL support
- ✅ **Clean Architecture**: Well-structured code with clear separation of concerns
- ✅ **Performance Optimized**: Follows Flutter best practices
- ✅ **Full Arabic Support**: RTL layout with Arabic typography
- ✅ **Comprehensive Documentation**: Each example is well-documented

## 📦 Examples Included

1. **Basic Provider Overview** (`/basic-overview`)
    - Fundamentals of using `Provider.of`
    - Simple counter state management
    - Navigation between screens with preserved state
    - Basic `ChangeNotifier` implementation

2. **Basic Provider Sample** (`/basic-sample`)
    - Using `context.watch` and `context.read`
    - Increment/decrement functionality
    - Enhanced UI with custom buttons
    - Provider with multiple methods

3. **MultiProvider Examples** (`/multi-provider`)
    - Multiple `ChangeNotifier` instances in one app
    - Independent state management for different features
    - Interactive UI with custom action buttons
    - Examples: `CounterNotifier1`, `CounterNotifier2`, `CounterNotifier3`

4. **Shopping Cart Application** (`/cart-sample`)
    - Complete e-commerce application
    - Product management with cart functionality
    - Real-time total calculation
    - Full-featured UI with `SnackBar` confirmations
    - Product details page with add-to-cart functionality

## 🏗️ Project Structure

```
lib/
├── main.dart                          # Application entry point
├── 1_baisc_overview_roq/              # Basic Provider overview
│   ├── provider1_baisc_roq.dart       # CounterProvider1 class
│   ├── counterScreen1_provider1.dart  # Screen 1 implementation
│   └── counterScreen2_provider1.dart  # Screen 2 implementation
├── 2_baisc_sample_roq/                # Basic Provider sample
│   ├── provider2_baisc_roq.dart       # CounterProvider2 class
│   ├── counterScreen1_provider2.dart  # Screen 1 implementation
│   └── counterScreen2_provider2.dart  # Screen 2 implementation
├── 3_multiNotifiers/                  # MultiProvider examples
│   ├── Notifiers.dart                 # Multiple ChangeNotifier classes
│   └── MultiProviders.dart            # MultiProvider implementation
├── 4_cartShop_sample_roq/             # Shopping cart example
│   ├── cart_provider.dart             # CartProvider class
│   ├── product.dart                   # Product model
│   ├── product_list_page.dart         # Product listing
│   ├── product_details_page.dart      # Product details
│   ├── cart_page.dart                 # Shopping cart
│   └── main_cartSample.dart           # Cart app entry
└── core/                              # Shared core files (if any)
```

## 🚀 Quick Start

### Prerequisites

- Flutter SDK 3.19.0 or higher
- Dart 3.9.0 or higher
- IDE (VS Code or Android Studio recommended)
- Git for version control

### Clone & Run

```bash
# Clone the repository
git clone https://github.com/yourusername/flutter-provider-examples.git

# Navigate to project directory
cd flutter-provider-examples

# Install dependencies
flutter pub get

# Run the application
flutter run
```

## 📲 Installation

### Step 1: Clone Repository

```bash
git clone https://github.com/Eng-Ruqaih-Salman2040/roqsal_state_management_provider_2026.git
```

### Step 2: Install Dependencies

```bash
cd flutter-provider-examples
flutter pub get
```

### Step 3: Run on Different Platforms

```bash
# For Android
flutter run -d emulator

# For iOS
flutter run -d iphone

# For Web
flutter run -d chrome

# For Desktop (Windows/Mac/Linux)
flutter run -d windows   # or -d macos / -d linux
```

### Step 4: Build for Release

```bash
# Build APK for Android
flutter build apk --release

# Build IPA for iOS
flutter build ios --release

# Build for Web
flutter build web --release
```

## 📱 Usage Guide

### Main Application Flow

1. **Launch the app** - You'll see the main screen with 4 example cards
2. **Select an example** - Tap any card to explore that Provider implementation
3. **Interact with examples** - Each example has interactive elements
4. **Navigate back** - Use the back button or navigation controls

### Example 1: Basic Provider

- Tap "+" button to increment counter
- Navigate to Page 2 to see shared state
- Observe how state persists across screens

### Example 2: Advanced Provider

- Use both increment and decrement buttons
- Note the use of `context.watch` for listening
- Check the use of `context.read` for actions

### Example 3: MultiProvider

- Two independent counters in one screen
- Each counter has its own `ChangeNotifier`
- Demonstrates scoped state management

### Example 4: Shopping Cart

- Browse products in the list
- View product details
- Add products to cart
- Modify quantities in cart
- View real-time totals

## 💻 Code Architecture

### State Management Pattern

```dart
// 1. Create ChangeNotifier
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners();
  }
}

// 2. Provide it to widget tree
ChangeNotifierProvider(
  create: (context) => CounterProvider(),
  child: MyApp(),
)

// 3. Consume in widgets
Consumer<CounterProvider>(
  builder: (context, provider, child) => Text('${provider.count}'),
)
```

### Key Concepts Demonstrated

- `Provider.of`: Basic state access
- `Consumer`: Rebuilding only necessary widgets
- `MultiProvider`: Multiple state providers
- `ChangeNotifier`: Reactive state classes
- Navigation with State: Preserving state across routes

## 📸 Screenshots

<div align="center">
![Main Screen](https://via.placeholder.com/300x600/4A90E2/FFFFFF?text=Main+Screen)
![Counter Example](https://via.placeholder.com/300x600/50E3C2/FFFFFF?text=Counter+Example)
![Shopping Cart](https://via.placeholder.com/300x600/9013FE/FFFFFF?text=Shopping+Cart)
</div>

Replace placeholder images with actual screenshots from your application.

## 📦 Dependencies

### Main Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1  # State management
  # Add other dependencies as needed
```

### Dev Dependencies

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0  # Code linting
```

### Version Compatibility

- **Flutter**: 3.0.0+
- **Dart**: 2.17.0+
- **Provider**: 6.0.0+

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch

```bash
git checkout -b feature/AmazingFeature
```

3. Commit your changes

```bash
git commit -m 'Add some AmazingFeature'
```

4. Push to the branch

```bash
git push origin feature/AmazingFeature
```

5. Open a Pull Request

### Contribution Guidelines

- Follow the existing code style
- Add comments for complex logic
- Update documentation as needed
- Write tests for new features
- Ensure all examples work correctly

### Development Setup

```bash
# Install dependencies
flutter pub get

# Run tests
flutter test

# Check code formatting
flutter format --set-exit-if-changed lib/

# Analyze code
flutter analyze
```

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support

### Getting Help

- 📖 **Documentation**: Check the code comments and this README
- 🐛 **Issues**: Open an issue on GitHub
- 💬 **Questions**: Start a discussion in GitHub Discussions
- 📧 **Email**: your.email@example.com

## 🙏 Acknowledgments

- Flutter Team for the amazing framework
- Provider Package Maintainers for excellent state management solution
- Contributors who helped improve this project
- Learning Resources that inspired these examples

## 📊 Project Statistics

![Stars](https://img.shields.io/github/stars/yourusername/flutter-provider-examples?style=social)
![Forks](https://img.shields.io/github/forks/yourusername/flutter-provider-examples?style=social)
![Issues](https://img.shields.io/github/issues/yourusername/flutter-provider-examples)
![PRs](https://img.shields.io/github/issues-pr/yourusername/flutter-provider-examples)
