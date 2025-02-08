import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/splash.dart';
import 'pages/theme_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeNotifier.themeMode,
            theme: _buildLightTheme(),
            darkTheme: _buildDarkTheme(),
            home: const Splash(),
          );
        },
      ),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF032156),
      hintColor: const Color(0xFF0056b3),
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      textTheme: const TextTheme(bodyLarge: TextStyle(color: Color(0xFF212121))),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF032156),
        foregroundColor: Colors.white,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF032156), // Azul no tema claro
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF90CAF9),
      hintColor: const Color(0xFF42A5F5),
      scaffoldBackgroundColor: const Color(0xFF032156), // Azul escuro no fundo
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white), // Texto branco no tema escuro
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white, // Ícones brancos no tema escuro
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF032156), // Azul no SnackBar no tema escuro
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFF42A5F5),
        textTheme: ButtonTextTheme.primary,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
