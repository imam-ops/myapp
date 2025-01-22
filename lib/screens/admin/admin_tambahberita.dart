import 'package:flutter/material.dart';
import 'package:myapp/models/berita.dart';
import 'package:myapp/models/database.dart';
import 'package:myapp/services/berita_service.dart';
import 'package:myapp/services/database_service.dart';
import 'package:uuid/uuid.dart';

class AdminTambahberita extends StatefulWidget {
  const AdminTambahberita({super.key});

  _AdminTambahberitaState createState() => _AdminTambahberitaState();
}

class _AdminTambahberitaState extends State<AdminTambahberita> {
  final _formKey = GlobalKey<FormState>();
  String _judul = '';
  String _subtitle = '';
  String _deskripsi = '';

  final BeritaService _beritaService = BeritaService();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Generate a unique ID for the new entry
      var uuid = Uuid();
      String id = uuid.v4();

      BeritaModel newDatabase = BeritaModel(
        id: id, // Include id here
        judul: _judul,
        subtitle: _subtitle,
        deskripsi: _deskripsi,
      );

      try {
        await _beritaService.addDatabase(newDatabase, 'Berita');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Database berhasil ditambahkan')),
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
        title: Text("Input Berita"),
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
                'Input Berita',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Isian Form',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: 'Judul'),
                validator: (value) =>
                    value!.isEmpty ? 'Judul tidak boleh kosong' : null,
                onSaved: (value) => _judul = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Subtitle'),
                validator: (value) =>
                    value!.isEmpty ? 'Subtitle tidak boleh kosong' : null,
                onSaved: (value) => _subtitle = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Deskripsi'),
                validator: (value) => value!.isEmpty
                    ? 'Deskripsi Pemohon tidak boleh kosong'
                    : null,
                onSaved: (value) => _deskripsi = value!,
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
                    child: const Text('Simpan'),
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
