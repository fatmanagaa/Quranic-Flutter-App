<div align="center">

# 🕌 Islami App

**A comprehensive Islamic companion app built with Flutter**

*Read the Holy Quran, listen to Islamic radio, track your daily Dhikr, and stay on time with prayer reminders — all in one beautifully crafted app.*

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)](https://dart.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

</div>

---

## 📖 Table of Contents

- [About](#-about)
- [Features](#-features)
- [Screenshots](#-screenshots)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Installation & Setup](#-installation--setup)
- [Usage](#-usage)
- [Future Improvements](#-future-improvements)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🌙 About

**Islami App** is a full-featured Islamic mobile application developed with Flutter. It is designed to serve as a daily spiritual companion for Muslims — providing easy access to the Holy Quran, Hadith collections, a digital Sebha (Tasbeeh counter), Islamic radio stations, and prayer time reminders, all wrapped in a clean and elegant dark-themed UI.

---

## ✨ Features

| Feature | Description |
|---|---|
| 📚 **Quran Al-Kareem** | Browse all 114 Surahs, read Ayahs, and keep track of recently read Surahs |
| 📜 **Hadith (Hadeth)** | Explore an organized Hadith collection with detailed views |
| 📿 **Sebha (Dhikr Counter)** | Animated digital Tasbeeh with rotating beads, cycling through popular Azkar (33-count per Zekr) |
| 📻 **Islamic Radio** | Listen to live Islamic radio stations and browse Quran reciters |
| 🕐 **Prayer Times** | Dedicated tab for daily prayer time display *(in progress)* |
| 🌑 **Dark Mode** | Elegant dark theme as the default experience |
| 🖼️ **Onboarding Screen** | Smooth introduction screen for first-time users |
| 💾 **Persistent State** | Recently read Surahs are remembered across sessions using local storage |

---

## 📱 Screenshots

> *Screenshots will be added here once the UI is finalized.*

| Splash | Home / Quran | Hadeth | Sebha | Radio |
|:---:|:---:|:---:|:---:|:---:|
| *(coming soon)* | *(coming soon)* | *(coming soon)* | *(coming soon)* | *(coming soon)* |

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| **Framework** | [Flutter](https://flutter.dev) (Dart) |
| **State Management** | [Provider](https://pub.dev/packages/provider) `^6.1.5` |
| **Local Storage** | [shared_preferences](https://pub.dev/packages/shared_preferences) `^2.5.5` |
| **UI Scaling** | [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) `^5.9.3` |
| **Typography** | [google_fonts](https://pub.dev/packages/google_fonts) `^7.0.2` |
| **Carousel / Sliders** | [carousel_slider](https://pub.dev/packages/carousel_slider) `^5.1.1` |
| **Onboarding** | [introduction_screen](https://pub.dev/packages/introduction_screen) `^4.0.0` |
| **Splash Screen** | [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) `^2.4.7` |
| **Data** | Local asset files (Quran Surahs & Hadith in `assets/files/`) |

---

## 📂 Project Structure

```
lib/
├── main.dart                    # App entry point, Provider setup, routing
│
├── core/                        # App-wide constants and configuration
│   ├── app_assets.dart          # Asset path constants
│   ├── app_colors.dart          # Color palette
│   ├── app_routes.dart          # Named route definitions
│   ├── app_styles.dart          # Shared TextStyle definitions
│   ├── app_theme.dart           # Dark/Light ThemeData
│   └── cache_helper.dart        # SharedPreferences wrapper
│
├── model/                       # Data models
│   ├── hadeth.dart              # Hadith model
│   ├── quran_resources.dart     # Quran/Surah model
│   └── recent_surah.dart        # Recently read Surah model
│
├── provider/                    # State management
│   └── most_recently_provider.dart  # Tracks recently read Surahs
│
└── features/                    # Feature-based UI modules
    ├── splash/
    │   └── splash_screen.dart
    ├── introduction/
    │   └── intro_screen.dart
    └── home/
        ├── home_screen.dart     # Bottom navigation shell
        └── tabs/
            ├── quran/           # Quran reading feature
            │   ├── quran_tab.dart
            │   ├── widget/
            │   └── details/
            ├── hadeth/          # Hadith browsing feature
            │   ├── hadeth_tab.dart
            │   ├── widgets/
            │   └── details/
            ├── sebha/           # Digital Tasbeeh counter
            │   └── sebha_tab.dart
            ├── radio/           # Islamic radio & reciters
            │   ├── radio_tab.dart
            │   ├── model/
            │   ├── data/
            │   └── widgets/
            └── time/            # Prayer times
                └── time_tab.dart

assets/
├── images/                      # App images and backgrounds
└── files/
    ├── quran/suras/             # Quran Surah text files
    └── Hadeeth/Hadeeth/         # Hadith collection files
```

---

## 🚀 Installation & Setup

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=3.9.0`
- [Dart SDK](https://dart.dev/get-dart) `>=3.9.0`
- Android Studio / Xcode (for device emulation)
- A physical device or emulator

### Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/fatmanagaa/Quranic-Flutter-App.git
   cd Quranic-Flutter-App
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Generate the native splash screen** *(optional, already configured)*

   ```bash
   dart run flutter_native_splash:create
   ```

4. **Run the app**

   ```bash
   flutter run
   ```

   To target a specific device:

   ```bash
   flutter run -d <device_id>
   ```

   List available devices:

   ```bash
   flutter devices
   ```

5. **Build a release APK** *(Android)*

   ```bash
   flutter build apk --release
   ```

---

## 📲 Usage

1. **Launch** — The app opens with a native splash screen, then transitions to an onboarding introduction for first-time users.
2. **Navigate** — Use the bottom navigation bar to switch between five main sections: Quran, Hadeth, Sebha, Radio, and Time.
3. **Read Quran** — Tap any Surah from the list to open the full text. Your recently read Surahs appear at the top for quick access.
4. **Browse Hadith** — Scroll through the Hadith list and tap any entry to view its full text on a dedicated details screen.
5. **Use Sebha** — Tap the rotating bead image to increment the Dhikr counter. After every 33 counts, it automatically advances to the next Zekr.
6. **Listen to Radio** — Switch between the Radio and Reciters tabs to choose your preferred Islamic audio stream.
7. **Check Prayer Times** — View today's prayer schedule from the Time tab.

---

## 🔮 Future Improvements

- [ ] 🔊 **Audio Quran** — Stream or download recitations from popular reciters
- [ ] 🗺️ **Qibla Direction** — Compass-based Qibla finder using device sensors
- [ ] ⏰ **Prayer Time Notifications** — Local push notifications at Adhan times
- [ ] 🌐 **Multilingual Support** — English, Arabic, and more interface languages
- [ ] 📖 **Tafsir (Quran Commentary)** — Verse-by-verse explanation and interpretation
- [ ] 🔍 **Quran Search** — Search Ayahs by keyword or Surah name
- [ ] 🔖 **Bookmarks** — Save and revisit favourite Ayahs and Hadiths
- [ ] ☀️ **Morning & Evening Azkar** — Structured Azkar sections with reminders
- [ ] ☀️ **Light Mode** — Full light theme support
- [ ] 📴 **Offline Mode** — Full offline support for all content

---

## 🤝 Contributing

Contributions are welcome and greatly appreciated! Please follow these steps:

1. **Fork** the repository
2. **Create** a feature branch
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Commit** your changes with a clear message
   ```bash
   git commit -m "feat: add your feature description"
   ```
4. **Push** to your fork
   ```bash
   git push origin feature/your-feature-name
   ```
5. **Open a Pull Request** against the `main` branch and describe your changes

Please ensure your code:
- Follows the existing code style and project structure
- Does not break any existing functionality
- Includes relevant comments where the logic is non-trivial

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

Made with ❤️ and 🤲 — *May this app be a source of benefit for all Muslims.*

</div>
