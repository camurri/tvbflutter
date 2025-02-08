import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  // Armazenar o tema atual
  ThemeMode _themeMode = ThemeMode.light;

  // Obter o tema atual
  ThemeMode get themeMode => _themeMode;

  // Alternar entre os temas claro e escuro
  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}

