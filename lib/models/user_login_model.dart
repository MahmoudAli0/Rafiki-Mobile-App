class UserLogin {
  final String? message;
  final bool status;
   bool userValid=false;
   bool adminValid=false;
  final String? token;

  UserLogin({ this.message, required this.status, this.token, this.userValid=false, this.adminValid=false});

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    if (json['status'] == true) {
      return UserLogin(
        status: json['status'],
        token: json['token'] as String?,
        userValid: json['userValid'] ??false,
        adminValid: json['adminValid']??false,
      );
    } else {
      return UserLogin(
        message: json['message'] as String,
        status: json['status'] ?? false,
        token: '', // Assign null explicitly when the token is not available
        userValid: false,
        adminValid: false,
      );
    }
  }

}
