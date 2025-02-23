import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_tvb/theme/theme_colors.dart';
import 'theme/theme_notifier.dart';
import 'pages/splash.dart';


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
            theme: buildLightTheme(), // Usando a função para o tema claro
            darkTheme: buildDarkTheme(), // Usando a função para o tema escuro
            home: const Splash(),
          );
        },
      ),
    );
  }
}
