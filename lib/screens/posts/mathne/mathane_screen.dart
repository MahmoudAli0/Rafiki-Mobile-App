import 'dart:async';
import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/constants/methods.dart';
import 'package:disaster_app/screens/posts/mathne/cubit/mathane_cubit.dart';
import 'package:disaster_app/screens/posts/mathne/states/mathane_states.dart';
import 'package:disaster_app/screens/posts/normal/normal_screen.dart';
import 'package:disaster_app/shared_preferences/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MathaneScreen extends StatefulWidget {
  const MathaneScreen({Key? key}) : super(key: key);

  @override
  State<MathaneScreen> createState() => _MathaneScreenState();
}

class _MathaneScreenState extends State<MathaneScreen> {
  bool isClicked = false;
  var accidentController = TextEditingController();
  var locationController = TextEditingController();
  var accidentTypeController = TextEditingController();
  var dinTypeController = TextEditingController();
  var accidentWayController = TextEditingController();
  var numberOfInjeredController = TextEditingController();
  var servicesController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String currentTime = '';
  late String formattedDate;

  bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    // Update the time every second
    isAdmin = Cashe_Helper().getData(Key: 'isAdmin');
    print(token);
    print(isValid);
    print(isAdmin);
    Future.microtask(() {
      if (mounted) {
        Timer.periodic(const Duration(seconds: 1), (Timer timer) {
          setState(() {
            DateTime now = DateTime.now();
            String hour = _formatTwoDigitNumber(now.hour);
            String minute = _formatTwoDigitNumber(now.minute);
            currentTime = '$hour:$minute';
          });
        });
      }
    });

    DateTime now = DateTime.now();
    formattedDate =
        "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString()}";
  }

  String _formatTwoDigitNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MathaneCubit(),
      child: BlocConsumer<MathaneCubit, MathaneStates>(
        listener: (context, state) {
          if (state is MathaneSucessState) {
            if (state.mathanePost!.stauts) {
              Fluttertoast.showToast(
                  msg: 'تم اضافة التقرير بنجاح ...',
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16,
                  gravity: ToastGravity.BOTTOM);
            } else {
              Fluttertoast.showToast(
                  msg: 'هناك مشكلة ما يرجي المحاولة لاحقا ...',
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16,
                  gravity: ToastGravity.BOTTOM);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromRGBO(124, 110, 163, 0.7),
            appBar: AppBar(
              backgroundColor: mainColor,
              toolbarHeight: MediaQuery.of(context).size.height * 0.10,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
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
                  data: Theme.of(context)
                      .copyWith(dividerColor: CupertinoColors.activeBlue),
                  child: PopupMenuButton<int>(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: mainColor)),
                      onSelected: (item) =>
                          selectedItemMenuButton(context, item),
                      constraints: const BoxConstraints(
                          maxHeight: 175, maxWidth: 500, minWidth: 170),
                      itemBuilder: (context) => [
                            const PopupMenuItem<int>(
                              value: 1,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  'حسابي',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const PopupMenuDivider(),
                            const PopupMenuItem<int>(
                              value: 2,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  'اضافة بوست ',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            const PopupMenuDivider(),
                            if (isAdmin)
                              const PopupMenuItem<int>(
                                value: 3,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    'طلبات التسجيل',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            if (isAdmin) const PopupMenuDivider(),
                            const PopupMenuItem<int>(
                              value: 4,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  'خروج',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ]),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.white,
                          child: const Directionality(
                              textDirection: TextDirection.rtl,
                              child: ListTile(
                                title: Text(
                                  'نوع المنشور ',
                                  style: TextStyle(
                                      color: CupertinoColors.activeBlue),
                                ),
                                trailing: Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: CupertinoColors.activeBlue,
                                ),
                              )),
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
                                      builder: (context) =>
                                          const MathaneScreen()));
                            },
                            child: Container(
                              width: 200,
                              height: 40,
                              alignment: AlignmentDirectional.bottomCenter,
                              color: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: const Text(
                                'METHANE',
                                style: TextStyle(
                                    color: CupertinoColors.activeBlue),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NormalScreen()));
                            },
                            child: Container(
                              width: 200,
                              height: 40,
                              alignment: AlignmentDirectional.bottomCenter,
                              color: Colors.white,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: const Text(
                                'العادي',
                                style: TextStyle(
                                    color: CupertinoColors.activeBlue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text(
                            'METHANE',
                            style: TextStyle(
                              color: CupertinoColors.activeBlue,
                              letterSpacing: 8,
                              fontSize: 22,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                '.',
                                style: TextStyle(
                                  color: CupertinoColors.activeBlue,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: Container(
                                  width: 140,
                                  height: 0.5,
                                  color: CupertinoColors.activeBlue,
                                ),
                              ),
                              const Text(
                                '.',
                                style: TextStyle(
                                    color: CupertinoColors.activeBlue),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 8),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    clipBehavior: Clip.hardEdge,
                                    children: [
                                      TextFormField(
                                        maxLines: 2,
                                        controller: accidentController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'اثر الحادث مطلوب ..';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'الاعلان عن الحادث',
                                          labelStyle: const TextStyle(),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 8),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    clipBehavior: Clip.hardEdge,
                                    children: [
                                      TextFormField(
                                        controller: locationController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'موقع  الحادث مطلوب ..';
                                          }
                                        },
                                        maxLines: 2,
                                        decoration: InputDecoration(
                                          labelText: 'موقع الحادث',
                                          labelStyle: const TextStyle(),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 8),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    clipBehavior: Clip.hardEdge,
                                    children: [
                                      TextFormField(
                                        controller: accidentTypeController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'نوع الحادث مطلوب ..';
                                          }
                                        },
                                        maxLines: 2,
                                        decoration: InputDecoration(
                                          labelText: 'نوع الحادث',
                                          labelStyle: const TextStyle(),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 8),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    clipBehavior: Clip.hardEdge,
                                    children: [
                                      TextFormField(
                                        controller: dinTypeController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'انواع المخاطر المحتملة ..';
                                          }
                                        },
                                        maxLines: 2,
                                        decoration: InputDecoration(
                                          labelText: 'انواع المخاطر المحتملة ',
                                          labelStyle: const TextStyle(),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 8),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    clipBehavior: Clip.hardEdge,
                                    children: [
                                      TextFormField(
                                        controller: accidentWayController,
                                        maxLines: 2,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'طرق الوصول للموقع مطلوب ..';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          labelText:
                                              'طرق الوصول للموقع والخروج',
                                          labelStyle: const TextStyle(),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 8),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    clipBehavior: Clip.hardEdge,
                                    children: [
                                      TextFormField(
                                        controller: numberOfInjeredController,
                                        maxLines: 2,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'عدد الضحايا  مطلوب ..';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'عدد الضحايا بالحادث ',
                                          labelStyle: const TextStyle(),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 8),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    clipBehavior: Clip.hardEdge,
                                    children: [
                                      TextFormField(
                                        controller: servicesController,
                                        maxLines: 2,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'خدمات الطوارئ مطلوب ..';
                                          }
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'خدمات الطوارئ المطلوبة ',
                                          labelStyle: const TextStyle(),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        width: 250,
                        height: 50,
                        child: state is! MathaneLoadinState
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(75, 75, 238, 0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    MathaneCubit.get(context).SendPost(
                                        time: currentTime,
                                        date: formattedDate,
                                        accidentEffect: accidentController.text,
                                        dengerousKind: dinTypeController.text,
                                        whatWAyArrive:
                                            accidentWayController.text,
                                        locationCorrectly:
                                            locationController.text,
                                        emergencyServices:
                                            servicesController.text,
                                        numberofvictims:
                                            numberOfInjeredController.text,
                                        accidentKind:
                                            accidentTypeController.text);
                                    accidentController.text = '';
                                    dinTypeController.text = '';
                                    accidentWayController.text = '';
                                    locationController.text = '';
                                    servicesController.text = '';
                                    numberOfInjeredController.text = '';
                                    accidentTypeController.text = '';
                                  }
                                },
                                child: const Text('انشر التقرير'))
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
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
}
