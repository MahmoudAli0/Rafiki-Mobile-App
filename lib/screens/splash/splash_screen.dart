
import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return  const LoginPage();
      }));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Disaster',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: constraints.maxHeight * 0.04,
                      fontFamily: 'Lobster',
                    ),
                  ),
                  Text(
                    'Warning',
                    style: TextStyle(
                      color: Color(0xFF0B0225),
                      fontWeight: FontWeight.bold,
                      fontSize: constraints.maxHeight * 0.04,
                      fontFamily: 'Lobster',
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );

  }
}