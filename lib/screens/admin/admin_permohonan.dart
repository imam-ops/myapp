import 'package:flutter/material.dart';
import 'package:myapp/models/database.dart';
import 'package:myapp/screens/admin/admin_akun.dart';
import 'package:myapp/screens/admin/admin_berita.dart';
import 'package:myapp/screens/admin/admin_dashboard.dart';
import 'package:myapp/screens/admin/admin_konsultasi.dart';
import 'package:myapp/screens/admin/admin_upload.dart';
import 'package:myapp/screens/admin/berita_detail.dart';
import 'package:myapp/screens/admin/detail_permohonan.dart';
import 'package:myapp/screens/admin/halaman_batalkan.dart';
import 'package:myapp/services/database_service.dart';

class AdminPermohonan extends StatelessWidget {
  final DatabaseService databaseService = DatabaseService();

  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Permohonan"),
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
              // Handle account button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<List<DatabaseModel>>(
                stream: databaseService.getDatabaseList('Database'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<DatabaseModel>? dataList = snapshot.data;

                    if (dataList == null || dataList.isEmpty) {
                      return Center(
                          child: Text('Tidak ada data yang ditemukan.'));
                    }

                    return ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        DatabaseModel data = dataList[index];
                        return PermohonanItem(data: data);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Terjadi kesalahan: ${snapshot.error}'));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.list,
                color: const Color.fromARGB(255, 139, 32, 24),
              ),
              onPressed: () => navigateTo(context, AdminPermohonan()),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.chat,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () => navigateTo(context, AdminKonsultasi()),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () => navigateTo(context, AdminDashboard()),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.newspaper_rounded,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () => navigateTo(context, AdminBerita()),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.account_box,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () => navigateTo(context, AdminAkun()),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
} 

class PermohonanItem extends StatelessWidget {
  final DatabaseModel data;

  const PermohonanItem({required this.data});

  @override
  Widget build(BuildContext context) {
    final DatabaseService database = DatabaseService();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('No.KK: ${data.nokk}'),
            Text('NIK: ${data.nik}'),
            Text('Nama: ${data.nama}'),
            Text('Jenis Pelayanan: ${data.jenispelayanan}'),
            Text('Status: ${data.status}'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminUpload(databaseModel: data),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white),
                  child: Text('Upload'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await database.updateStatus(data.id, 'Diproses Admin');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Status telah diproses oleh RT')),
                      );
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Gagal memproses status: $error')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellowAccent,
                      foregroundColor: Colors.black),
                  child: Text('Proses'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PermohonanDetail(permohonan: data),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.black),
                  child: Text('Detail'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final status = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminBatal(),
                      ),
                    );

                    if (status != null && status.isNotEmpty) {
                      try {
                        await database.updateStatus(data.id, status);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Status telah diperbarui')),
                        );
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Gagal memperbarui status: $error')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white),
                  child: Text('Batal'),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}

