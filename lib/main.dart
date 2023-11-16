

// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/main_page.dart'; 
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutterバインディングの初期化
  await Firebase.initializeApp(); // Firebaseの初期化
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
} // アプリのエントリポイント。MyApp クラスのインスタンスを作成し、RiverpodのProviderScopeでラップしてアプリを起動

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // MyApp クラスのコンストラクタ。キーをオプションとして受け取る

  @override
Widget build(BuildContext context) {
  // カスタムのカラースウォッチを定義
  Map<int, Color> customSwatch = {
    50: const Color.fromRGBO(1, 0, 56, .1),
    100: const Color.fromRGBO(1, 0, 56, .2),
    200: const Color.fromRGBO(1, 0, 56, .3),
    300: const Color.fromRGBO(1, 0, 56, .4),
    400: const Color.fromRGBO(1, 0, 56, .5),
    500: const Color.fromRGBO(1, 0, 56, .6),
    600: const Color.fromRGBO(1, 0, 56, .7),
    700: const Color.fromRGBO(1, 0, 56, .8),
    800: const Color.fromRGBO(1, 0, 56, .9),
    900: const Color.fromRGBO(1, 0, 56, 1),
  };

  // カスタムのMaterialColorを定義
  MaterialColor customMaterialColor = MaterialColor(0xFF010038, customSwatch);

  return MaterialApp(
    title: 'Driverz App', // アプリのタイトルを設定
    theme: ThemeData(
      primarySwatch: customMaterialColor, // カスタムカラーをプライマリスウォッチとして設定
      scaffoldBackgroundColor: const Color.fromARGB(255, 1, 0, 56), // 背景色を設定
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white), // テキストスタイルを設定
        bodyMedium: TextStyle(color: Colors.white),
      ),
      fontFamily: 'Roboto', // デフォルトフォントを設定
    ),
    home: const MainPage(), // ホーム画面を設定
  );
}
}
