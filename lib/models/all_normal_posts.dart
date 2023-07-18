class NormalAllPostsData {
  bool status=true;
  int result=0;
  NormalData? data;


  NormalAllPostsData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
    data = json['data'] != null ?  NormalData.fromJson(json['data']) : null;
  }
}

class NormalData {
  List<Normals>? Noormals;

  NormalData.fromJson(Map<String, dynamic> json) {
    if (json['normalsPosts'] != null) {
      Noormals = <Normals>[];
      json['normalsPosts'].forEach((v) {
        Noormals!.add( Normals.fromJson(v));
      });
    }
  }
}
class Normals {
  String? sId='';
  String? textArea='';
  String? photo='';
  String? time;
  String? date;
  UserId? userId;
  Normals.fromJson(Map<String, dynamic> json) {
    sId = json['_id']as String?;
    time = json['time']as String?;
    date = json['date']as String?;
    textArea = json['textArea']as String?;
    userId =
    json['userData'] != null ?  UserId.fromJson(json['userData']) : null;
  }


}

class UserId {
  String sId='';
  String? firstName='';
  String? lastName='';
  String? role='';
  String? speciality='';
  String? phoneNumber='';
  String? workPlace='';
  String? photoUser='';
  String? photoAffair='';

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName']as String?;
    lastName = json['lastName']as String?;
    role = json['role']as String?;
    speciality = json['speciality']as String;
    phoneNumber = json['phoneNumber']as String;
    photoUser = json['photoUser']as String;
    photoAffair = json['photoAffair']as String;
    workPlace = json['workPlace']as String;
  }
}