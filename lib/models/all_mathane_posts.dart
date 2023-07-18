class Posts {
  bool status=true;
  int result=0;
  MathaneData? data;


  Posts.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
    data = json['data'] != null ?  MathaneData.fromJson(json['data']) : null;
  }
}

class MathaneData {
  List<Methanes>? methanes;



  MathaneData.fromJson(Map<String, dynamic> json) {
    if (json['methanes'] != null) {
      methanes = <Methanes>[];
      json['methanes'].forEach((v) {
        methanes!.add(new Methanes.fromJson(v));
      });
    }
  }

}

class Methanes {
  String sId='';
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
    sId = json['_id'];
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
  String photoUser='';
  String photoAffair='';
  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    speciality = json['speciality'];
    phoneNumber = json['phoneNumber'];
    workPlace = json['workPlace'];
    photoUser = json['photoUser'];
    photoAffair = json['photoAffair'];
  }
}