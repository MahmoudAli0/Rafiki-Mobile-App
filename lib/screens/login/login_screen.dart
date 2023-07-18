
import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/screens/home/home_screen.dart';
import 'package:disaster_app/screens/login/befor_approved.dart';
import 'package:disaster_app/screens/login/cubit/login_cubit.dart';
import 'package:disaster_app/screens/login/states/login_states.dart';
import 'package:disaster_app/screens/register/register_screen.dart';
import 'package:disaster_app/shared_preferences/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  final String adminEmail = 'a.gebara1002@gmail.com';
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Responsive font size calculation
    double getResponsiveFontSize(double fontSize) {
      return fontSize * screenSize.width / 375; // Adjust the reference screen width as needed
    }

    return BlocProvider(
      create: (BuildContext context) =>DisasterLoginCubit(),
      child: BlocConsumer<DisasterLoginCubit,DisasterLoginStates>(
        listener: (context,state){
          if(state is DisasterLoginSucessStates){
            if(state.DisasterLoginModel.status){
              setState(() {
                token= state.DisasterLoginModel.token??'';
                isadmin=state.DisasterLoginModel.adminValid??false;
                isValid=state.DisasterLoginModel.userValid??false;
              });
              Cashe_Helper.saveData(
                Key: 'token'??'',
                Value: token??'',
              ).then((value) => {
                token = token??'',
              });
              Cashe_Helper.saveData(
                Key: 'isValid'??'',
                Value: isValid,
              ).then((value) => {
                isValid=isValid,
              });
              Cashe_Helper.saveData(
                Key: 'isAdmin'??'',
                Value: isadmin??false,
              ).then((value) => {
                isadmin=isadmin ??false,
              });
              if(state.DisasterLoginModel.userValid){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
              }else{
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Befor_Approved()));
              }
            }else{
              Fluttertoast.showToast(
                  msg: state.DisasterLoginModel.message.toString(),
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16,
                  gravity: ToastGravity.BOTTOM);
            }
          }
        },
        builder: (context,state){
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Disaster',
                            style: TextStyle(
                              fontFamily: 'Lobster',
                              fontSize: getResponsiveFontSize(40),
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                              color: const Color(0xff4b4bee),
                            ),
                          ),
                        ),
                        Text(
                          'Warning',
                          style: TextStyle(
                            fontFamily: 'Lobster',
                            fontSize: getResponsiveFontSize(40),
                            fontWeight: FontWeight.w400,
                            height: 1.25,
                            color: const Color(0xff000000),
                          ),
                        ),
                        SizedBox(height: getResponsiveFontSize(50)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'تسجيل دخول',
                              style: TextStyle(
                                fontSize: getResponsiveFontSize(18),
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                color: const Color(0xff2c107b),
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        SizedBox(height: getResponsiveFontSize(20)),
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0XFF2C107B),
                              width: 0.5
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  controller: emailController,
                                  validator: (emailvalue){
                                    if(emailvalue!.isEmpty){
                                      return 'الايميل مطلوب';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'اكتب ايميلك الخاص',
                                    hintStyle: TextStyle(
                                      fontSize: getResponsiveFontSize(12),
                                      color: Colors.grey,
                                    ),
                                    labelText: 'الايميل',
                                    labelStyle: TextStyle(
                                      fontSize: getResponsiveFontSize(18),
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                      color: CupertinoColors.activeBlue,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),

                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getResponsiveFontSize(20),
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextFormField(
                                  controller: passwordController,
                                  validator: (pass){
                                    if(pass!.isEmpty){
                                      return 'كلمة المرور مطلوبة';
                                    }else if(pass.length< 6){
                                      return 'كلمة المرور مطلوبة يجب الا تقل عن ست حروف او ارقام ';
                                    }
                                    return null;
                                  },
                                  obscureText: DisasterLoginCubit.get(context).passwordHidden,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    suffixIcon: IconButton(
                                      icon: Icon(DisasterLoginCubit.get(context).sufix),
                                      onPressed: () {
                                        DisasterLoginCubit.get(context).changePasswordVis();
                                      },
                                    ),
                                    hintText: 'اكتب كلمه المرور الخاصه بحسابك',

                                    hintStyle: TextStyle(
                                      fontSize: getResponsiveFontSize(12),
                                      color: Colors.grey,
                                    ),
                                    labelText: 'كلمه المرور',

                                    labelStyle: TextStyle(
                                      fontSize: getResponsiveFontSize(18),
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                      color: CupertinoColors.activeBlue,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: getResponsiveFontSize(10)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed:
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const VerfiyEmail()));
                                        sendEmail,

                                      child: Text(
                                        'هل نسيت كلمه المرور الخاصه بك ؟',
                                        style: TextStyle(
                                          fontSize: getResponsiveFontSize(12),
                                          fontWeight: FontWeight.w400,
                                          height: 1.5,
                                          color: const Color(0XFF2C107B),
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: getResponsiveFontSize(20)),
                            ],
                          ),
                        ),
                        SizedBox(height: getResponsiveFontSize(10)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, getResponsiveFontSize(24)),
                            width: double.infinity,
                            height: getResponsiveFontSize(70),
                            decoration: BoxDecoration(
                              color: const Color(0xff4b4bee),
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: state is! DisasterLoginLoadingStates ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: const Color(0XFF4B4BEE),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                              ),
                              onPressed: () {
                                if(formKey.currentState!.validate()){
                                  DisasterLoginCubit.get(context).DisUserLogin(email: emailController.text, password: passwordController.text);
                                }
                              },
                              child: Text(
                                'تسجيل الدخول',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: getResponsiveFontSize(18),
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ) :Center(child: CircularProgressIndicator(),)
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const RegisterScreen()),
                                );
                              },
                              child: Text(
                                ' انشيء حسابك',
                                style: TextStyle(
                                  fontSize: getResponsiveFontSize(12),
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  decoration: TextDecoration.underline,
                                  color: const Color(0XFF2C107B),
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            Text(
                              'ليس لديك حساب خاص ؟',
                              style: TextStyle(
                                fontSize: getResponsiveFontSize(12),
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  void sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: adminEmail,
      queryParameters: {'subject': 'السلام عليكم..'},
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch email';
    }
  }
}

// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   'Disaster',
//                   style: TextStyle(
//                     fontFamily: 'Lobster',
//                     fontSize: 40,
//                     fontWeight: FontWeight.w400,
//                     height: 1.25,
//                     color: Color(0xff4b4bee),
//                   ),
//                 ),
//               ),
//               const Text(
//                 'Warning',
//                 style: TextStyle(
//                   fontFamily: 'Lobster',
//                   fontSize: 40,
//                   fontWeight: FontWeight.w400,
//                   height: 1.25,
//                   color: Color(0xff000000),
//                 ),
//               ),
//               const SizedBox(height: 50,),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   const Text(
//                     'تسجيل دخول',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w400,
//                       height: 1.5,
//                       color: Color(0xff2c107b),
//                     ),
//                     textAlign: TextAlign.end,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20,),
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(
//                     color: const Color(0XFF2C107B),
//                   ),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: const [
//                           BoxShadow(
//                             offset: Offset(0, 1),
//                             blurRadius: 2,
//                           ),
//                         ],
//                       ),
//                       width: double.infinity,
//                       child: Directionality(
//                         textDirection: TextDirection.rtl,
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             hintText: 'اكتب ايميلك الخاص  ',
//                             hintStyle: const TextStyle(fontSize: 12,color: Colors.grey),
//                             labelText: 'الايميل',
//                             labelStyle: const TextStyle(
//                               fontSize: 18,
//                               fontWeight:
//                               FontWeight.w400,
//                               height: 1.5,
//                               color: CupertinoColors.activeBlue,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16),
//                         boxShadow: const
//                         [
//                           BoxShadow(
//                             offset: Offset(0, 1),
//                             blurRadius: 2,
//                           ),
//                         ],
//                       ),
//                       child: Directionality(
//                         textDirection: TextDirection.rtl,
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             hintText: 'اكتب كلمه المرور الخاصه بحسابك ',
//                             hintStyle: const TextStyle(fontSize: 12,color: Colors.grey),
//                             labelText: 'كلمه المرور',
//                             labelStyle: const TextStyle(
//                               fontSize: 18,
//                               fontWeight:
//                               FontWeight.w400,
//                               height: 1.5,
//                               color: CupertinoColors.activeBlue,
//                             ),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(16),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10,),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           TextButton(
//                             onPressed:(){},
//                             child: const Text(
//                               'هل نسيت كلمه المرور الخاصه بك ؟',
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w400,
//                                 height: 1.5,
//                                 color: Color(0XFF2C107B),
//                               ),
//                               textAlign: TextAlign.end,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20,),
//
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10,),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   margin: const EdgeInsets.fromLTRB(
//                       0, 0, 0, 24),
//                   width: double.infinity,
//                   height: 70,
//                   decoration: BoxDecoration(
//                     color: const Color(0xff4b4bee),
//                     borderRadius:
//                     BorderRadius.circular(40),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Color(0x3f000000),
//                         offset: Offset(0, 4),
//                         blurRadius: 2,
//                       ),
//                     ],
//                   ),
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         backgroundColor: const Color(0XFF4B4BEE),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(40),
//                         )
//                     ),
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
//                     }, child:const Text(
//                     'تسجيل الدخول',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       height: 1.5,
//                       color: Color(0xffffffff),
//                     ),
//                   ),),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
//                     },
//                     child: const Text(
//                       ' انشيء حسابك',
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         height: 1.5,
//                         decoration: TextDecoration.underline,
//                         color: Color(0XFF2C107B),
//                       ),
//                       textAlign: TextAlign.end,
//                     ),
//                   ),
//                   const Text(
//                     'ليس لديك حساب خاص ؟',
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       height: 1.5,
//                       color: Colors.black,
//                     ),
//                     textAlign: TextAlign.end,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
