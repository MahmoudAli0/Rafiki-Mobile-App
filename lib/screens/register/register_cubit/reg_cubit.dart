
import 'dart:convert';
import 'dart:io';
import 'package:disaster_app/models/user_register_model.dart';
import 'package:disaster_app/screens/register/register_states/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class DisasterRegisterCubit extends Cubit<DisasterRegisterStates>
{

  DisasterRegisterCubit() : super(DisasterRegisterInitialStates());
  static DisasterRegisterCubit get(context) =>BlocProvider.of(context);
  UserRegister? UserRegisterModel;

  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String gender,
    required String speciality,
    required String role,
    required File? photoUser,
    required File? photoAffair,
    required String phoneNumber,
    required String workPlace,
  }) async {
    print('hello from register');
    emit(DisasterRegisterLoadingStates());
    final url = Uri.parse('https://projectwebadvanced.onrender.com/user/signUp');
    final request = http.MultipartRequest('POST', url);
    request.fields['firstName'] = firstName;
    request.fields['lastName'] = lastName;
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['confirmPassword'] = confirmPassword;
    request.fields['gender'] = gender;
    request.fields['speciality'] = speciality;
    request.fields['role'] = role;
    request.fields['phoneNumber'] = phoneNumber;
    request.fields['workPlace'] = workPlace;

    if (photoUser != null) {
      final photoUserBytes = await photoUser.readAsBytes();
      request.files.add(
        http.MultipartFile.fromBytes(
          'photoUser',
          photoUserBytes,
          filename: 'photo_user.jpg',
        ),
      );
    }

    if (photoAffair != null) {
      final photoAffairBytes = await photoAffair.readAsBytes();
      request.files.add(
        http.MultipartFile.fromBytes(
          'photoAffair',
          photoAffairBytes,
          filename: 'photo_affair.jpg',
        ),
      );
    }

    try {
      final response = await request.send();
      final responseStream = await response.stream.bytesToString();
      final responseData = json.decode(responseStream);


      print(responseData);
       //UserRegisterModel = UserRegister.fromJson(responseData);
      final bool status = responseData['status'];

      if(status !=null){
        if(status){
          UserRegisterModel= UserRegister(message:responseData['message'] ,status:responseData['status'] ,user: responseData['user']);

        }else{
          UserRegisterModel= UserRegister(message:responseData['message'] ,status:responseData['status']);

        }
      }

     print(UserRegisterModel);

      emit(DisasterRegisterSucessStates(UserRegisterModel));
    } catch (error) {
      print(error.toString());
       emit(DisasterRegisterErorrStates(error.toString()));
      // Fluttertoast.showToast(
      //     msg: error.toString(),
      //     toastLength: Toast.LENGTH_LONG,
      //     timeInSecForIosWeb: 5,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16,
      //     gravity: ToastGravity.BOTTOM);
    }
  }


  IconData sufix= Icons.visibility;
  bool passwordHidden=true;
  void changePasswordVis(){
    passwordHidden=!passwordHidden;
    sufix= passwordHidden? Icons.visibility:Icons.visibility_off_rounded ;
    emit(DisasterRegisterChangePasswordStates());
  }
}

/*

 */