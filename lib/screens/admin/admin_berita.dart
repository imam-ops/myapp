import 'package:flutter/material.dart';
import 'package:myapp/models/berita.dart';
import 'package:myapp/screens/admin/admin_akun.dart';
import 'package:myapp/screens/admin/admin_dashboard.dart';
import 'package:myapp/screens/admin/admin_konsultasi.dart';
import 'package:myapp/screens/admin/admin_permohonan.dart';
import 'package:myapp/screens/admin/admin_tambahberita.dart';
import 'package:myapp/screens/admin/berita_detail.dart';
import 'package:myapp/services/berita_service.dart';

class AdminBerita extends StatefulWidget {
  @override
  _AdminBeritaState createState() => _AdminBeritaState();
}

class _AdminBeritaState extends State<AdminBerita> {
  final BeritaService _beritaService = BeritaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Berita"),
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
            Expanded(
              child: StreamBuilder<List<BeritaModel>>(
                stream: _beritaService.getBeritaList('Berita'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<BeritaModel>? dataList = snapshot.data;

                    if (dataList == null || dataList.isEmpty) {
                      return Center(
                          child: Text('Tidak ada data yang ditemukan.'));
                    }

                    return ListView.builder(
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        BeritaModel data = dataList[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            title: Text(data.judul),
                            subtitle: Text(data.subtitle),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                // Handle delete button press
                              },
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BeritaDetail(berita: data),
                                ),
                              );
                            },
                          ),
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdminTambahberita()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 139, 32, 24),
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
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
                color: Color.fromARGB(255, 153, 151, 151),
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
                color: const Color.fromARGB(255, 139, 32, 24),
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