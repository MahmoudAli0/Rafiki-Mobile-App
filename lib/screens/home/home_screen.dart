import 'dart:io';

import 'package:disaster_app/app_cubit/app_cubit.dart';
import 'package:disaster_app/app_cubit/app_states.dart';
import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/constants/methods.dart';
import 'package:disaster_app/screens/posts/add_post/add_post_screen.dart';
import 'package:disaster_app/screens/posts/all_posts/all_posts_screen.dart';
import 'package:disaster_app/screens/posts/normal/normal_all_posts.dart';
import 'package:disaster_app/shared_preferences/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget implements PreferredSizeWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}


class _HomeScreenState extends State<HomeScreen> {

  bool isAdmin=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     isAdmin = Cashe_Helper().getData(Key: 'isAdmin');
    print(token??'');
    print(isValid);
    print(isAdmin);
  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      builder: (context,state){
        return DefaultTabController(
          length: 2,
          child: WillPopScope(
            onWillPop: () async{
              exit(0);
            },
            child: Scaffold
              (
              body: const TabBarView(
                children: [
                  AllPostsScreen(),
                  NormalAllPosts(),
                ],
              ),
              appBar: AppBar(
                bottom: const TabBar(
                  indicatorColor: Colors.white,
                  physics: NeverScrollableScrollPhysics(),
                  tabs: [
                    // Icon(Icons.home_filled, color: Colors.white, size: 30,),
                    // Icon(Icons.add_card_outlined, color: Colors.white, size: 30,),
                    Text('METHANE'),
                    Text('Report'),
                  ],
                ),
                backgroundColor: mainColor,
                toolbarHeight: MediaQuery
                    .of(context)
                    .size
                    .height * 0.10,
                elevation: 0.0,
                title: const Text('Disaster Warning',
                  style: TextStyle(color: Colors.white, fontSize: 18,),),
                actions: [
                  IconButton(onPressed: () {
                    AppCubit.get(context).getPostsData();
                    AppCubit.get(context).getNormalPostsData();
                  },
                    icon: const Icon(Icons.refresh, color: Colors.white, size: 22,),),
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
              floatingActionButton: FloatingActionButton.extended(
                  backgroundColor: mainColor,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddPostScreen()));
                  },
                  label: Row(
                    textDirection: TextDirection.rtl,
                    children: const[
                       Text(
                        'اضافة تقرير ',
                        style: TextStyle(
                            color: Colors.white),
                      ),
                      SizedBox(width: 4,),
                      Icon(CupertinoIcons.plus),
                    ],
                  )),
            ),
          ),
        );
      },
      listener: (context,state){},
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 400);
}
