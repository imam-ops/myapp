import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/database.dart';
import 'package:myapp/services/database_service.dart';

class UserUpdate extends StatefulWidget {
  final String id;

  UserUpdate({required this.id});

  @override
  _UserUpdateState createState() => _UserUpdateState();
}

class _UserUpdateState extends State<UserUpdate> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaController;
  late TextEditingController _namadiprosesController;
  late TextEditingController _namapemohonController;
  late TextEditingController _nikController;
  late TextEditingController _nikdiprosesController;
  late TextEditingController _nikpemohonController;
  late TextEditingController _nohpController;
  late TextEditingController _nokkController;
  String _jenispelayanan = 'Jenis Pelayanan';

  final DatabaseService _databaseService = DatabaseService();

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController();
    _namadiprosesController = TextEditingController();
    _namapemohonController = TextEditingController();
    _nikController = TextEditingController();
    _nikdiprosesController = TextEditingController();
    _nikpemohonController = TextEditingController();
    _nokkController = TextEditingController();
    _nohpController = TextEditingController();
    _loadMenuData();
  }

  Future<void> _loadMenuData() async {
    if (widget.id.isEmpty) {
      print('ID is empty or null, exiting _loadMenuData');
      return;
    }
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('Database')
          .doc(widget.id)
          .get();
      if (doc.exists) {
        setState(() {
          _namaController.text = doc['nama'];
          _namadiprosesController.text = doc['namadiproses'].toString();
          _namapemohonController.text = doc['namapemohon'];
          _nikController.text = doc['nik'];
          _nikdiprosesController.text = doc['nikdiproses'];
          _nikpemohonController.text = doc['nikpemohon'];
          _nokkController.text = doc['nokk'];
          _nohpController.text = doc['nohp'];
          _jenispelayanan = doc['jenispelayanan'];
        });
      }
    } catch (e) {
      print('Error getting data from Firestore: $e');
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _namadiprosesController.dispose();
    _namapemohonController.dispose();
    _nikController.dispose();
    _nikdiprosesController.dispose();
    _nikpemohonController.dispose();
    _nokkController.dispose();
    _nohpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Menu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _namadiprosesController,
                decoration: InputDecoration(labelText: 'Nama Diproses'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Diproses tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _namapemohonController,
                decoration: InputDecoration(labelText: 'Nama Pemohon'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Pemohon tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nikController,
                decoration: InputDecoration(labelText: 'NIK'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIK tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nikdiprosesController,
                decoration: InputDecoration(labelText: 'NIK Diproses'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIK Diproses tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nikpemohonController,
                decoration: InputDecoration(labelText: 'NIK Pemohon'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIK Pemohon tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nokkController,
                decoration: InputDecoration(labelText: 'No. KK'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No. KK tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nohpController,
                decoration: InputDecoration(labelText: 'No. HP'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No. HP tidak boleh kosong';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Jenis Pelayanan'),
                value: _jenispelayanan.isNotEmpty && _jenispelayanan != 'Jenis Pelayanan' ? _jenispelayanan : null,
                items: [
                  'KK Baru',
                  'Perubahan Data KK',
                  'KK Hilang',
                  'KK Rusak',
                  'KTP Baru',
                  'Perubahan Data KTP',
                  'KTP Hilang',
                  'KTP Rusak',
                  'KIA Baru',
                  'Perubahan Data KIA',
                  'KIA Hilang',
                  'KIA Rusak',
                  'Akta Kelahiran Baru',
                  'Perubahan Data Akta Kelahiran',
                  'Akta Kelahiran Hilang',
                  'Akta Kelahiran Rusak',
                  'Akta Kematian Baru',
                  'Perubahan Data Akta Kematian',
                  'Akta Kematian Hilang',
                  'Akta Kematian Rusak',
                  'SKTM Pendidikan',
                  'SKTM Kesehatan',
                  'Suket SKCK',
                  'Suket Kehilangan',
                ]
                    .map((jenispelayanan) => DropdownMenuItem(
                          value: jenispelayanan,
                          child: Text(jenispelayanan),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _jenispelayanan = value ?? 'Jenis Pelayanan';
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jenis Pelayanan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    DatabaseModel user = DatabaseModel(
                      id: widget.id,
                      nama: _namaController.text,
                      namapemohon: _namapemohonController.text,
                      namadiproses: _namadiprosesController.text,
                      nik: _nikController.text,
                      nikdiproses: _nikdiprosesController.text,
                      nikpemohon: _nikpemohonController.text,
                      nokk: _nokkController.text,
                      nohp: _nohpController.text,
                      jenispelayanan: _jenispelayanan,
                      createdAt: DateTime.now(),
                      status: 'diproses',
                    );
                    try {
                      await _databaseService.updateDatabase(user);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Menu berhasil diperbarui')),
                      );
                    } catch (e) {
                      print("Error updating document: $e");
                    }
                  }
                },
                child: Text('Simpan Perubahan'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getMenu() {
    return widget.id;
  }
}
