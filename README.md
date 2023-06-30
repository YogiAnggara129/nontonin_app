# nontonin_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Cara Penginstaran

- Copy file .env.example, lalu rename menjadi .env
- Pada .env, isikan variabel TOKEN dengan token yang didapatkan dari https://developers.themoviedb.org/
- Install package yang dibutuhkan dengan menjalankan perintah `flutter pub get` melalui terminal
- Build ke dalam apk dengan menjalankan perintah `flutter build apk --split-per-abi`. 
- Apk yang telah selesai di-build terletak pada `build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk` dan dapat langsung dijalankan pada android
