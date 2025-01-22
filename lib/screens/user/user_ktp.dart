import 'package:flutter/material.dart';
import 'package:myapp/screens/user/user_ktpbaru.dart';
import 'package:myapp/screens/user/user_ktphilang.dart';
import 'package:myapp/screens/user/user_ktprusak.dart';
import 'package:myapp/screens/user/user_rubahktp.dart';

class UserKtp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kartu Tanda Penduduk"),
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
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildButton(context, 'KTP Baru', UserKtpbaru()),
          _buildButton(context, 'Perubahan Data KTP', UserRubahktp()),
          _buildButton(context, 'KTP Hilang', UserKtphilang()),
          _buildButton(context, 'KTP Rusak', UserKtprusak()),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white60, // Background color
          foregroundColor: Colors.black, // Text color
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
