import 'package:disaster_app/app_cubit/app_cubit.dart';
import 'package:disaster_app/app_cubit/app_states.dart';
import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/constants/methods.dart';
import 'package:disaster_app/models/all_user_data.dart';
import 'package:disaster_app/screens/admin/user_info_screen.dart';
import 'package:disaster_app/shared_preferences/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isadmin = Cashe_Helper().getData(Key: 'isAdmin')??false;
    // Default value if the data is null or not convertible to bool

    var isAdminData = Cashe_Helper().getData(Key: 'isAdmin')??false;
    if (isAdminData != null && isAdminData is bool) {
      isadmin = isAdminData;
    }else{
      isadmin=false;
    }
    print(isadmin);
  }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getUserRequestsData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: mainColor,
              toolbarHeight: MediaQuery.of(context).size.height * 0.08,
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
                    AppCubit.get(context).getUserRequestsData();
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
                        if(isadmin)
                          const PopupMenuItem<int>(
                            value: 3,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text('طلبات التسجيل',style: TextStyle(color: Colors.black),),),),
                        if(isadmin)
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
            body: SingleChildScrollView(

              child: Container(
                color: const Color.fromRGBO(13, 4, 39, 1),
                child: Column(
                  children: [
                    Container(
                      color: Colors.black,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          // Directionality(
                          //   textDirection: TextDirection.rtl,
                          //   child: Text(
                          //     'القبول ',
                          //     style: TextStyle(color: Colors.white, fontSize: 20),
                          //   ),
                          // ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'عرض البيانات  ',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'اسم المسجل ',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.white,
                    ),
                    SingleChildScrollView(

                      child: AppCubit.get(context).allUserRequest != null? buildUserData(
                          context, AppCubit.get(context).allUserRequest) : const Center(child: CircularProgressIndicator())
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildUserData(context, AllUserRequest? allUserRequest) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            color: const Color.fromRGBO(13, 4, 39, 1),
            child: GridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 0.1,
                mainAxisSpacing: 0.1,
                childAspectRatio: 1 / 0.2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  allUserRequest!.result,//
                  (index) => buildAdmin(context, allUserRequest!.data![index]),
                )),
          ),
        ],
      );

  Widget buildAdmin(context, UserData? allUser) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Directionality(
          //   textDirection: TextDirection.rtl,
          //   child: SizedBox(
          //     width: 100,
          //     child: ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //           shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(10),
          //       )),
          //       onPressed: () {},
          //       child: const Text(
          //         'اضافة ',
          //         style: TextStyle(color: Colors.white, fontSize: 18),
          //       ),
          //     ),
          //   ),
          // ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  UserInfoScreen(email: allUser!.email,gender: allUser.gender,name: allUser.firstName+allUser.lastName,phone: allUser.phoneNumber,work: allUser.role,sp: allUser.speciality,workPlace: allUser.workPlace,
                          photoUser: allUser.photoUser,
                            photoAffiar: allUser.PhotoAffiar,
                          )));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
                child: const Text(
                  ' بيانات  ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
           Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
             allUser!.firstName +" "+ allUser.lastName,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      );
}
