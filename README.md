
# Bazar - Book Booking App

![Flutter](https://img.shields.io/badge/Flutter-v3.0-blue) ![License](https://img.shields.io/badge/license-MIT-green) ![PRs](https://img.shields.io/badge/PRs-welcome-brightgreen)

## Overview

**Bazar** is a Flutter application for booking and managing books. The app allows users to browse available books, reserve them, and manage bookings. It also integrates Google Maps for location-based services and Firebase Cloud Messaging (FCM) for notifications.

## ![App Logo]([assets/logo.png](https://github.com/alsaidmandor/bazar/blob/development/assets/images/app_logo.png))

## Features

- Browse a wide selection of books.
- Search for books by title, author, or genre.
- Book a book with an easy-to-use interface.
- Get notified when your book is ready via Firebase Cloud Messaging.
- Integrated Google Maps to find bookstores nearby.

## Design

You can view the app design on Figma: [Bazar - Books Mobile App](https://www.figma.com/design/LHwh1aoD9NGtyjsHHOrHBf/Bazar---Books-Mobile-App-(Community)?node-id=3861-5106&node-type=canvas&t=sF7dS32YAtvoV1SZ-0)

## Screenshots

<p float="left" align="center">
  <br>Splash Screen
  <img src="https://github.com/alsaidmandor/bazar/blob/development/assets/screenshots/spalsh_screen.png" width="200" />
  <br>OnBoarding Screen one
  <img src="https://github.com/alsaidmandor/bazar/blob/development/assets/screenshots/onboarding_1.png" width="200" />
 <br>OnBoarding Screen two
  <img src="https://github.com/alsaidmandor/bazar/blob/development/assets/screenshots/onboarding_2.png" width="200" />
<br>OnBoarding Screen Three
  <img src="https://github.com/alsaidmandor/bazar/blob/development/assets/screenshots/onboarding_3.png" width="200" />

</p>

*Add screenshots of your app here for a visual overview.*

## Getting Started

Follow these instructions to set up and run the project on your local machine.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Android Studio/VSCode](https://flutter.dev/docs/get-started/editor)
- JDK 17.0.2 or later
- A Firebase account for FCM integration
- Google Maps API key

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/alsaidmandor/bazar.git
   cd bazar
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Set up Firebase:**
    - Go to [Firebase Console](https://console.firebase.google.com/).
    - Create a new project.
    - Download `google-services.json` and add it to `android/app/`.

4. **Configure Google Maps:**
    - Obtain a Google Maps API key from the [Google Cloud Console](https://console.cloud.google.com/).
    - Add the API key to `android/app/src/main/AndroidManifest.xml` under `<application>` tag:
      ```xml
      <meta-data
         android:name="com.google.android.geo.API_KEY"
         android:value="YOUR_API_KEY"/>
      ```

5. **Run the app:**
   ```bash
   flutter run
   ```

## Folder Structure

Here’s a brief explanation of the folder structure:

```bash
├── lib
│   ├── core
│   │   ├── helper
│   │   ├── networking
│   │   ├── routing
│   │   ├── theme
│   │   ├── utils
│   │   ├── widgets
│   ├── Feature
│   │   ├── authentication
│   │   ├── cart
│   │   ├── category
│   │   ├── feed
│   │   ├── home
│   │   ├── onboarding
│   │   ├── profile
├── generated
├── res
│   ├── bazar_app.dart
│   ├── bloc_observer.dart
│   ├── firebase_options.dart
│   ├── main_development.dart
│   ├── main_production.dart      
```

## Contributing

Feel free to fork this repository and contribute by submitting a pull request. All contributions are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

- **Author:** Alsaeid Mandor
- **Email:** alsaidmandor@example.com
- **GitHub:** [alsaidmandor](https://github.com/alsaidmandor)
