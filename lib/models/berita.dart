class BeritaModel {
  final String id;
  final String judul;
  final String subtitle;
  final String deskripsi;

  BeritaModel({
    required this.id,
    required this.judul,
    required this.subtitle,
    required this.deskripsi,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'judul': judul,
      'subtitle': subtitle,
      'deskripsi': deskripsi,
    };
  }

  factory BeritaModel.fromMap(Map<String, dynamic> map, String documentId) {
    return BeritaModel(
      id: documentId,
      judul: map['judul'] ?? '',
      subtitle: map['subtitle'] ?? '',
      deskripsi: map['deskripsi'] ?? '',
    );
  }
}
