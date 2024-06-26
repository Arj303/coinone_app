
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import'package:flutter/material.dart';

class UserController extends ChangeNotifier{

  Future addUser(String name,String email,String number)async{
    final uid=FirebaseAuth.instance.currentUser!.uid;
    try{
      await FirebaseFirestore.instance.collection("Profile").doc(uid).set({
       "name":name,
       "email":email,
       "number":number,
      });
    }
        catch(e){
      print(e);
        }
  }

  Future updateUser(String name,String email,String number)async{
    final uid=FirebaseAuth.instance.currentUser!.uid;
    try{
      await FirebaseFirestore.instance.collection("Profile").doc(uid).update({
        "name":name,
        "email":email,
        "number":number,
      });
    }
    catch(e){
      print(e);
    }

  }

String name='';
String email='';
String number='';
  Future fetchData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final docSnapshot = await FirebaseFirestore.instance.collection("Profile")
        .doc(userId)
        .get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      name=data["name"];
      email=data["email"];
      number=data["number"];
      notifyListeners();
      return data;
    }
  }
}
