class AdminUploadModel {
  final String namaPemohon;
  final String nik;
  final String namaAdmin;
  final String keterangan;
  final String jenisPelayanan;

  AdminUploadModel({
    required this.namaPemohon,
    required this.nik,
    required this.namaAdmin,
    required this.keterangan,
    required this.jenisPelayanan,
  });

  Map<String, dynamic> toMap() {
    return {
      'namaPemohon': namaPemohon,
      'nik': nik,
      'namaAdmin': namaAdmin,
      'keterangan': keterangan,
      'jenisPelayanan': jenisPelayanan,
    };
  }

  factory AdminUploadModel.fromMap(Map<String, dynamic> map) {
    return AdminUploadModel(
      namaPemohon: map['namaPemohon'],
      nik: map['nik'],
      namaAdmin: map['namaAdmin'],
      keterangan: map['keterangan'],
      jenisPelayanan: map['jenisPelayanan'],
    );
  }
}
