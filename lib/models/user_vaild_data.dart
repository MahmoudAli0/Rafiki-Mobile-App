class UserVaild {
  bool status=false;
  String message='';
  User? user;


  UserVaild.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }


}

class User {
  String sId='';
  String firstName='';
  String lastName='';
  String email='';
  String password='';
  String phoneNumber='';
  String role='';
  String speciality='';
  String photoUser='';
  String photoAffair='';
  String workPlace='';
  String gender='';
  bool isValid=false;
  bool isAdmin=false;


  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    photoAffair = json['photoAffair'] as String;
    photoUser = json['photoUser']as String;
    role = json['role'];
    speciality = json['speciality'];
    workPlace = json['workPlace'];
    gender = json['gender'];
    isValid = json['isValid'];
    isAdmin = json['isAdmin'];
  }


}