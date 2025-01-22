import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/berita.dart';

class BeritaService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addDatabase(BeritaModel user, String collectionName) async {
    try {
      CollectionReference collection = _firestore.collection(collectionName);
      DocumentReference docRef = await collection.add(user.toMap());
      print('Berhasil menambahkan $collectionName dengan ID: ${docRef.id}');
      // Update the model with the new id
      user = BeritaModel(
        id: docRef.id,
        judul: user.judul,
        subtitle: user.subtitle,
        deskripsi: user.deskripsi,
      );
    } catch (error) {
      print('Gagal untuk menambahkan: $error');
      throw error;
    }
  }

  Stream<List<BeritaModel>> getBeritaList(String collectionName) {
    return _firestore.collection(collectionName).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return BeritaModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }


  Future<void> deleteDatabase(String id) async {
    try {
      DocumentReference document = _firestore.collection('Berita').doc(id);
      await document.delete();
      print('Data berhasil dihapus');
    } catch (error) {
      print('Gagal menghapus data: $error');
      throw error;
    }
  }
}


