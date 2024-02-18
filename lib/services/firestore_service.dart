import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  // Force a single instance of FirestoreService to avoid desynchronization
  FirestoreService._privateConstructor();
  static final FirestoreService _instance =
      FirestoreService._privateConstructor();

  factory FirestoreService() {
    // Return the single instance rather than creating a new one
    return _instance;
  }

  // Get reference to firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // User info caching system
  Map<String, dynamic>? _userInfoCache;
  Completer<void> _cacheLoadedCompleter = Completer<void>();

  void fetchAndCacheUserInfo(String userId) async {
    // Retrieve current user info state and save it into the cache
    DocumentSnapshot document = await firestore
        .collection('users')
        .doc(userId)
        .collection('data')
        .doc('info')
        .get();
    if (document.exists) {
      // Cached user info successfully
      _userInfoCache = document.data() as Map<String, dynamic>?;
      if (!_cacheLoadedCompleter.isCompleted) {
        _cacheLoadedCompleter
            .complete(); // inform anyone waiting for the cache that it has loaded.
      }
    }
  }

  Future<void> waitForCache() async {
    if (_userInfoCache == null) {
      // wait for the cache to load
      await _cacheLoadedCompleter.future;
    }
  }

  // Methods to interact with user info values
  dynamic getUserInfo(String key) {
    // Ensure _userInfoCache is initialized.
    if (_userInfoCache == null) {
      return "Cache Not Initialized";
    }

    // Attempt to retrieve the data.
    dynamic data = _userInfoCache![key];

    // Check if the data is invalid.
    if (data == null) {
      return "Data Error";
    }
    return data;
  }

  void updateUserInfo(String key, dynamic value) async {
    String userId = getUserId();

    try {
      // Get a reference to the user's document
      DocumentReference userDocRef = firestore
          .collection('users')
          .doc(userId)
          .collection('data')
          .doc('info');

      // Update the document with the new key-value pair
      await userDocRef.set({key: value}, SetOptions(merge: true));

      // Update the local cache if it exists
      if (_userInfoCache != null) {
        _userInfoCache![key] = value;
      }
    } catch (e) {
      // Error updating
      print("Error updating user info: $e");
    }
  }

  // Method to get the current user ID
  String getUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return "";
    }
  }

  // Initialization method to be called from authentication flow
  void initializeFirestoreService() async {
    String userId = getUserId();

    // Prepare the user info cache
    fetchAndCacheUserInfo(userId);

    // Wait for cache to load
    await waitForCache();

    // Begin listening for cache changes
    listenToUserInfoChanges(userId);

    // Ensure that the user has a data entry in firestore
    updateUserInfo("integrity", true);
    // final defaultUserInfo = <String, dynamic>{
    //   "first_name": "User",
    // };

    // bool userDataExists = await userHasEntry(userId);
    // if (userDataExists == false) {
    //   print("First run! Overwriting user data");
    //   // user data does not exist, let's correct that.
    //   DocumentReference userDocRef = firestore
    //       .collection('users')
    //       .doc(userId); // get a reference to the user's collection

    //   CollectionReference dataCollection = userDocRef
    //       .collection('data'); // get a reference to the data subcollection

    //   dataCollection
    //       .doc('info')
    //       .set(defaultUserInfo); // set the "info" document to our standard one
    // }
  }

  void deinitializeFirestoreService() async {
    // Disconnect everything and clean up
    stopListeningToUserInfoChanges();
    _userInfoCache = null; // reset cache
    _cacheLoadedCompleter = Completer<void>(); // reset completer for next use
  }

  // Listen for user info changes and update them in our cache to prevent desynchronization between devices
  StreamSubscription<DocumentSnapshot>? _userInfoListener;
  void listenToUserInfoChanges(String userId) {
    // Begin listening for changes
    DocumentReference userDocRef = firestore
        .collection('users')
        .doc(userId)
        .collection('data')
        .doc('info');

    // Listen for changes
    _userInfoListener = userDocRef.snapshots().listen(
      (documentSnapshot) {
        if (documentSnapshot.exists) {
          // Update the local cache with the new data
          _userInfoCache = documentSnapshot.data() as Map<String, dynamic>?;
        }
      },
      onError: (error) {
        // Error handling
        print("Error listening to user info changes: $error");
      },
    );
  }

  void stopListeningToUserInfoChanges() {
    // Disconnect our listener, for cases such as our user logging out.
    _userInfoListener?.cancel();
  }
}
