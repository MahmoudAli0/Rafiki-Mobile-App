class AllUserRequest {
  bool status=false;
  int result=0;
  List<UserData>? data;


  AllUserRequest.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) {
        data!.add(new UserData.fromJson(v));
      });
    }
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
  String photoUser='';
  String PhotoAffiar='';
  String workPlace='';
  String gender='';
  bool isValid=false;
  bool isAdmin=false;



  UserData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    role = json['role'];
    speciality = json['speciality'];
    photoUser = json['photoUser'];
    PhotoAffiar = json['photoAffair'];
    workPlace = json['workPlace'];
    gender = json['gender'];
    isValid = json['isValid']??false;
    isAdmin = json['isAdmin']??false;
  }


}