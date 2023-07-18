import 'package:disaster_app/models/send_methane_comment.dart';


abstract class MathaneSendCommentStates{}
class MathaneSendCommentIntialState extends MathaneSendCommentStates{}
class DisasterSuccessGetMathanePostsComentsStates extends MathaneSendCommentStates{}
class DisasterErorrGetMathanePostsComentsStates extends MathaneSendCommentStates{}
class MathaneSendCommentLoadinState extends MathaneSendCommentStates{}
class MathaneSendCommentErorrState extends MathaneSendCommentStates{}
class MathaneSendCommentSucessState extends MathaneSendCommentStates{
  final MathaneSendComment? mathaneSendComment;

  MathaneSendCommentSucessState(this.mathaneSendComment);
}