import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/dio/dio_helper.dart';
import 'package:disaster_app/models/normal_all_comments.dart';
import 'package:disaster_app/models/send_normal_comment.dart';
import 'package:disaster_app/screens/posts/comments/normal_comments/normal_send_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendNormalComment extends Cubit<NormalSendCommentStates> {
  SendNormalComment() : super(NormalSendCommentIntialState());
  static SendNormalComment get(context) => BlocProvider.of(context);
  NormalSendComment? Normalcomment;
  void SendComment({
    required String comment,
    required String postId,
  }) {
    emit(NormalSendCommentLoadinState());
    DioHelper.postData(
        url: 'https://projectwebadvanced.onrender.com/comment/addCommentNorm/$postId',
        token: token,
        data: {
          'comment':comment
        }).then((value) {
      print(value);
      Normalcomment = NormalSendComment.fromJson(value.data);
      emit(NormalSendCommentSucessState(Normalcomment));
    }).catchError((error) {
      emit(NormalSendCommentErorrState());
      print(error.toString());
      Fluttertoast.showToast(
          msg: 'لم يوافق عليك الادمن بعد رجاء المحاولة لاحقا ....',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
    });
  }
  AllNormalComments? allNormalComments;
  void getNormalCommentsData({
    String postId='',
  }) {
    DioHelper.getData(
      url: 'https://projectwebadvanced.onrender.com/comment/getCommentNorm/$postId',
    ).then((value) {
      print(value);
      print('hello');
      allNormalComments = AllNormalComments.fromJson(value.data);
      emit(DisasterSuccessGetNormalPostsComentsStates());
    }).catchError((error) {
      emit(DisasterErorrGetNormalPostsComentsStates());
      print(error.toString());
      Fluttertoast.showToast(
          msg: "يرجي المحاولة في وقت لاحق ...",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
    });
  }
}
