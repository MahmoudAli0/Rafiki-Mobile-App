class SendMathanePost {
  bool stauts=false;
  Methanes? ma;

  SendMathanePost.fromJson(Map<String, dynamic> json) {
    stauts = json['status'];
    ma = json['data'] != null ?  Methanes.fromJson(json['data']) : null;
  }
}
class Methanes {
  String accidentEffect='';
  String locationCorrectly='';
  String accidentKind='';
  String dengerousKind='';
  String whatWAyArrive='';
  String numberofvictims='';
  String emergencyServices='';
  String time='';
  String date='';
  UserId? userId;

  Methanes.fromJson(Map<String, dynamic> json) {
    accidentEffect = json['accidentEffect'];
    locationCorrectly = json['locationCorrectly'];
    accidentKind = json['accidentKind'];
    dengerousKind = json['dengerousKind'];
    whatWAyArrive = json['whatWAyArrive'];
    numberofvictims = json['numberofvictims'];
    emergencyServices = json['emergencyServices'];
    time = json['time'];
    date = json['date'];
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