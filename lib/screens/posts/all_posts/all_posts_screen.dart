import 'dart:async';
import 'package:disaster_app/app_cubit/app_cubit.dart';
import 'package:disaster_app/app_cubit/app_states.dart';
import 'package:disaster_app/models/all_mathane_posts.dart';
import 'package:disaster_app/models/methane_all_comments.dart';
import 'package:disaster_app/screens/posts/comments/comment_screen.dart';
import 'package:disaster_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class AllPostsScreen extends StatefulWidget {
  const AllPostsScreen({Key? key}) : super(key: key);

  @override
  State<AllPostsScreen> createState() => _AllPostsScreenState();
}

class _AllPostsScreenState extends State<AllPostsScreen> {
  String currentTime = '';
  late String formattedDate;

  @override
  void initState() {
    super.initState();

    Timer? timer;

    void updateTime(Timer t) {
      if (mounted) {
        setState(() {
          DateTime now = DateTime.now();
          String hour = _formatTwoDigitNumber(now.hour);
          String minute = _formatTwoDigitNumber(now.minute);
          currentTime = '$hour:$minute';
        });
      }
    }

    // Update the time every second
    timer = Timer.periodic(const Duration(seconds: 1), updateTime);

    // Dispose the timer when the widget is being disposed
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          DateTime now = DateTime.now();
          formattedDate =
          "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString()}";
        });
      }
    });

    // Cancel the timer when the widget is being disposed
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!mounted) {
        timer?.cancel();
      }
    });
  }

  String _formatTwoDigitNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          return AppCubit.get(context).allPosts !=null?  buildPost(context, AppCubit.get(context).allPosts):const Center(child: CircularProgressIndicator());
        },
        listener: (context, state) {
        });
  }

  Widget buildPost(context, Posts? posts) {
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
                childAspectRatio: 1 / 1.5,
                shrinkWrap: true,
                children: List.generate(
                  posts!.result,
                      (index) => buildPostContent(posts.data!.methanes![index]),
                )),
          ),
        ],
      );
    }

  }


  _launchPhoneApp(phone) async {
    var phoneNumber =
        'tel:+20 ${phone}'; // Replace with the desired phone number
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

  Widget buildPostContent(Methanes ma) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {

                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            child:Image.network(
                              ma.userId!.photoUser,
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
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              ma.userId!.firstName +" "+ ma.userId!.lastName,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              children: [
                                Text(
                                  ma.userId!.role ,
                                  style: const TextStyle(fontSize: 10),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  ma.time,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  ma.date,
                                ),
                                const Spacer(),
                                Text(
                                  ma.userId!.workPlace,
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
                children: [
                  const Flexible(
                    flex: 1,
                    child: Text(
                      'الاعلان عن الحادث :',
                      style: TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      textAlign: TextAlign.start,
                      ma.accidentEffect,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  const Flexible(
                    flex: 1,
                    child: Text(
                      ' موقع الحادث  :',
                      style: TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      ma.locationCorrectly,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  const Flexible(
                    flex: 1,
                    child: Text(
                      'نوع الحادث :',
                      style: TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      ma.accidentKind,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  const Flexible(
                    flex: 1,
                    child: Text(
                      'انواع الخطر المحتملة :',
                      style: TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      ma.dengerousKind,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  const Flexible(
                    flex: 1,
                    child: Text(
                      'طريقة الوصول للموقع :',
                      style: TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      ma.whatWAyArrive,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  const Flexible(
                    flex: 1,
                    child: Text(
                      'عدد الضحايا :',
                      style: TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Text(
                      ma.numberofvictims.toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  const Flexible(
                    flex: 2,
                    child: Text(
                      'خدمات الطوارئ المطلوبة :',
                      style: TextStyle(
                          fontSize: 12,
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Text(
                      ma.emergencyServices,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  CommentPage(postId: ma.sId,)));
                          print(ma.sId);
                        },
                        child: const Text(
                          'تعليق بالمساعدة',
                          style:
                              TextStyle(fontSize: 10, color: Colors.lightBlue),
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
                        _launchPhoneApp(ma.userId!.phoneNumber);
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
          ],
        ),
      );
}
