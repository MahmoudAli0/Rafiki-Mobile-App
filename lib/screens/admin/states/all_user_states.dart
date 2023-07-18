import 'package:disaster_app/models/user_vaild_data.dart';

abstract class UserVaildStates{}
class UserVaildIntialState extends UserVaildStates{}
class UserVaildLoadinState extends UserVaildStates{}
class UserVaildErorrState extends UserVaildStates{}
class UserVaildSucessState extends UserVaildStates{
  final UserVaild? userVaild;

  UserVaildSucessState(this.userVaild);
}