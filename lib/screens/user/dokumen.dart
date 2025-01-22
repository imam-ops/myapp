import 'package:flutter/material.dart';
import 'package:myapp/models/database.dart';

class Dokumen extends StatelessWidget {
  final DatabaseModel permohonan;

  const Dokumen({super.key, required this.permohonan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(permohonan.nama),
        backgroundColor: const Color.fromARGB(255, 139, 32, 24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildDetailCard('NIK Pemohon', permohonan.nikpemohon),
              _buildDetailCard('Nama Pemohon', permohonan.namapemohon),
              _buildDetailCard('No HP', permohonan.nohp),
              _buildDetailCard('NIK Diproses', permohonan.nikdiproses),
              _buildDetailCard('Nama Diproses', permohonan.namadiproses),
              _buildDetailCard('NIK', permohonan.nik),
              _buildDetailCard('No KK', permohonan.nokk),
              _buildDetailCard('Nama', permohonan.nama),
              _buildDetailCard('Jenis Pelayanan', permohonan.jenispelayanan),
              _buildDetailCard('Status', permohonan.status),
              _buildDetailCard('Created At', permohonan.createdAt.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$label: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
