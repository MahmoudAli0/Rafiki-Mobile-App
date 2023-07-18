import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/dio/dio_helper.dart';
import 'package:disaster_app/models/send_post_methane.dart';
import 'package:disaster_app/models/user_vaild_data.dart';
import 'package:disaster_app/screens/admin/states/all_user_states.dart';
import 'package:disaster_app/screens/posts/mathne/states/mathane_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserVaildCubit extends Cubit<UserVaildStates> {
  UserVaildCubit() : super(UserVaildIntialState());

  static UserVaildCubit get(context) => BlocProvider.of(context);

  UserVaild? userVaild;

  void SendUserEmail({
    required String email,

  }) {
    emit(UserVaildLoadinState());
    DioHelper.postData(
        url: 'https://projectwebadvanced.onrender.com/admin/makeValid',
        token:token,
        data: {
          'email': email,
        }).then((value) {
      print(value);
      userVaild = UserVaild.fromJson(value.data);
      emit(UserVaildSucessState(userVaild));
    }).catchError((error) {
      emit(UserVaildErorrState());
      print(error.toString());
      Fluttertoast.showToast(
          msg: 'Some thing wrong happened please try again later ...',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
    });
  }

  void SendUnVaildUserEmail({
    required String email,
  }) {
    emit(UserVaildLoadinState());
    DioHelper.postData(
        url: 'https://projectwebadvanced.onrender.com/admin/outOfValid',
        token:token,
        data: {
          'email': email,
        }).then((value) {
      print(value);
      userVaild = UserVaild.fromJson(value.data);
      emit(UserVaildSucessState(userVaild));
    }).catchError((error) {
      emit(UserVaildErorrState());
      print(error.toString());
      Fluttertoast.showToast(
          msg: 'Some thing wrong happened please try again later ...',
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
    });
  }
}
