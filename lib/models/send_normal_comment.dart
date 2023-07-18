class NormalSendComment {
  bool status=false;
  Data? data;
  NormalSendComment.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}
class Data {
  NewComment? newComment;
  Data.fromJson(Map<String, dynamic> json) {
    newComment = json['newComment'] != null
        ? new NewComment.fromJson(json['newComment'])
        : null;
  }

}
class NewComment {
  String comment='';
  String userId='';
  String postnormId='';
  String sId='';
  int iV=0;
  NewComment.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    userId = json['userId'];
    postnormId = json['postnormId'];
    sId = json['_id'];
    iV = json['__v'];
  }
}