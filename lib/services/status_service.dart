import 'package:cloud_firestore/cloud_firestore.dart';

class StatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("Kayitlar").snapshots();
    return ref;
  }
}
