import 'dart:io';


import 'package:disaster_app/app_cubit/app_cubit.dart';
import 'package:disaster_app/app_cubit/app_states.dart';
import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/constants/methods.dart';
import 'package:disaster_app/screens/home/home_screen.dart';
import 'package:disaster_app/screens/profile/edit_profile.dart';
import 'package:disaster_app/shared_preferences/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile_Screen extends StatefulWidget {
   const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {

  bool isAdmin=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isAdmin = Cashe_Helper().getData(Key: 'isAdmin');
    print(token);
    print(isValid);
    print(isAdmin);
  }

  @override
  Widget build(BuildContext context) {
    bool isadmin=true;
    String location='';
    String name='';
    String phoneNumber='';
    String specli='';
    String email='';
    File? photo;
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getUserData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context,state){},
        builder: (context,state){
          var appCubit = AppCubit.get(context);
          var userData = appCubit.userData;

          if (userData != null) {
            name = userData.data!.firstName! ;
            email = userData.data?.email ?? '';
            specli = userData.data?.speciality ?? '';
            location = userData.data?.workPlace ?? '';
            phoneNumber = userData.data?.phoneNumber ?? '';
           // photo = userData.data?.photoUser;
          }

         return Scaffold(
              backgroundColor: const Color.fromRGBO(124, 110, 163, 0.7),
              appBar: AppBar(
                backgroundColor: mainColor,
                toolbarHeight: MediaQuery.of(context).size.height * 0.12,
                elevation: 0.0,
                title: const Text(
                  'Disaster Warning',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      appCubit.getUserData();
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: CupertinoColors.activeBlue),
                    child: PopupMenuButton<int>(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                                color: mainColor
                            )
                        ),
                        onSelected:(item) =>selectedItemMenuButton(context,item),
                        constraints: const BoxConstraints(
                            maxHeight: 175,
                            maxWidth: 500,
                            minWidth: 170
                        ),
                        itemBuilder: (context) =>
                        [
                          const PopupMenuItem<int>(
                            value: 1,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text('حسابي',style: TextStyle(color: Colors.black),),),),
                          const PopupMenuDivider(),
                          const PopupMenuItem<int>(
                            value: 2,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text('اضافة بوست ',style: TextStyle(color: Colors.black),),),),
                          const PopupMenuDivider(),
                          if(isAdmin)
                            const PopupMenuItem<int>(
                              value: 3,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text('طلبات التسجيل',style: TextStyle(color: Colors.black),),),),
                          if(isAdmin)
                            const PopupMenuDivider(),
                          const PopupMenuItem<int>(
                            value: 4,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text('خروج',style: TextStyle(color: Colors.black),),),),
                        ]),
                  ),
                ],
              ),
              body:  userData != null?
          Container(
                color: const Color.fromRGBO(124, 110, 163, 0.7),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (c) =>const HomeScreen()));
                            },
                            icon: const Icon(
                              CupertinoIcons.arrow_left,
                              color: mainColor,
                            ),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Column(
                                children: [
                                  const Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      'الملف الشخصي',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 0.5,
                                    color: mainColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                          width: 400,
                          height: 400,
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey[100],
                                    radius: 55,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 8, right: 8, bottom: 6),
                                      child:  Image.network(
                                        userData!.data!.photoUser??'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG.png',
                                        fit: BoxFit.fill,
                                        width: 70,
                                        height: 70,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:  [
                                              Tooltip(
                                                message:"ستظهر الصورة الشخصية هنا بمجرد تحميلها...",
                                                child: Image.asset('images/man.png'),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    ' ${userData!.data!.firstName} ${userData!.data!.lastName}',
                                    style: const TextStyle(
                                        color: CupertinoColors.activeBlue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),//name
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Row(
                                      children:  [
                                        const Text(
                                          'الوظيفة : ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${userData!.data!.role}',
                                          style: const TextStyle(
                                            color: CupertinoColors.activeBlue,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),//jop
                                const SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Row(
                                      children:  [
                                        const Text(
                                          'التخصص : ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          specli,
                                          style: const TextStyle(
                                            color: CupertinoColors.activeBlue,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),//spec
                                const SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children:  [
                                      Text(
                                        '${userData!.data!.email}',
                                        style: const TextStyle(
                                          color: CupertinoColors.activeBlue,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Text(
                                          'البريد الالكتروني : ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children:  [
                                      Text(
                                        '${userData!.data!.phoneNumber}',
                                        style: const TextStyle(
                                          color: CupertinoColors.activeBlue,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const Directionality(

                                        textDirection: TextDirection.rtl,
                                        child: Text(
                                          'رقم الهاتف : ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Row(
                                      children:  [
                                        const Text(
                                          'مكان العمل : ',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${userData!.data!.workPlace}',
                                          style: const TextStyle(
                                            color: CupertinoColors.activeBlue,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    width: 250,
                                    height: 50,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: mainColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                        onPressed: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Edit_Profile()));
                                        }, child: const Text('عدل بياناتك',style: TextStyle(fontSize: 18),)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ) : const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }

  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 400);
}
