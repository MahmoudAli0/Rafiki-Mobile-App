class AllNormalComments {
  bool status=false;
  int result=0;
  NormalData? data;



  AllNormalComments.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
    data = json['data'] != null ? new NormalData.fromJson(json['data']) : null;
  }

}

class NormalData {
  List<Comments>? comments;

  NormalData.fromJson(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }


}

class Comments {
  String sId='';
  String comment='';
  UserId? userId;
  PostnormId? postnormId;
  int iV=0;


  Comments.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    comment = json['comment'];
    userId =
    json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    postnormId = json['postnormId'] != null
        ? new PostnormId.fromJson(json['postnormId'])
        : null;
    iV = json['__v'];
  }

}

class UserId {
  String sId='';
  String firstName='';
  String lastName='';
  String role='';
  String speciality='';



  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    speciality = json['speciality'];
  }

}

class PostnormId {
  String sId='';
  String textArea='';
  String time='';
  String date='';
  UserData? userData;
  int iV=0;


  PostnormId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    textArea = json['textArea'];
    time = json['time'];
    date = json['date'];
    userData = json['userData'] != null
        ? new UserData.fromJson(json['userData'])
        : null;
    iV = json['__v'];
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
  int iV=0;
  bool isAdmin=false;
  bool isValid=false;
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
    iV = json['__v'];
    isAdmin = json['isAdmin'];
    isValid = json['isValid'];
  }

}