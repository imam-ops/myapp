import 'package:flutter/material.dart';
import 'package:myapp/models/berita.dart';

class BeritaDetail extends StatelessWidget {
  final BeritaModel berita;

  const BeritaDetail({super.key, required this.berita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(berita.judul),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              berita.judul,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              berita.subtitle,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              berita.deskripsi,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
