// Установленные модули
import 'package:provider/provider.dart';
// Стандартные модули
import 'package:flutter/material.dart';

// Модули приложения
import 'theme.dart';
import 'data.dart';
import 'pages/devices_page.dart';
import 'pages/main_page.dart';
import 'package:nagaudio/pages/device_properties.dart';
// import 'pages/main_page_library.dart';
// import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Основа основ приложения
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NagAudio',
          theme: AppTheme.darkTheme,
          home: DevicesPage(),
          themeMode: ThemeMode.light,
          routes: {
            '/main': (context) => MainPage(),
            '/devices': (context) => DevicesPage(),
            // '/mixer': (context) => HomePage(),
            // '/library': (context) => MainPageLibrary(),
            '/device': (context) => DeviceProperties()
          },

      )
    );
  }
}
