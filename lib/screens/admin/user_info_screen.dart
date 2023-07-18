
import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/constants/methods.dart';

import 'package:disaster_app/screens/admin/cubit/all_user_cubit.dart';
import 'package:disaster_app/screens/admin/states/all_user_states.dart';
import 'package:disaster_app/shared_preferences/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserInfoScreen extends StatefulWidget {

 final String name;
  final String email;
  final String phone;
  final String gender;
  final String sp;
  final String work;
  final String workPlace;
  final String photoUser;
  final String photoAffiar;
  UserInfoScreen({required this.name,
    required this.phone,
    required this.email,
    required this.gender,
    required this.sp,
    required this.workPlace,
    required this.work,
    required this.photoUser,
    required this.photoAffiar,
  });

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
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
    return BlocProvider(
      create: (BuildContext context) => UserVaildCubit(),
      child: BlocConsumer<UserVaildCubit,UserVaildStates>(
       listener: (context,state){
         if(state is UserVaildSucessState){
           if(state.userVaild!.status){
             Fluttertoast.showToast(
                 msg: state.userVaild!.message,
                 backgroundColor: Colors.green,
                 textColor: Colors.white,
                 toastLength: Toast.LENGTH_SHORT);
           }
         }
       },
        builder: (context,state){
          return Scaffold(
            backgroundColor: secondryColor,
            appBar: AppBar(
              backgroundColor: mainColor,
              toolbarHeight: MediaQuery.of(context).size.height * 0.10,
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
                  onPressed: () {},
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
            body: LayoutBuilder(
              builder: (BuildContext context,BoxConstraints constraints){
                return  SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            radius: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8, right: 8, bottom: 6),
                              child: Image.network(
                               widget.photoUser,
                                fit: BoxFit.fill,
                                width: 32,
                                height: 32,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children:  [
                                const Text(
                                  'الاسم : ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children:  [
                                const Text(
                                  'الايميل : ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.email,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children:  [
                                const Text(
                                  'الهاتف : ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.phone,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children:  [
                                const Text(
                                  'النوع : ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.gender,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.work,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.sp,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.workPlace,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              children:  [
                                const Text(
                                  'اثبات  : ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 8, right: 8, bottom: 6),
                                    child: Image.network(
                                     widget.photoUser,
                                      fit: BoxFit.fill,
                                      width: 32,
                                      height: 32,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Tooltip(
                                              message:"سيظهر ملف من المؤسسة هنا بمجرد تحميله...",
                                              child: Icon(
                                                Icons.error_outline,
                                                size: 24,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: SizedBox(
                                  width: 130,
                                  height: 60,
                                  child:  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: mainColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                      ),
                                      onPressed: () {
                                        UserVaildCubit.get(context).SendUserEmail(email: widget.email);
                                      },
                                      child: const Text(
                                        'الموافقة ',
                                        style: TextStyle(fontSize: 18),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: SizedBox(
                                  width: 130,
                                  height: 60,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: mainColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                      ),
                                      onPressed: () {
                                        UserVaildCubit.get(context).SendUnVaildUserEmail(email: widget.email);
                                      },
                                      child: const Text(
                                        'الرفض ',
                                        style: TextStyle(fontSize: 18),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
