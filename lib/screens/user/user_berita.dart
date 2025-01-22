import 'package:flutter/material.dart';
import 'package:myapp/models/berita.dart';
import 'package:myapp/screens/admin/berita_detail.dart';
import 'package:myapp/screens/user/user_akun.dart';
import 'package:myapp/screens/user/user_dashboard.dart';
import 'package:myapp/screens/user/user_konsultasi.dart';
import 'package:myapp/screens/user/user_permohonan.dart';
import 'package:myapp/services/berita_service.dart';

class UserBerita extends StatefulWidget {
  @override
  _UserBeritaState createState() => _UserBeritaState();
}

class _UserBeritaState extends State<UserBerita> {
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
                    MaterialPageRoute(builder: (context) => UserPermohonan()));
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
                    MaterialPageRoute(builder: (context) => UserKonsultasi()));
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
                    MaterialPageRoute(builder: (context) => UserDashboard()));
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
                    MaterialPageRoute(builder: (context) => UserBerita()));
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
                    MaterialPageRoute(builder: (context) => UserAkun()));
              },
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}