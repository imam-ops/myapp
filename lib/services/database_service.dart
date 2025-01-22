import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/database.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addDatabase(DatabaseModel user, String collectionName) async {
    try {
      CollectionReference collection = _firestore.collection(collectionName);
      DocumentReference docRef = await collection.add(user.toMap());
      print('Berhasil mendaftar ke koleksi $collectionName dengan ID: ${docRef.id}');
      user = DatabaseModel(
        id: docRef.id,
        nikpemohon: user.nikpemohon,
        namapemohon: user.namapemohon,
        nohp: user.nohp,
        nikdiproses: user.nikdiproses,
        namadiproses: user.namadiproses,
        nik: user.nik,
        nokk: user.nokk,
        nama: user.nama,
        jenispelayanan: user.jenispelayanan,
        createdAt: user.createdAt,
        status: user.status,
      );
    } catch (error) {
      print('Gagal untuk mendaftar: $error');
      throw error;
    }
  }

  Stream<List<DatabaseModel>> getDatabaseList(String collectionName) {
    return _firestore.collection(collectionName).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return DatabaseModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  Future<void> updateDatabase(DatabaseModel user) async {
    try {
      DocumentReference document = _firestore.collection('Database').doc(user.id);
      await document.update(user.toMap());
      print('Data berhasil diperbarui di koleksi Database');
    } catch (error) {
      print('Gagal memperbarui data: $error');
      throw error;
    }
  }

  Future<void> deleteDatabase(String id) async {
    try {
      DocumentReference document = _firestore.collection('Database').doc(id);
      await document.delete();
      print('Data berhasil dihapus');
    } catch (error) {
      print('Gagal menghapus data: $error');
      throw error;
    }
  }


  Future<void> updateStatus(String id, String newStatus) async {
    await _firestore.collection('Database').doc(id).update({'status': newStatus});
  }
}



