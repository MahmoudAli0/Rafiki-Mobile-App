class SendNormalPost {
  bool stauts=false;
  Normals? ma;


  SendNormalPost.fromJson(Map<String, dynamic> json) {
    stauts = json['status'];
    ma = json['newNormal'] != null ?  Normals.fromJson(json['newNormal']) : null;
  }
}
class Normals {
  String textArea='';
  String time='';
  String photo='';
  String data='';
  UserId? userId;

  Normals.fromJson(Map<String, dynamic> json) {
    textArea = json['textArea'];
    photo = json['photo'];
    time = json['time'];
    data = json['data'];
    userId =
    json['userData'] != null ? new UserId.fromJson(json['userData']) : null;
  }


}

class UserId {
  String sId='';
  String firstName='';
  String lastName='';
  String role='';
  String speciality='';
  String phoneNumber='';
  String workPlace='';


  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    speciality = json['speciality'];
    phoneNumber = json['phoneNumber'];
    workPlace = json['workPlace'];
  }
}