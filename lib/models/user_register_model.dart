import 'dart:io';

import 'package:image_picker/image_picker.dart';

class UserRegister {
  dynamic status;
  dynamic message;
  UserData? user;

  UserRegister({
    required this.status,
    required this.message,
    this.user,
  });

  factory UserRegister.fromJson(Map<String, dynamic> json) {
    return UserRegister(
      status: json['status'],
      message: json['message'],
      user: json['user'] != null ? UserData.fromJson(json['user']) : null,
    );
  }
}

class UserData {
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String role;
  String speciality;
  String workPlace;
  String gender;
  String photoUser;
  String photoAffair;
  String id;
  int v;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
    required this.speciality,
    required this.workPlace,
    required this.gender,
    required this.photoUser,
    required this.photoAffair,
    required this.id,
    required this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
      speciality: json['speciality'],
      workPlace: json['workPlace'],
      gender: json['gender'],
      photoUser: json['photoUser'],
      photoAffair: json['photoAffair'],
      id: json['_id'],
      v: json['__v'],
    );
  }
}