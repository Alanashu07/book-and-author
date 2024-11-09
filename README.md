# Book & Author | Flutter Assignment - REST API, BLoC Pattern, Figma Design, and SharedPreferences

This Flutter project demonstrates a mobile application that follows best practices in Flutter development, including the usage of **REST API** to fetch data, **BLoC (Business Logic Component)** for state management, **SharedPreferences** for local storage, and a **Figma Design** for UI/UX design.

## Table of Contents
- [Overview](#overview)
- [Technologies Used](#technologies-used)
- [Features](#features)
- [Setup Instructions](#setup-instructions)
- [Folder Structure](#folder-structure)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)

## Overview

This Flutter project is a sample mobile application that demonstrates the following functionalities:
- Fetching data from a REST API.
- Using the **BLoC** pattern for state management.
- Implementing **SharedPreferences** for storing user web token locally.
- Following a **Figma design** for UI/UX consistency.

The app allows users to perform basic tasks such as:
- Viewing data fetched from the server.
- Navigating through different screens.
- Storing and retrieving preferences with SharedPreferences.

## Technologies Used
- **Flutter** - Cross-platform mobile app framework.
- **Dart** - Programming language used to build the app.
- **REST API** - To fetch remote data from the backend.
- **BLoC Pattern** - For state management.
- **SharedPreferences** - For storing user web token.
- **Figma** - UI/UX design tool used to design the app interface.

## Features
- **Data Fetching**: The app uses a REST API to fetch data and display it in a list.
- **State Management**: BLoC (Business Logic Component) is used to manage state, ensuring clean and testable code.
- **Local Storage**: SharedPreferences is used to save user settings/preferences.
- **Responsive UI**: The app follows a modern UI design created using Figma, ensuring a great user experience across different screen sizes.
- **Error Handling**: The app provides basic error handling when fetching data from the API or when user settings cannot be saved/retrieved.

## Setup Instructions

### Prerequisites
Make sure you have the following installed:
- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) or any other code editor (VS Code, IntelliJ)

### Steps to Run the App

1. **Clone the repository**:
    ```bash
    git clone https://github.com/Alanashu07/book-and-author.git
    ```

2. **Navigate to the project directory**:
    ```bash
    cd book-and-author
    ```

3. **Install dependencies**:
    ```bash
    flutter pub get
    ```

4. **Run the app**:
    ```bash
    flutter run
    ```

The app will launch in an emulator or connected device.

### Configuration for REST API

The app communicates with a backend server using a REST API. Ensure that the API endpoints are correctly configured in `lib/State/`.

### SharedPreferences Configuration

SharedPreferences is used to store simple data like user preferences. The app automatically handles storing and retrieving data, but you can modify the settings stored in `lib/Services/preferences.dart`.

### Install and test Mobile Application

- [Google Drive](https://drive.google.com/file/d/1KIQxsaD7e2sDMqgjbH6Ian9a6joLRJ-g/view?usp=sharing)


## Folder Structure

```bash
lib/
├── Constants/            # Constant values
│   ├── alerts.dart        # Alert constants
│   ├── routes.dart        # Route constants
├── Models/               # Data models
│   ├── author_model.dart  # Author data model
│   ├── book_model.dart    # Book data model
├── Screens/              # UI screens
│   ├── Authentication/    # Authentication screens
│   │   ├── login_screen.dart  # Login screen
│   │   └── register_screen.dart  # Register screen
│   ├── MainScreens/       # Main screens
│   │   ├── authors_screen.dart  # Authors screen
│   │   └── books_screen.dart    # Books screen
│   ├── home_screen.dart   # Home screen
│   └── books_details.dart # Books details screen
├── Services/             # Services for API calls and SharedPreferences
│   ├── api_service.dart   # Handles API requests
│   └── preferences.dart   # SharedPreferences utility
├── State/                # BLoC state management
│   ├── AuthorState/       # Author state management
│   │   ├── authors_screen_bloc.dart  # Authors screen BLoC
│   │   └── authors_screen_events.dart  # Authors screen events
│   ├── BookState/         # Book state management
│   │   ├── books_screen_bloc.dart  # Books screen BLoC
│   │   └── books_screen_events.dart  # Books screen events
│   ├── BookDetailsState/  # Book details state management
│   │   ├── book_details_bloc.dart  # Book details BLoC
│   │   └── book_details_events.dart  # Book details events
│   └── RatingState/       # Rating state management
│       ├── rating_bloc.dart  # Rating BLoC
│       └── rating_events.dart  # Rating events
├── Style/                # App styles
│   └── app_style.dart     # App style constants
├── Utils/                # Utility files
│   └── shared_preferences_service.dart  # SharedPreferences utility
└── main.dart             # Main entry point of the app
