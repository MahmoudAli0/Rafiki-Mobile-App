import 'package:disaster_app/app_cubit/app_states.dart';
import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/dio/dio_helper.dart';
import 'package:disaster_app/models/all_mathane_posts.dart';
import 'package:disaster_app/models/all_normal_posts.dart';
import 'package:disaster_app/models/all_user_data.dart';
import 'package:disaster_app/models/methane_all_comments.dart';
import 'package:disaster_app/models/update_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_profile_data.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super((DisasterIntialUserDataStates()));

  static AppCubit get(context) => BlocProvider.of(context);

  Data? userData;

  void getUserData() {
    emit(DisasterLoadingUserDataStates());
    DioHelper.postData(
            url: 'https://projectwebadvanced.onrender.com/user/getUser',
            token: token)
        .then((value) {
      print(value);
      userData = Data.fromJson(value.data);
      print(userData!.data!.phoneNumber);
      print(userData!.data!.speciality);
      print(userData!.data!.email);
      print(userData!.data!.firstName);

      emit(DisasterSucessUserDataStates(userData));
    }).catchError((error) {
      emit(DisasterErorrUserDataStates());
      print(error.toString());
       Fluttertoast.showToast(
           msg: error.toString(),
          backgroundColor: Colors.red,
           textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
    });
  }

  Posts? allPosts;

  void getPostsData() {
    DioHelper.getData(
      url: 'https://projectwebadvanced.onrender.com/methane/getMethane',
    ).then((value) {
      print(value);
      print('hello');

      allPosts = Posts.fromJson(value.data);
      //print(CatModel!.status);

      emit(DisasterSuccessGetPostsStates());
    }).catchError((error) {
      emit(DisasterErorrGetPostsStates());
      print(error.toString());
      Fluttertoast.showToast(
          msg: "يرجي المحاولة في وقت لاحق ...",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
    });
  }

  UpdateProfile? updateUserData;

  void UpdateUserData({
    required String name,
    required String secondName,
    required String email,
    required String phone,
    required String specility,
    required String role,
    required String workPlace,
  }) {
    emit(DisasterLoadingUpdateProfileStates());
    DioHelper.putData(
        url: 'https://projectwebadvanced.onrender.com/user/updateUser',
        token: token,
        data: {
          'firstName': name,
          'secondName': secondName,
          'phoneNumber': phone,
          'email': email,
          'role': role,
          'speciality': specility,
          'workPlace': workPlace,
        }).then((value) {
      print(value);
      updateUserData = UpdateProfile.fromJson(value.data);
      print(updateUserData!.data!.speciality);
      print(updateUserData!.data!.firstName);
      print(updateUserData!.data!.workPlace);

      emit(DisasterSucessUpdateProfileStates(updateUserData));
    }).catchError((error) {
      emit(DisasterErorrUpdateProfileStates());
      print(error.toString());
    });
  }

  NormalAllPostsData? allNormalPosts;

  void getNormalPostsData() {
    DioHelper.getData(
      url: 'https://projectwebadvanced.onrender.com/normal/getPostsNormal',
    ).then((value) {
      print(value);
      print('hello normal');

      allNormalPosts = NormalAllPostsData.fromJson(value?.data);
      //print(CatModel!.status);

      emit(DisasterSuccessGetPostsStates());
    }).catchError((error) {
      emit(DisasterErorrGetPostsStates());
      print(error.toString());
      Fluttertoast.showToast(
          msg: "يرجي المحاولة في وقت لاحق ...",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
    });
  }

  AllUserRequest? allUserRequest;

  void getUserRequestsData() {
    print('hello from users');
    DioHelper.getData(
      url: 'https://projectwebadvanced.onrender.com/admin/getAllUser',
      token: token,
    ).then((value) {
      print('hello from users');
      print(value);

      allUserRequest = AllUserRequest.fromJson(value.data);
      emit(DisasterSucessGetAllUserDataStates());
    }).catchError((error) {
      emit(DisasterErorrGetAllUserDataStates());
      print(error.toString());
      Fluttertoast.showToast(
          msg: error.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG);
    });
  }


}
