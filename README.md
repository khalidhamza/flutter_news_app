# News App

A Flutter news application that displays the latest articles in Business, Science, and Sports. The app features a clean UI, dark mode support, and search functionality.

## Features

- Browse news by category: Business, Science, Sports
- Search for news articles
- Toggle between light and dark mode
- State management using Bloc (flutter_bloc)
- Persistent theme preference with SharedPreferences

## Getting Started

### Prerequisites

- Flutter SDK
- Dart
- Android Studio or VS Code

### Installation

1. Clone the repository:
```bash
   git clone https://github.com/khalidhamza/flutter_news_app.git
   cd flutter_news_app
   ```
2. Install dependencies:
```bash
   flutter pub get
   ```
3. Run the app:
```bash
   flutter run
   ```


## Project Structure

- `lib/layout/home_layout.dart` - Main layout with navigation and theme toggle
- `lib/cubit/` - Bloc Cubit and states for app logic
- `lib/screens/` - News category and search screens
- `lib/components.dart` - Reusable UI components

## Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [shared_preferences](https://pub.dev/packages/shared_preferences)

## License

This project is licensed under the MIT License.
