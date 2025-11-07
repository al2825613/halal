import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'result_screen.dart';

final halalDatabase = {
  "1234567890123": {
    "name": "شوكولاتة مثال",
    "status": "حلال",
    "country": "تركيا",
    "description": "لا تحتوي على أي مكون محرم",
    "imageUrl": ""
  },
  "9876543210987": {
    "name": "منتج يحتوي كحول",
    "status": "حرام",
    "country": "فرنسا",
    "description": "يحتوي على كحول في مكوناته",
    "imageUrl": ""
  },
  "5556667778888": {
    "name": "عصير طبيعي",
    "status": "حلال",
    "country": "مصر",
    "description": "مكونات طبيعية فقط",
    "imageUrl": ""
  },
  "7001122334455": {
    "name": "لحوم ليست معلومة المصدر",
    "status": "غير معروف",
    "country": "غير معلوم",
    "description": "لم يتم التأكد من الذبح الشرعي",
    "imageUrl": ""
  },
};

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> scanBarcode() async {
    var scanResult = await BarcodeScanner.scan();
    final product = halalDatabase[scanResult.rawContent];
    String barcode = scanResult.rawContent;
    String name = product != null ? product['name'] : 'منتج غير مسجل';
    String status = product != null ? product['status'] : 'غير معروف';
    String country = product != null ? product['country'] ?? 'غير معروف' : 'غير معروف';
    String description = product != null ? product['description'] ?? '' : '';
    String imageUrl = product != null ? product['imageUrl'] ?? '' : '';

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ResultScreen(
          barcode: barcode,
          productName: name,
          status: status,
          country: country,
          description: description,
          imageUrl: imageUrl,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الرئيسية', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.orangeAccent.withOpacity(0.58),
                        blurRadius: 25,
                        spreadRadius: 6),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/halal.png', height: 110),
              ),
              SizedBox(height: 36),
              Text(
                'امسح باركود المنتج',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.greenAccent,
                  shadows: [
                    Shadow(color: Colors.greenAccent, blurRadius: 12)
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'لمعرفة هل المنتج حلال أو حرام أو يحتاج مراجعة ويوضح بلد المنشأ والمكونات',
                style: TextStyle(
                    fontSize: 17, color: Colors.white70, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: scanBarcode,
                icon: Icon(Icons.camera_alt, size: 30),
                label: Text('امسح الباركود', style: TextStyle(fontSize: 26)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF23272F),
                  foregroundColor: Colors.greenAccent,
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 52),
                  shape: StadiumBorder(),
                  shadowColor: Colors.orangeAccent,
                  elevation: 12,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              SizedBox(height: 22),
              Text('ساهم في أمان الغذاء المجتمعي!', style: TextStyle(color: Colors.orangeAccent)),
            ],
          ),
        ),
      ),
    );
  }
}