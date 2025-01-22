import 'package:flutter/material.dart';
import 'package:myapp/models/database.dart';
import 'package:myapp/screens/user/user_upload.dart';
import 'package:myapp/services/database_service.dart';
import 'package:uuid/uuid.dart';

class UserPendaftaran extends StatefulWidget {
  const UserPendaftaran({super.key});

  _UserPendaftaranState createState() => _UserPendaftaranState();
}

class _UserPendaftaranState extends State<UserPendaftaran> {
  final _formKey = GlobalKey<FormState>();
  String _nikpemohon = '';
  String _namapemohon = '';
  String _nohp = '';
  String _nikdiproses = '';
  String _namadiproses = '';
  String _nik = '';
  String _nokk = '';
  String _nama = '';
  String _jenispelayanan = 'Jenis Pelayanan';
  String _status = 'Belum Diproses';

  final DatabaseService _databaseService = DatabaseService();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Generate a unique ID for the new entry
      var uuid = Uuid();
      String id = uuid.v4();

      DatabaseModel newDatabase = DatabaseModel(
        id: id, // Include id here
        nikpemohon: _nikpemohon,
        namapemohon: _namapemohon,
        nohp: _nohp,
        nikdiproses: _nikdiproses,
        namadiproses: _namadiproses,
        nik: _nik,
        nokk: _nokk,
        nama: _nama,
        jenispelayanan: _jenispelayanan,
        createdAt: DateTime.now(),
        status: _status,
      );

      try {
        await _databaseService.addDatabase(newDatabase, 'Database');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Database berhasil ditambahkan')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserUpload()),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menyimpan data: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kartu Keluarga"),
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                '2. Pendaftaran',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Jenis Pelayanan'),
                value: _jenispelayanan,
                items: [
                  'Jenis Pelayanan',
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
                onChanged: (value) => setState(() => _jenispelayanan = value!),
              ),
              const SizedBox(height: 20),
              const Text(
                'Isian Form',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'NIK Pemohon'),
                validator: (value) =>
                    value!.isEmpty ? 'NIK Pemohon tidak boleh kosong' : null,
                onSaved: (value) => _nikpemohon = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Pemohon'),
                validator: (value) =>
                    value!.isEmpty ? 'Nama Pemohon tidak boleh kosong' : null,
                onSaved: (value) => _namapemohon = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'No. HP Pemohon'),
                validator: (value) =>
                    value!.isEmpty ? 'No. HP Pemohon tidak boleh kosong' : null,
                onSaved: (value) => _nohp = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'NIK Diproses'),
                validator: (value) =>
                    value!.isEmpty ? 'NIK Diproses tidak boleh kosong' : null,
                onSaved: (value) => _nikdiproses = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Diproses'),
                validator: (value) =>
                    value!.isEmpty ? 'Nama Diproses tidak boleh kosong' : null,
                onSaved: (value) => _namadiproses = value!,
              ),
              const SizedBox(height: 20),
              const Text(
                'Elemen Data Kunci',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'No.KK'),
                validator: (value) =>
                    value!.isEmpty ? 'No. KK tidak boleh kosong' : null,
                onSaved: (value) => _nokk = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'NIK'),
                validator: (value) =>
                    value!.isEmpty ? 'NIK tidak boleh kosong' : null,
                onSaved: (value) => _nik = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) =>
                    value!.isEmpty ? 'Nama tidak boleh kosong' : null,
                onSaved: (value) => _nama = value!,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 139, 32, 24),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                    ),
                    child: const Text('Selanjutnya'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
