import 'package:flutter/material.dart';
import 'package:myapp/models/database.dart';
import 'package:myapp/screens/user/user_update.dart';
import 'package:myapp/services/database_service.dart';
import 'package:myapp/screens/user/user_dashboard.dart';

class UserPermohonan extends StatelessWidget {
  final DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permohonan"),
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
                        return PermohonanItem(
                          nokk: data.nokk, // Nomor antrian
                          nik: data.nik,
                          nama: data.nama,
                          jenis: data.jenispelayanan,
                          status: data.status, id: data.id,
                        );
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
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserPermohonan()));
              },
            ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.chat,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserPermohonan()));
              },
            ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 153, 151, 151)
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserDashboard()));
              },
            ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.newspaper_rounded,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserPermohonan()));
              },
            ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.account_box,
                color: Color.fromARGB(255, 153, 151, 151),
              ),
              onPressed: () {
              },
            ),
            label: ' ',
          ),
        ],
      ),
    );
  }
}

class PermohonanItem extends StatelessWidget {
  final String id;
  final String nokk;
  final String nik;
  final String nama;
  final String jenis;
  final String status;

  PermohonanItem({
    required this.id,
    required this.nokk,
    required this.nik,
    required this.nama,
    required this.jenis,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final DatabaseService databaseService = DatabaseService();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('No.KK: $nokk'),
            Text('NIK: $nik'),
            Text('Nama: $nama'),
            Text('Jenis Pelayanan: $jenis'),
            Text('Status: $status'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserUpdate(id: id)),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      print('Deleting document with id: $id'); // Debugging line
                      await databaseService.deleteDatabase(id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Data berhasil dihapus')),
                      );
                    } catch (error) {
                      print('Gagal menghapus data: $error');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Gagal menghapus data: $error')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Hapus'),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
