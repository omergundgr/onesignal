import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final _instance = FirebaseFirestore.instance.collection("users").doc("uid");

  Future<String> getUser() async =>
      await _instance.get().then((value) => value.data()!["omer"]);
}
