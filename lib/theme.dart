import 'package:flutter/material.dart';

class AppTheme {
  // Тема приложения
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[900],
        cardColor: const Color.fromRGBO(30, 30, 30, 1),

        canvasColor: const Color.fromRGBO(30, 30, 30, 1),

        iconTheme: IconThemeData(
          color: Colors.white,
          size: 38
        ),

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        ),

        textTheme: TextTheme(
          // Стиль текста для заголовков в аппБаре
          headline1: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.grey[200]
          ),
          // Стиль текста для заголовков пунктов меню
          headline2: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          // Стиль текста для заголовков всплывающих окон
          headline3: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          // Пункты меню вспывающих окон
          bodyText1: TextStyle(
            fontSize: 16,
            color: Colors.grey
          ),
          // Активные пункты меню вспывающих окон
          bodyText2: TextStyle(
            fontSize: 16,
            color: Colors.green[300]
          ),
          // Подзаголовки пунктов меню
          subtitle1: TextStyle(
            fontSize: 16,
            color: Colors.grey
          )
        )
      );

}
