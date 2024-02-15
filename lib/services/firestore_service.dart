import 'package:cloud_firestore/cloud_firestore.dart';

// firebase supporting functions
class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void verifyUserDataExists(String userid) async {
    final document = await firestore.collection('users').doc(userid).get();

    final user = <String, dynamic>{
      "first": "Alan",
      "middle": "Mathison",
      "last": "Turing",
      "born": 1912
    };

    if (!document.exists) {
      // user data does not exist, let's correct that.
      DocumentReference userDocRef = firestore
          .collection('users')
          .doc(userid); // get a reference to the user's collection

      CollectionReference dataCollection = userDocRef
          .collection('data'); // get a reference to the data subcollection

      dataCollection
          .doc('info')
          .set(user); // set the "info" document to our standard one
    }
  }
}
