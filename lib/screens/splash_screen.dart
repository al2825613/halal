import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF23272F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withOpacity(0.7),
                    blurRadius: 30,
                    spreadRadius: 2,
                  )
                ],
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.qr_code_scanner, size: 120, color: Colors.white),
            ),
            const SizedBox(height: 28),
            Text(
              'تطبيق كشف المنتجات الحلال',
              style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.greenAccent,
                    )
                  ]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            CircularProgressIndicator(color: Colors.orangeAccent),
          ],
        ),
      ),
    );
  }
}