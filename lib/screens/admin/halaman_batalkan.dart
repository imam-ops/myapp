import 'package:flutter/material.dart';

class AdminBatal extends StatelessWidget {
  final TextEditingController statusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Batal Permohonan"),
        backgroundColor: const Color.fromARGB(255, 139, 32, 24),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Alasan Pembatalan"),
            SizedBox(height: 10),
            TextField(
              controller: statusController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit status
                  Navigator.pop(context, statusController.text);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white),
                child: Text('Selesai'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
