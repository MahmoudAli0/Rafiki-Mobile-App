import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/constants/methods.dart';
import 'package:disaster_app/screens/posts/mathne/mathane_screen.dart';
import 'package:disaster_app/screens/posts/normal/normal_screen.dart';
import 'package:disaster_app/shared_preferences/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool isClicked = false;
  bool isMathaneClicked = false;
  bool isAdmin=false;
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
    return Scaffold(
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
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: CupertinoColors.activeBlue,
            ),
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color.fromRGBO(124, 110, 163, 0.7),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final screenHeight = constraints.maxHeight;
            final screenWidth = constraints.maxWidth;

            return SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.05,
                        left: screenWidth * 0.04,
                        right: screenWidth * 0.04,
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        child: const Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListTile(
                            title: Text(
                              'نوع التقرير ',
                              style: TextStyle(
                                color: CupertinoColors.activeBlue,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_drop_down_outlined,
                              color: CupertinoColors.activeBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (isClicked)
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MathaneScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: screenWidth * 0.4,
                            height: screenHeight * 0.05,
                            alignment: AlignmentDirectional.bottomCenter,
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                            ),
                            child: const Text(
                              'METHANE',
                              style: TextStyle(
                                color: CupertinoColors.activeBlue,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NormalScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: screenWidth * 0.4,
                            height: screenHeight * 0.05,
                            alignment: AlignmentDirectional.bottomCenter,
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                            ),
                            child: const Text(
                              'تقرير حادث',
                              style: TextStyle(
                                color: CupertinoColors.activeBlue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  SizedBox(height: screenHeight * 0.1),
                  Column(
                    children: const [
                      Text(
                        'اختر نوع المنشور',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'الذي تريد ان',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'يظهر للباقي',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
