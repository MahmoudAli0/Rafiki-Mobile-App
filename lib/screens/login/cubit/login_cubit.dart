import 'package:disaster_app/dio/dio_helper.dart';
import 'package:disaster_app/models/user_login_model.dart';
import 'package:disaster_app/screens/login/states/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


class DisasterLoginCubit extends Cubit<DisasterLoginStates>
{

  DisasterLoginCubit() : super(DisasterLoginInitialStates());
  static DisasterLoginCubit get(context) =>BlocProvider.of(context);

  UserLogin? loginModel;
  void DisUserLogin({
    required String email,
    required String password,
  }){
    emit(DisasterLoginLoadingStates());
    DioHelper.postData(
        url: 'https://projectwebadvanced.onrender.com/user/signIn',
        data: {
          'email':email,
          'password':password,
        }
    ).then((value) {
      print(value);

      print("hello");

      final dynamic responseData = value.data;
      if (responseData != null && responseData is Map<String, dynamic>) {
        final String message = responseData['message']??'';
        final bool status = responseData['status'];
        final String? token = responseData['token']??'';
        final bool adminValid = responseData['adminValid'];
        final bool userValid = responseData['userValid'];

        if ( status != null) {
          if (status) {
            loginModel = UserLogin( status: status, token: token,adminValid: adminValid,userValid: userValid);
            print(loginModel!.status);
            print(loginModel!.adminValid);
            print(loginModel!.userValid);
            print(loginModel!.token);
          } else {
            loginModel = UserLogin(message: message, status: status);
            print(loginModel!.status);
            print(loginModel!.message);
          }


          emit(DisasterLoginSucessStates(loginModel));
        } else {
          emit(DisasterLoginErorrStates('Invalid response data'));
        }
      } else {
        emit(DisasterLoginErorrStates('Invalid response data'));
      }

    }).catchError((error){
      print(error.toString());

        Fluttertoast.showToast(
            msg: "يرجي المحاولة في وقت لاحق ...",
            toastLength: Toast.LENGTH_LONG,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,
            gravity: ToastGravity.BOTTOM);

      emit(DisasterLoginErorrStates(error.toString()));
    });
  }
  IconData sufix= Icons.visibility;
  bool passwordHidden=true;
  void changePasswordVis(){
    passwordHidden=!passwordHidden;
    sufix= passwordHidden? Icons.visibility:Icons.visibility_off_rounded ;
    emit(DisasterLoginChangePasswordStates());
  }
}