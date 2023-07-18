import 'dart:io';

class Data {
  UserData? data;


  Data.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
  }


}

class UserData {
  String sId='';
  String firstName='';
  String lastName='';
  String email='';
  String password='';
  String phoneNumber='';
  String role='';
  String speciality='';
  String workPlace='';
  String gender='';
  String photoUser='';
  String photoAffair='';
  int iV=0;



  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    speciality = json['speciality'];
    workPlace = json['workPlace'];
    gender = json['gender'];
    photoUser = json['photoUser'];
    photoAffair = json['photoAffair'];
    iV = json['__v'];
  }

}
