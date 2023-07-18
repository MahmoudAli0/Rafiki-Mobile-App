import 'dart:convert';
import 'dart:io';


import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/screens/posts/normal/states/normal_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../../models/send_post_normal.dart';
class NormalCubit extends Cubit<NormalStates> {
  NormalCubit() : super(NormalIntialState());

  static NormalCubit get(context) => BlocProvider.of(context);

  SendNormalPost? normalPost;

  void SendPost({
    required String textArea,
    required String date,
    required String time,
     File? photo,
  }) async{
    print('hello post');
    emit(NormalLoadinState());
    final url = Uri.parse('https://projectwebadvanced.onrender.com/normal/normalPost',);
    final request = http.MultipartRequest('POST', url);
    request.fields['textArea'] = textArea;
    request.fields['date'] = date;
    request.fields['time'] = time;
   request.headers['Authorization']=token;
    if (photo != null) {
      final photoUserBytes = await photo.readAsBytes();
      request.files.add(
        http.MultipartFile.fromBytes(
          'photo',
          photoUserBytes,
          filename: 'photo_user.jpg',
        ),
      );
    }
    try {
      final response = await request.send();
      final responseStream = await response.stream.bytesToString();
      final responseData = json.decode(responseStream);
      print(responseData);
      normalPost = SendNormalPost.fromJson(responseData);
      emit(NormalSucessState(normalPost));
    } catch (error) {
      print(error.toString());
      emit(NormalErorrState());
    }
  }


}
