import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/dio/dio_helper.dart';
import 'package:disaster_app/models/send_post_methane.dart';
import 'package:disaster_app/screens/posts/mathne/states/mathane_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MathaneCubit extends Cubit<MathaneStates> {
  MathaneCubit() : super(MathaneIntialState());

  static MathaneCubit get(context) => BlocProvider.of(context);

  SendMathanePost? mathanePost;

  void SendPost({
    required String accidentEffect,
    required String dengerousKind,
    required String whatWAyArrive,
    required String locationCorrectly,
    required String emergencyServices,
    required String numberofvictims,
    required String accidentKind,
    required String time,
    required String date,

  }) {
    emit(MathaneLoadinState());
    DioHelper.postData(
        url: 'https://projectwebadvanced.onrender.com/methane/addPost',
        token: token,
        data: {
          'accidentEffect': accidentEffect,
          'dengerousKind': dengerousKind,
          'whatWAyArrive': whatWAyArrive,
          'locationCorrectly': locationCorrectly,
          'emergencyServices': emergencyServices,
          'numberofvictims': numberofvictims,
          'accidentKind': accidentKind,
          'date': date,
          'time': time,
        }).then((value) {
      print(value);
      mathanePost = SendMathanePost.fromJson(value.data);


      emit(MathaneSucessState(mathanePost));
    }).catchError((error) {
      emit(MathaneErorrState());
      print(error.toString());
      Fluttertoast.showToast(
          msg: 'لم يوافق عليك الادمن بعد رجاء المحاولة لاحقا ....',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
    });
  }
}
