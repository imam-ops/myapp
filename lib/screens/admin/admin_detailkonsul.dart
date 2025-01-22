import 'package:flutter/material.dart';

class AdminDetailkonsul extends StatelessWidget {
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Konsultasi Permasalahan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildDetailText('NIK Pemohon', '331208xxxxxxxxxx'),
              _buildDetailText('Nama Pemohon', 'Anton'),
              _buildDetailText('No. HP Pemohon', '0821 xxxx xxxx'),
              _buildDetailText('Permasalahan', 'Rubah Akta Kelahiran',),
              SizedBox(height: 20),
              Text(
                'Chat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildChatMessage('Admin', '09.32', 'Lampiri Foto Ijazah'),
                    SizedBox(height: 10),
                    _buildReplySection(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle send button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 139, 32, 24),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text('Kirim'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessage(String sender, String time, String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$sender:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Expanded(child: Text(message)),
        Text('  $time'),
      ],
    );
  }

  Widget _buildReplySection() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Balas',
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }
}
