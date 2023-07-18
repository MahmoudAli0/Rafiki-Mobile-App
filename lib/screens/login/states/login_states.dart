abstract class DisasterLoginStates{}
class DisasterLoginInitialStates extends DisasterLoginStates{}
class DisasterLoginLoadingStates extends DisasterLoginStates{}
class DisasterLoginSucessStates extends DisasterLoginStates{
  final DisasterLoginModel;

  DisasterLoginSucessStates(this.DisasterLoginModel);
}
class DisasterLoginChangePasswordStates extends DisasterLoginStates{}
class DisasterLoginErorrStates extends DisasterLoginStates{
  final String error;
  DisasterLoginErorrStates(this.error);

}