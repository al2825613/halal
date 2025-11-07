import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(BarcodeHalalApp());
}

class BarcodeHalalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق المنتجات الحلال',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.greenAccent.shade400,
          secondary: Colors.orangeAccent.shade200,
          surface: Color(0xFF23272F),
          background: Color(0xFF181C23),
        ),
        fontFamily: 'Cairo',
        useMaterial3: true,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}