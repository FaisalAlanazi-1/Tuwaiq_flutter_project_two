# Palyzone 

> A Flutter mobile app for browsing free-to-play games, exploring them by platform, and saving favorites to a personal wishlist.

[![Flutter](https://img.shields.io/badge/-FLUTTER-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/-DART-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
![Platform](https://img.shields.io/badge/PLATFORM-iOS%20%7C%20ANDROID-333333?style=for-the-badge)

---

## 📖 Overview

Palyzone is a mobile app built with Flutter that showcases free-to-play games sourced from the [FreeToGame API](https://www.freetogame.com/api-doc) — including titles across genres like Shooter, MMORPG, Strategy, Battle Royale, and more, playable on PC or Browser.

Each game includes a thumbnail, short and full description, genre and platform tags, developer/publisher info, and release date — all wrapped in a clean, custom dark UI built from scratch with a consistent red-accent design system.

---

## ✨ What's Covered

- 🧱 **Layout widgets** — `Column`, `Row`, `Stack`, `Padding`, `SizedBox`, `Expanded`
- 🎡 **Grid & Lists** — `GridView.builder`, `ListView.builder`, `ListView.separated`
- 🔤 **Custom typography** — `google_fonts` (Poppins), centralized in `AppFonts`
- 🎨 **Centralized theming** — `AppColors` constants for background, card, accent, and text colors
- 📍 **Navigation** — `IndexedStack` for bottom tab switching, `Navigator.push` for details screens
- ❤️ **Wishlist system** — toggle games in/out of a wishlist with live UI updates via `setState`
- 🖼️ **Media widgets** — `Image.network` 
- 🧩 **Structural widgets** — `Scaffold`, `AppBar`, custom floating pill-shaped bottom navigation bar
- 🔍 **Genre filter chips** — `ChoiceChip`, filtered client-side against fetched data
- ⏳ **Async data handling** — `FutureBuilder` for loading, error, and empty states on every API call
- 🚀 **Splash screen** — dedicated onboarding screen shown on app launch

---

## 🌐 API Used

This project uses two related endpoints from the **FreeToGame API**, following the list → details pattern:

| Purpose | Endpoint |
|---|---|
| List all games | `GET /api/games` |
| Games by platform | `GET /api/games?platform={pc\|browser}` |
| Game details | `GET /api/game?id={id}` |

The `id` from the list screen is passed to the details screen to fetch full game information.

---

## 📁 Project Structure

```
palyzone/
├── lib/
│   ├── main.dart
│   │
│   ├── constants/
│   │   ├── app_colors.dart        # centralized color palette
│   │   ├── app_fonts.dart         # centralized Google Fonts text styles
│   │   ├── game_filters.dart      # genre & platform filter lists
│   │   └── wishlist_data.dart     # shared wishlist state + toggle logic
│   │
│   ├── models/
│   │   ├── game.dart              # Game model (fromJson)
│   │   └── game_details.dart      # GameDetails model (fromJson), extends Game
│   │
│   ├── screens/
│   │   ├── splash_screen/
│   │   │   └── splash_screen.dart
│   │   │
│   │   ├── root_screen/
│   │   │   └── root_screen.dart   # bottom nav + IndexedStack
│   │   │
│   │   ├── home_screen/
│   │   │   └── home_screen.dart
│   │   │
│   │   ├── platforms_screen/
│   │   │   └── platforms_screen.dart
│   │   │
│   │   ├── platform_games_screen/
│   │   │   └── platform_games_screen.dart
│   │   │
│   │   ├── game_details_screen/
│   │   │   └── game_details_screen.dart
│   │   │
│   │   └── wishlist_screen/
│   │       └── wishlist_screen.dart
│   │
│   └── services/
│       └── game_api_service.dart  # all HTTP calls to the FreeToGame API
│
├── pubspec.yaml
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed and configured
- An emulator/simulator or physical device
- A code editor (VS Code or Android Studio recommended)

### Run the project

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/palyzone.git
cd palyzone

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Check your setup

```bash
flutter doctor
```




## 📸 Screenshots



<img width="407" height="863" alt="Screenshot 2026-09-06 154021" src="https://github.com/user-attachments/assets/8539d4cc-43db-44aa-a45d-f86d001df64e" />

<img width="800"  alt="Screenshot_1788697059" src="https://github.com/user-attachments/assets/2be57dca-7a22-4041-a205-cfb740bdb531" />
<img width="800"  alt="Screenshot_1788697065" src="https://github.com/user-attachments/assets/fcbb7c84-e49d-495d-a0ec-2201570239fe" />
<img width="800"  alt="Screenshot_1788697069" src="https://github.com/user-attachments/assets/0db3e119-0a66-487e-a1bb-39dc447817a7" />
<img width="800"  alt="Screenshot_1788697109" src="https://github.com/user-attachments/assets/a5b2272e-23e8-48f8-8e8e-c1ecef5a730e" />
<img width="800" alt="Screenshot_1788697112" src="https://github.com/user-attachments/assets/48cd54e5-9e0b-4a84-aca0-2541dd659f11" />
<img width="800"  alt="Screenshot_1788697121" src="https://github.com/user-attachments/assets/b2a928a6-7cda-417e-bd04-c5358c68ed99" />







---

## 🧠 Key Takeaways

- Splitting UI into `screens/` per feature keeps each screen self-contained and easy to navigate.
- Sharing mutable state (like the wishlist) across screens works safely through a simple shared list + toggle function, avoiding the need for a full state-management package.
- A centralized `AppColors` / `AppFonts` system keeps the UI visually consistent and makes future redesigns a one-file change instead of a search-and-replace across the whole codebase.

---

## 🔗 Related Resources

- [FreeToGame API Docs](https://www.freetogame.com/api-doc)
- [Flutter Widget Catalog](https://docs.flutter.dev/ui/widgets)
- [Flutter Layout Cheat Sheet](https://docs.flutter.dev/ui/layout)

---

Made with 💜 Faisal Alanazi
