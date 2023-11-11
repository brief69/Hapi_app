

// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/main_page.dart'; 

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driverz App',
      theme: ThemeData(
        // テーマのプライマリカラーを設定
        primarySwatch: const Color.fromARGB(255, 1, 0, 56),
        // Scaffoldなどの背景色を設定
        scaffoldBackgroundColor: const Color.fromARGB(255, 1, 0, 56),
        // アプリ全体のテキストテーマを設定
        textTheme: const TextTheme(
          // すべてのテキストに共通のスタイルを適用
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          // その他のテキストスタイルもここで設定できます
        ),
        // アプリ全体のデフォルトフォントを指定
        fontFamily: 'Roboto',
      ),
      home: const MainPage(),
    );
  }
}
