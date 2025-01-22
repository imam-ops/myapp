import 'package:flutter/material.dart';
import 'package:myapp/models/database.dart';
import 'package:myapp/models/upload.dart';
import 'package:myapp/services/upload_service.dart';
import 'package:myapp/screens/admin/admin_permohonan.dart';

class AdminUpload extends StatelessWidget {
  final TextEditingController adminNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final UploadService _uploadService = UploadService();
  final DatabaseModel databaseModel;

  AdminUpload({required this.databaseModel});

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
              'Upload File',
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
            SizedBox(height: 20),
            TextField(
              controller: adminNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nama Admin',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Keterangan',
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                // Simpan data disini
                var uploadData = AdminUploadModel(
                  namaPemohon: databaseModel.nama,
                  nik: databaseModel.nik,
                  namaAdmin: adminNameController.text,
                  keterangan: descriptionController.text,
                  jenisPelayanan: databaseModel.jenispelayanan,
                );

                try {
                  await _uploadService.saveUploadData(uploadData);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminPermohonan()),
                  );
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Gagal menyimpan data: $error')),
                  );
                }
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
