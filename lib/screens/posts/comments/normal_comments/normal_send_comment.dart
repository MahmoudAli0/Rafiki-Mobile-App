
import 'package:disaster_app/models/normal_all_comments.dart';
import 'package:disaster_app/models/send_normal_comment.dart';

abstract class NormalSendCommentStates{}
class NormalSendCommentIntialState extends NormalSendCommentStates{}
class DisasterSuccessGetNormalPostsComentsStates extends NormalSendCommentStates{}
class DisasterErorrGetNormalPostsComentsStates extends NormalSendCommentStates{}
class NormalSendCommentLoadinState extends NormalSendCommentStates{}
class NormalSendCommentErorrState extends NormalSendCommentStates{}
class NormalSendCommentSucessState extends NormalSendCommentStates{
  final NormalSendComment? normalComments;

  NormalSendCommentSucessState(this.normalComments);
}