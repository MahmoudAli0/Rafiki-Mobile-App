import 'package:disaster_app/models/update_user_profile.dart';
import 'package:disaster_app/models/user_profile_data.dart';

abstract class AppStates{


}
class DisasterSucessUserDataStates extends AppStates {
  final Data? userMode;

  DisasterSucessUserDataStates(this.userMode);
}

class DisasterErorrUserDataStates extends AppStates {}
class DisasterLoadingUserDataStates extends AppStates {}
class DisasterIntialUserDataStates extends AppStates {}

class DisasterErorrGetAllUserDataStates extends AppStates {}
class DisasterLoadingGetAllUserDataStates extends AppStates {}
class DisasterSucessGetAllUserDataStates extends AppStates {}

class DisasterErorrGetPostsStates extends AppStates {}
class DisasterSuccessGetPostsStates extends AppStates {}
class DisasterLoadingGetPostsStates extends AppStates {}
class DisasterIntialGetPostStates extends AppStates {}

class DisasterErorrGetMathanePostsComentsStates extends AppStates {}
class DisasterSuccessGetMathanePostsComentsStates extends AppStates {}
class DisasterLoadingGetMathaneComentsStates extends AppStates {}

class DisasterErorrUpdateProfileStates extends AppStates {}
class DisasterLoadingUpdateProfileStates extends AppStates {}

class DisasterSucessUpdateProfileStates extends AppStates {
  final UpdateProfile? userUpdateMode;

  DisasterSucessUpdateProfileStates(this.userUpdateMode);
}