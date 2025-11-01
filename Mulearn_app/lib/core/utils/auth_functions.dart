import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/models/user_model.dart';

// Tracks the currently signed-in user's uid after successful login/register.
String? currentUserId;

Future<bool> addUser(UserModel u) async {
  try {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: u.email, password: u.password);

    // On success, userCredential.user is non-null
    final uid = userCredential.user?.uid;
    if (uid == null) return false;

    currentUserId = uid;

    // Save user profile to Firestore
    // Note: Don't store password in Firestore - Firebase Auth handles it securely
    await FirebaseFirestore.instance.collection('mulearn_users').doc(uid).set({
      'muid': u.muid.isNotEmpty
          ? u.muid
          : uid, // Use uid as default muid if not provided
      'name': u.name,
      'email': u.email,
      'interests': u.interests,
      'xp': u.xp,
      'level': u.level,
    });

    return true;
  } catch (e) {
    print('Error in addUser: $e');
    return false;
  }
}

Future<bool> checkLogin(UserModel u) async {
  try {
    // First sign out to ensure clean state
    await FirebaseAuth.instance.signOut();

    // Attempt to sign in
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: u.email, password: u.password);

    final user = userCredential.user;
    if (user == null) return false;

    // Get fresh ID token to ensure Firebase rules work
    await user.getIdToken(true);

    final uid = user.uid;
    currentUserId = uid;

    print('Successfully logged in with uid: $uid');

    // Check if user document exists, if not create it
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('mulearn_users')
          .doc(uid)
          .get();

      if (!userDoc.exists) {
        print('Creating new user document for uid: $uid');
        // Create a basic profile document
        await FirebaseFirestore.instance
            .collection('mulearn_users')
            .doc(uid)
            .set({
              'muid': uid,
              'name': userCredential.user?.displayName ?? 'Unknown User',
              'email': u.email,
              'interests': [],
              'xp': '0',
              'level': '1',
            });
      }
    } catch (e) {
      print('Error checking/creating user document: $e');
      // Don't fail login if document creation fails
    }

    return true;
  } catch (e) {
    print('Error in checkLogin: $e');
    return false;
  }
}

Future<UserModel> loadUser(String userId) async {
  try {
    // First verify the user is authenticated
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        code: 'unauthenticated',
        message: 'Must be logged in to access user profile',
      );
    }

    print('LoadUser - Current Auth State:');
    print('Current User UID: ${currentUser.uid}');
    print('Requested User ID: $userId');
    print('Email: ${currentUser.email}');

    // Verify they're accessing their own profile
    if (currentUser.uid != userId) {
      print('UID mismatch detected, using Firebase UID');
      userId = currentUser.uid; // Use the Firebase UID as source of truth
    }

    // Ensure we have a fresh token
    await currentUser.getIdToken(true);
    print('Token refreshed for Firestore access');

    final doc = await FirebaseFirestore.instance
        .collection('mulearn_users')
        .doc(userId)
        .get();

    if (!doc.exists) {
      print('User document does not exist for userId: $userId');
      // Return a basic user model with the userId
      return UserModel(
        id: userId,
        muid: userId,
        name: currentUser.displayName ?? 'Unknown User',
        email: currentUser.email ?? '',
        password: '', // Never store/retrieve passwords from Firestore
      );
    }

    final data = doc.data();
    if (data == null) {
      print('User document exists but data is null for userId: $userId');
      return UserModel(
        id: userId,
        muid: userId,
        name: 'Unknown User',
        email: FirebaseAuth.instance.currentUser?.email ?? '',
        password: '',
      );
    }

    print('Successfully loaded user data: $data');

    return UserModel(
      id: userId,
      muid: data['muid'] as String? ?? userId,
      name: data['name'] as String? ?? '',
      email: data['email'] as String? ?? '',
      password: '', // Never retrieve password from Firestore
      interests: data['interests'] != null
          ? List<String>.from(data['interests'])
          : [],
      xp: data['xp']?.toString() ?? '0',
      level: data['level']?.toString() ?? '1',
    );
  } catch (e, st) {
    print('Error in loadUser: $e');
    print('Stack trace: $st');
    rethrow; // Rethrow to let the caller handle it
  }
}

// Optional: Add a function to update user profile
Future<bool> updateUser(String userId, Map<String, dynamic> updates) async {
  try {
    await FirebaseFirestore.instance
        .collection('mulearn_users')
        .doc(userId)
        .update(updates);
    return true;
  } catch (e) {
    print('Error in updateUser: $e');
    return false;
  }
}

// Optional: Sign out function
Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
  currentUserId = null;
}
