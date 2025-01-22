import 'package:flutter/material.dart';
import 'package:myapp/screens/admin/admin_detailkonsul.dart';
import 'package:myapp/screens/user/user_permohonan.dart';

class UserCetak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permohonan Selesai"),
        backgroundColor: const Color.fromARGB(255, 139, 32, 24),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Handle phone button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ButtonCard(
              title: 'Nama: Anton',
              subtitle:
                  'NIK : 331208xxxxxxxxxx\nNo.KK : 331208xxxxxxxxxx\nKonsultasi : Rubah Akta Kelahiran\nStatus : Selesai',
              onDetailPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminDetailkonsul()));
              },
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminDetailkonsul()));
              },
              onDeletePressed: () {
                // Handle delete button press for Nama: Anton
              },
              onPrintPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => UserPermohonan()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onDetailPressed;
  final VoidCallback onPressed;
  final VoidCallback onDeletePressed;
  final VoidCallback onPrintPressed;

  ButtonCard({
    required this.title,
    required this.subtitle,
    required this.onDetailPressed,
    required this.onPressed,
    required this.onDeletePressed,
    required this.onPrintPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onDetailPressed,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4.0),
                    Text(subtitle, style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.print, color: Colors.red),
            onPressed: onPrintPressed,
          ),
        ],
      ),
    );
  }
}
