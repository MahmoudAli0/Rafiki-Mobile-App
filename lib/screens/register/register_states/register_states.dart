import 'package:disaster_app/models/user_register_model.dart';

abstract class DisasterRegisterStates{}
class DisasterRegisterInitialStates extends DisasterRegisterStates{}
class DisasterRegisterLoadingStates extends DisasterRegisterStates{}
class DisasterRegisterSucessStates extends DisasterRegisterStates{
  final UserRegister? userRegisterData;

  DisasterRegisterSucessStates(this.userRegisterData);
}
class DisasterRegisterChangePasswordStates extends DisasterRegisterStates{}
class DisasterRegisterErorrStates extends DisasterRegisterStates{
  final String error;
  DisasterRegisterErorrStates(this.error);

}