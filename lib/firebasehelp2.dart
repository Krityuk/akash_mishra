// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String name;
  final int age;
  final String id;

  UserData(this.name, this.age, this.id);
}

class FirebaseDataHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeUserData(UserData userData) async {
    try {
      await _firestore.collection('users').doc(userData.id).set({
        'name': userData.name,
        'age': userData.age,
        'number': userData.id,
      });
      print('Data stored successfully in Firebase!');
    } catch (e) {
      print('Error storing data: $e');
    }
  }

  //
  Future<List<UserData>> fetchUserData() async {
    List<UserData> userList = [];

    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').get();

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        String name = doc['name'];
        int age = doc['age'];
        String number = doc['number'];

        UserData user = UserData(name, age, number);
        userList.add(user);
      }

      print('Data fetched successfully from Firebase!');
    } catch (e) {
      print('Error fetching data: $e');
    }

    return userList;
  }
  //******************************* */
  Future<void> fetchUserDataById(String userId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('users').doc(userId).get();

      if (documentSnapshot.exists) {
        String name = documentSnapshot['name'];
        int age = documentSnapshot['age'];

        print(
            'User found - Name: $name, Age: $age, ID: $userId');
      } else {
        print('Document with ID $userId does not exist.');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
