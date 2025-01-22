import 'package:flutter/material.dart';
import 'package:myapp/screens/admin/admin_akun.dart';
import 'package:myapp/screens/admin/admin_berita.dart';
import 'package:myapp/screens/admin/admin_dashboard.dart';
import 'package:myapp/screens/admin/admin_detailkonsul.dart';
import 'package:myapp/screens/admin/admin_permohonan.dart';

class AdminKonsultasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konsultasi"),
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
                  'NIK: 331208xxxxxxxxxx\nNo.KK: 331208xxxxxxxxxx\nKonsultasi: Rubah Akta Kelahiran',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminDetailkonsul()));
              },
              onDeletePressed: () {
                // Handle delete button press for Nama: Anton
              },
              onDetailPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminDetailkonsul()));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the FAB press
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 139, 32, 24),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.list,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminPermohonan()));
              },
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.chat,
                color: const Color.fromARGB(255, 139, 32, 24),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminKonsultasi()));
              },
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminDashboard()));
              },
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.newspaper_rounded,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminBerita()));
              },
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.account_box,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminAkun()));
              },
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class ButtonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onDetailPressed;

  ButtonCard(
      {required this.title,
      required this.subtitle,
      required this.onDetailPressed,
      required Null Function() onPressed,
      required Null Function() onDeletePressed});

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
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: onDetailPressed,
          ),
        ],
      ),
    );
  }
}
