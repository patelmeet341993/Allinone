import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String id,name,email,url;
  Timestamp? createdtime, dateOfBirth, last_opened, last_online;
  UserModel({required this.name,required this.url,required this.email,required this.id});
}