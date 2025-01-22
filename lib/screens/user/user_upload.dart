import 'package:flutter/material.dart';
import 'package:myapp/screens/user/user_permohonan.dart';

class UserUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload File"),
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
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '3. Upload File',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Upload Persyaratan',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 92, 7, 252)),
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Pilih File'),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserPermohonan()),
                );
              },
              child: Text('Selesai'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 139, 32, 24),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
