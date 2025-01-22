import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/upload.dart';

class UploadService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUploadData(AdminUploadModel data) async {
    try {
      await _firestore.collection('uploads').add(data.toMap());
    } catch (error) {
      throw error;
    }
  }

  Future<AdminUploadModel?> getUploadDataByNikAndStatus(String nik, String status) async {
    try {
      var querySnapshot = await _firestore
          .collection('uploads')
          .where('nik', isEqualTo: nik)
          .where('status', isEqualTo: status)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var doc = querySnapshot.docs.first;
        return AdminUploadModel.fromMap(doc.data());
      } else {
        return null;
      }
    } catch (error) {
      throw error;
    }
  }

  Future<List<AdminUploadModel>> getAllUploads() async {
    try {
      var querySnapshot = await _firestore.collection('uploads').get();
      return querySnapshot.docs.map((doc) => AdminUploadModel.fromMap(doc.data())).toList();
    } catch (error) {
      throw error;
    }
  }
}
