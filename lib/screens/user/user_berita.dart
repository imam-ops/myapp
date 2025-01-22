import 'package:flutter/material.dart';
import 'package:myapp/models/berita.dart';
import 'package:myapp/screens/admin/berita_detail.dart';
import 'package:myapp/services/berita_service.dart';

class UserBerita extends StatelessWidget {
  final BeritaService _beritaService = BeritaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
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
                        return ListTile(
                          title: Text(data.judul),
                          subtitle: Text(data.subtitle),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BeritaDetail(berita: data),
                              ),
                            );
                          },
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
