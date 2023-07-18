class UpdateProfile {
  bool status=false;
  UpdateData? data;



  UpdateProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new UpdateData.fromJson(json['data']) : null;
  }


}

class UpdateData {
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
  bool isValid=false;



  UpdateData.fromJson(Map<String, dynamic> json) {
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
    isValid = json['isValid'];
  }

}