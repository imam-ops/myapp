import 'package:flutter/material.dart';
import 'package:myapp/screens/user/user_aktakelbaru.dart';
import 'package:myapp/screens/user/user_aktakelhilang.dart';
import 'package:myapp/screens/user/user_aktakelrusak.dart';
import 'package:myapp/screens/user/user_rubahaktakel.dart';

class UserAktakel extends StatelessWidget {
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
          _buildButton(context, 'Akta Kelahiran Baru', UserAktakelbaru()),
          _buildButton(context, 'Perubahan Data Akta Kelahiran', UserRubahaktakel()),
          _buildButton(context, 'Akta Kelahiran Hilang', UserAktakelhilang()),
          _buildButton(context, 'Akta Kelahiran Rusak', UserAktakelrusak()),
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
