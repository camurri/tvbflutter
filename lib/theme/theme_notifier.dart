import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  // Armazenar o tema atual
  ThemeMode _themeMode = ThemeMode.light;

  // Obter o tema atual
  ThemeMode get themeMode => _themeMode;

  // Construtor que carrega o tema salvo, se houver
  ThemeNotifier() {
    _loadTheme();
  }

  // Alternar entre os temas claro e escuro
  void toggleTheme() {
    _themeMode = (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    _saveTheme();
    notifyListeners();
  }

  // Carregar o tema salvo
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;  // Se não houver, assume claro
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // Salvar o tema escolhido
  Future<void> _saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _themeMode == ThemeMode.dark);
  }
}
