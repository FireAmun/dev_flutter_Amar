# Book Rental System (Flutter)

Small demo app to manage book rentals locally (in-memory). Shows Clean-ish layering, OOP models, a repository/service layer, Provider state management, and a simple UI.

How to run (Windows PowerShell):

```powershell / terminal
Set-Location -Path 'C:\Users\User\Desktop\PERSONAL\Gates\dev_flutter\book_rental_system' (Use Your Location)
flutter pub get
flutter run
```

Files added/edited:
- `lib/src/models/` — `entity.dart`, `book.dart`, `user.dart` (OOP models with inheritance)
- `lib/src/repository/book_repository.dart` — in-memory repository and interface
- `lib/src/providers/book_provider.dart` — Provider-based state management
- `lib/src/ui/book_list_screen.dart` — ListView UI with Borrow/Return actions
- `lib/main.dart` — wires provider and launches `BookListScreen`
- `pubspec.yaml` — added `provider` dependency

Notes:
- State is kept in memory; no backend used. The repository enforces availability rules and throws on invalid operations. UI buttons call provider methods which notify listeners.
- Check the Screenshots Folder


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
