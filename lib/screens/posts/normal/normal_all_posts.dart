import 'dart:async';

import 'package:disaster_app/app_cubit/app_cubit.dart';
import 'package:disaster_app/app_cubit/app_states.dart';
import 'package:disaster_app/models/all_normal_posts.dart';
import 'package:disaster_app/screens/posts/comments/normal_comments/normal_comments_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class NormalAllPosts extends StatefulWidget {
  const NormalAllPosts({Key? key}) : super(key: key);

  @override
  State<NormalAllPosts> createState() => _NormalAllPostsState();
}

class _NormalAllPostsState extends State<NormalAllPosts> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        builder: (context,state){
      return AppCubit.get(context).allNormalPosts !=null?  buildPost(context,AppCubit.get(context).allNormalPosts) :const Center(child: CircularProgressIndicator());
    },
        listener: (context,state){});
  }

  Widget buildPost(context,NormalAllPostsData? posts) {
    if(posts!.result ==0){
      return  const Center(
        child: Directionality(
          textDirection: TextDirection.rtl,
            child: Text('لا يوجد بوستات حاليا ...')),
      );
    }else{
      return Column(
        children: [
          Expanded(
            child: GridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: 1 / 1.1,
                shrinkWrap: true,
                children: List.generate(
                  posts!.result,
                      (index) => buildPostContent(
                      posts.data!.Noormals![index]),)),
          ),

        ],
      );
    }

  }
  _launchPhoneApp(phone) async {
    var  phoneNumber = 'tel:+20 ${phone}'; // Replace with the desired phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      Fluttertoast.showToast(
          msg: 'حدثت مشكلة ما رجاء المحاولة لاحقا..',
          toastLength: Toast.LENGTH_LONG,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16,
          gravity: ToastGravity.BOTTOM);
    }
  }

  Widget buildPostContent(Normals? normals)=> Padding(
    padding: const EdgeInsets.symmetric(horizontal:8),
    child: Column(
      children: [
        Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child:  Image.network(
                        normals!.userId!.photoUser??'',
                        fit: BoxFit.fill,
                        width: 32,
                        height: 32,
                        errorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Tooltip(
                                message:"ستظهر صورة مالك البوست هنا بمجرد تحميلها...",
                                child: Image.asset('images/man.png'),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "${normals.userId!.firstName??''} ${normals.userId!.lastName??''}" ,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          children:  [
                             Text(
                              normals.userId!.role??'',
                              style: const TextStyle(fontSize: 10),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              normals.time??'',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              normals.date??'',
                            ),
                            const Spacer(),
                             Text(
                             normals.userId!.workPlace??'',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        Container(
          color: Colors.blue,
          width: double.infinity,
          height: 1,
        ),
        const SizedBox(
          height: 10,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Flex(
            direction: Axis.horizontal,
            children:  [
              const Flexible(
                flex: 2,
                child: Text(
                  'الاعلان عن الحادث (تقرير):',
                  style: TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.activeBlue,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Flexible(
                flex: 2,
                child:  Text(
                  normals.textArea?? " ",
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],

          ),
        ),
        // Directionality(
        //   textDirection: TextDirection.rtl,
        //   child: Flex(
        //     direction: Axis.horizontal,
        //     children:  [
        //     normals?.photo !=null? const Text(
        //       'الصورة :',
        //       style: TextStyle(
        //           fontSize: 12,
        //           color: CupertinoColors.activeBlue,
        //           fontWeight: FontWeight.bold),
        //     ): const Text(' '),
        //       normals.photo !=null ? Expanded(
        //         child: Image.network(
        //          normals!.photo ??'',
        //           width: 200,
        //           fit: BoxFit.fitWidth,
        //           height: 200,
        //           errorBuilder: (context, error, stackTrace) {
        //             return Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children:  const [
        //                 Tooltip(
        //                   message:"ستظهر صورة مالك البوست هنا بمجرد تحميلها...",
        //                   child: Text(' '),
        //                 ),
        //               ],
        //             );
        //           },
        //         ),
        //       ) : const Text(' '),
        //     ],
        //   ),
        // ),
        const SizedBox(
          height: 10,
        ),
        const Spacer(),
        Container(
          color: Colors.blue,
          width: double.infinity,
          height: 1,
        ),
        const SizedBox(
          height: 10,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  NormalCommentPage(postId: normals.sId!,)));
                    },
                    child: const Text(
                      'تعليق بالمساعدة',
                      style: TextStyle(fontSize: 10, color: Colors.lightBlue),
                    )),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextButton(
                  child: const Text(
                    'التواصل مع الناشر ',
                    style: TextStyle(fontSize: 10, color: Colors.lightBlue),
                  ),
                  onPressed: () {
                    _launchPhoneApp(normals.userId!.phoneNumber);
                  },
                ),
              ),
            ],
          ),
        ),

        Container(
          color: Colors.blue,
          width: double.infinity,
          height: 1,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

