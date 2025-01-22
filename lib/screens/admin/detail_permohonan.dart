import 'package:flutter/material.dart';
import 'package:myapp/models/database.dart';

class PermohonanDetail extends StatelessWidget {
  final DatabaseModel permohonan;

  const PermohonanDetail({super.key, required this.permohonan});

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
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade300,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow('NIK Pemohon', permohonan.nikpemohon),
              _buildDetailRow('Nama Pemohon', permohonan.namapemohon),
              _buildDetailRow('No HP', permohonan.nohp),
              _buildDetailRow('NIK Diproses', permohonan.nikdiproses),
              _buildDetailRow('Nama Diproses', permohonan.namadiproses),
              _buildDetailRow('NIK', permohonan.nik),
              _buildDetailRow('No KK', permohonan.nokk),
              _buildDetailRow('Nama', permohonan.nama),
              _buildDetailRow('Jenis Pelayanan', permohonan.jenispelayanan),
              _buildDetailRow('Status', permohonan.status),
              _buildDetailRow('Created At', permohonan.createdAt.toString()),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 139, 32, 24),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Take Action'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
    );
  }
}
