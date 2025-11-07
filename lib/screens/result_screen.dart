import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String barcode;
  final String productName;
  final String status;
  final String country;
  final String description;
  final String imageUrl;

  const ResultScreen({
    required this.barcode,
    required this.productName,
    required this.status,
    required this.country,
    required this.description,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color cardColor = Color(0xFF23272F);
    Color glowColor = status == 'حلال'
        ? Colors.greenAccent
        : status == 'حرام'
            ? Colors.redAccent
            : Colors.orangeAccent;

    Widget statusIcon = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(0.6),
            blurRadius: 30,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Image.asset(
        status == 'حلال'
            ? 'assets/halal.png'
            : status == 'حرام'
                ? 'assets/haram.png'
                : 'assets/unknown.png',
        height: 100,
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFF181C23),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('نتيجة المسح', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // أضف كود المشاركة هنا إذا أردت لاحقاً
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: glowColor.withOpacity(0.14),
                offset: const Offset(2, 12),
                blurRadius: 40,
                spreadRadius: 7,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              statusIcon,
              const SizedBox(height: 18),
              Text(
                '$productName',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.92),
                ),
              ),
              Text('بلد المنشأ: $country',
                  style: TextStyle(color: Colors.amber[200], fontSize: 18)),
              const SizedBox(height: 11),
              Text('الحالة الشرعية:',
                  style: TextStyle(color: Colors.white70, fontSize: 18)),
              Text(
                status,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: glowColor,
                  shadows: [
                    Shadow(
                      blurRadius: 12,
                      color: glowColor,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (description.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey[900]?.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (imageUrl.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(imageUrl, height: 70),
                ),
              const SizedBox(height: 14),
              if (status == 'غير معروف')
                ElevatedButton(
                  onPressed: () {
                    // أضف كود إضافة منتج جديد إذا أردت لاحقاً
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent[700],
                    shape: StadiumBorder(),
                  ),
                  child: const Text('أضف هذا المنتج لدينا',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              const SizedBox(height: 8),
              Text('الباركود: $barcode',
                  style: TextStyle(color: Colors.grey[400], fontSize: 15)),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: cardColor.withOpacity(0.50),
                  shape: StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 13),
                  shadowColor: glowColor,
                ),
                child: const Text('رجوع للرئيسية',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}