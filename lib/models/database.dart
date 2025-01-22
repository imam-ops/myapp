class DatabaseModel {
  final String id;
  final String nikpemohon;
  final String namapemohon;
  final String nohp;
  final String nikdiproses;
  final String namadiproses;
  final String nik;
  final String nokk;
  final String nama;
  final String jenispelayanan;
  final DateTime createdAt;
  final String status;

  DatabaseModel({
    required this.id,
    required this.nikpemohon,
    required this.namapemohon,
    required this.nohp,
    required this.nikdiproses,
    required this.namadiproses,
    required this.nik,
    required this.nokk,
    required this.nama,
    required this.jenispelayanan,
    required this.createdAt,
    required this.status
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nikpemohon': nikpemohon,
      'namapemohon': namapemohon,
      'nohp': nohp,
      'nikdiproses': nikdiproses,
      'namadiproses': namadiproses,
      'nik': nik,
      'nokk': nokk,
      'nama': nama,
      'jenispelayanan': jenispelayanan,
      'createdAt': createdAt.toIso8601String(),
      'status': status
    };
  }

  factory DatabaseModel.fromMap(Map<String, dynamic> map, String documentId) {
    return DatabaseModel(
      id: documentId,
      nikpemohon: map['nikpemohon'] ?? '',
      namapemohon: map['namapemohon'] ?? '',
      nohp: map['nohp'] ?? '',
      nikdiproses: map['nikdiproses'] ?? '',
      namadiproses: map['namadiproses'] ?? '',
      nik: map['nik'] ?? '',
      nokk: map['nokk'] ?? '',
      nama: map['nama'] ?? '',
      jenispelayanan: map['jenispelayanan'] ?? '',
      status: map['status'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
