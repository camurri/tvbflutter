import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_tvb/theme/theme_colors.dart';
import 'theme/theme_notifier.dart';
import 'pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MyApp()
  );
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
            theme: buildLightTheme(), // Tema claro
            darkTheme: buildDarkTheme(), // Tema escuro
            home: const Splash(),
          );
        },
      ),
    );
  }
}
