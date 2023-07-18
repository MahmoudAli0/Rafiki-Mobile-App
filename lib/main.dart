
import 'package:disaster_app/app_cubit/app_cubit.dart';
import 'package:disaster_app/app_cubit/app_states.dart';
import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/dio/dio_helper.dart';
import 'package:disaster_app/screens/home/home_screen.dart';
import 'package:disaster_app/screens/login/login_screen.dart';
import 'package:disaster_app/shared_preferences/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/splash/splash_screen.dart';
void main() async{
  Widget widget;
  WidgetsFlutterBinding.ensureInitialized();
  await Cashe_Helper.init();
  DioHelper.init();
  token = Cashe_Helper().getData(Key: 'token') ??'';
  bool isValidNow = Cashe_Helper().getData(Key: 'isValid')??false;
  if (token!='' ) {
    if(isValidNow?? false){
      widget = const HomeScreen();
    }else{
      widget= const LoginPage();
    }
  } else {
    widget = const SplashScreen();
  }
  print(token);
  print(isValidNow);
  runApp( MyApp(
    startWidget: widget,
  ));
}
class MyApp extends StatefulWidget {
  final Widget startWidget;
  const MyApp({super.key, required this.startWidget});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          //
          create: (BuildContext context) => AppCubit()..getPostsData()..getNormalPostsData(),
        ),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder:  (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: widget.startWidget,//
          );
        },
      ),
    );
  }
}

