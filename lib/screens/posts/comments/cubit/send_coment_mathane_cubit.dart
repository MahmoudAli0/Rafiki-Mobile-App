import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/dio/dio_helper.dart';
import 'package:disaster_app/models/methane_all_comments.dart';
import 'package:disaster_app/models/send_methane_comment.dart';
import 'package:disaster_app/models/send_post_methane.dart';
import 'package:disaster_app/screens/posts/comments/states.dart';
import 'package:disaster_app/screens/posts/mathne/states/mathane_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendMataneComment extends Cubit<MathaneSendCommentStates> {
  SendMataneComment() : super(MathaneSendCommentIntialState());

  static SendMataneComment get(context) => BlocProvider.of(context);

  MathaneSendComment? mathanecomment;

  void SendComment({
  required String comment,
  required String postId,
  }) {
    emit(MathaneSendCommentLoadinState());
    DioHelper.postData(
        url: 'https://projectwebadvanced.onrender.com/comment/addCommentMeth/$postId',
        token: token,
        data: {
          'comment':comment,
        }).then((value) {
      print(value);
      mathanecomment = MathaneSendComment.fromJson(value.data);
      emit(MathaneSendCommentSucessState(mathanecomment));
    }).catchError((error) {
      emit(MathaneSendCommentErorrState());
      print(error.toString());
      Fluttertoast.showToast(
          msg: 'لم يوافق عليك الادمن بعد رجاء المحاولة لاحقا ....',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
    });
  }

  AllMethaneComments? allMethaneComments;

  void getMathaneCommentsData({
    String postId='',
  }) {
    DioHelper.getData(
      url: 'https://projectwebadvanced.onrender.com/comment/getCommentMeth/$postId',
    ).then((value) {
      print(value);
      print('hello');

      allMethaneComments = AllMethaneComments.fromJson(value.data);


      emit(DisasterSuccessGetMathanePostsComentsStates());
    }).catchError((error) {
      emit(DisasterErorrGetMathanePostsComentsStates());
      print(error.toString());
      Fluttertoast.showToast(
          msg: "يرجي المحاولة في وقت لاحق ...",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
    });
  }
}
