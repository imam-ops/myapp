import 'package:flutter/material.dart';
import 'package:myapp/screens/user/user_kiabaru.dart';
import 'package:myapp/screens/user/user_kiahilang.dart';
import 'package:myapp/screens/user/user_kiarusak.dart';
import 'package:myapp/screens/user/user_rubahkia.dart';

class UserKia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kartu Keluarga"),
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
          _buildButton(context, 'KIA Baru', UserKiabaru()),
          _buildButton(context, 'Perubahan Data KIA', UserRubahkia()),
          _buildButton(context, 'KIA Hilang', UserKiahilang()),
          _buildButton(context, 'KIA Rusak', UserKiarusak()),
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
