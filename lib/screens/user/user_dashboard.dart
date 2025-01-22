import 'package:flutter/material.dart';
import 'package:myapp/screens/user/user_aktakel.dart';
import 'package:myapp/screens/user/user_aktakem.dart';
import 'package:myapp/screens/user/user_akun.dart';
import 'package:myapp/screens/user/user_berita.dart';
import 'package:myapp/screens/user/user_kehilangan.dart';
import 'package:myapp/screens/user/user_ketskck.dart';
import 'package:myapp/screens/user/user_kia.dart';
import 'package:myapp/screens/user/user_kk.dart';
import 'package:myapp/screens/user/user_konsultasi.dart';
import 'package:myapp/screens/user/user_ktp.dart';
import 'package:myapp/screens/user/user_permohonan.dart';
import 'package:myapp/screens/user/user_sktmkes.dart';
import 'package:myapp/screens/user/user_sktmpen.dart';
import '../../services/auth_service.dart';

class UserDashboard extends StatelessWidget {
  final AuthService _authService = AuthService();
  

  UserDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.black54],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
              child: const Row(
                children: [
                  SizedBox(height: 10, width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Sistem Informasi Pelayanan Publik Desa / Kelurahan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        )
                      ]),
                ],
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Icon(Icons.search)),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Daftar Menu',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        padding: const EdgeInsets.all(0),
                        children: [
                          _buildElevatedButton(
                              context, Icons.file_present, 'Kartu Keluarga'),
                          _buildElevatedButton(
                              context, Icons.credit_card_outlined, 'KTP'),
                          _buildElevatedButton(
                              context, Icons.credit_card_outlined, 'KIA'),
                          _buildElevatedButton(
                              context, Icons.file_present, 'Akta Kelahiran'),
                          _buildElevatedButton(
                              context, Icons.file_present, 'Akta Kematian'),
                          _buildElevatedButton(
                              context, Icons.file_present, 'SKTM Pend'),
                          _buildElevatedButton(
                              context, Icons.file_present, 'SKTM Kes'),
                          _buildElevatedButton(
                              context, Icons.file_present, 'Ket. SKCK'),
                          _buildElevatedButton(
                              context, Icons.file_present, 'Ket. Kehilangan'),
                        ],
                      ),
                    ),
                  ],
                ),
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
                    MaterialPageRoute(builder: (context) => UserKonsultasi()));
              },
            ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.red,
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
                    MaterialPageRoute(builder: (context) => UserBerita()));
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserAkun()));
              },
            ),
            label: ' ',
          ),
        ],
      ),
    );
  }

  Widget _buildElevatedButton(
      BuildContext context, IconData icon, String label) {
    return ElevatedButton(
      onPressed: () {
        Widget tj = Container();
        switch (label) {
          case 'Kartu Keluarga':
            tj = UserKk();
            break;
          case 'KTP':
            tj = UserKtp();
            break;
          case 'KIA':
            tj = UserKia();
            break;
          case 'Akta Kelahiran':
            tj = UserAktakel();
            break;
          case 'Akta Kematian':
            tj = UserAktakem();
            break;
          case 'SKTM Pend':
            tj = UserSktmpen();
            break;
          case 'SKTM Kesehatan':
            tj = UserSktmkes();
            break;
          case 'Surat Keterangan SKCK':
            tj = UserKetskck();
            break;
          case 'Surat Keterangan Kehilangan':
            tj = UserKehilangan();
            break;
          default:
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => tj),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white70,
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 31),
          const SizedBox(height: 0),
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
