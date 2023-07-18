
import 'package:disaster_app/app_cubit/app_cubit.dart';
import 'package:disaster_app/app_cubit/app_states.dart';
import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/constants/methods.dart';
import 'package:disaster_app/screens/profile/profile_screen.dart';
import 'package:disaster_app/shared_preferences/cashe_helper.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({Key? key}) : super(key: key);

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  var nameController = TextEditingController();
  var jopController = TextEditingController();
  var specliController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();

  String firistname = " ";
  String jop = "";
  String speci = "";
  String email = "";
  String phone = "";
  String location = "";
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
    void submitNameData() {
      Navigator.of(context).pop(nameController.text);
    }

    void submitJobData() {
      Navigator.of(context).pop(jopController.text);
    }

    void submitLocationData() {
      Navigator.of(context).pop(locationController.text);
    }

    void submitspecData() {

      Navigator.of(context).pop(specliController.text);
    }

    void submitEmailData() {
      Navigator.of(context).pop(emailController.text);
    }

    void submitPhoneData() {

      Navigator.of(context).pop(phoneController.text);
    }

    Future<String?> openNameDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              title: const Directionality(
                  textDirection: TextDirection.rtl, child: Text('الاسم')),
              content: TextField(
                controller: nameController,
                onSubmitted: (_) async{
                 await submitNameData;
                },
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: 'ادخل الاسم الجديد ',
                    hintStyle: TextStyle(fontSize: 14)),
              ),
              actions: [
                TextButton(
                    onPressed: submitNameData, child: const Text('تعديل'))
              ],
            ));

    Future<String?> openLocationDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              title: const Directionality(
                  textDirection: TextDirection.rtl, child: Text('مكان العمل ')),
              content: TextField(
                controller: locationController,
                onSubmitted: (_) {
                  submitLocationData();
                },
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: 'ادخل مكان العمل الجديد',
                    hintStyle: TextStyle(fontSize: 14)),
              ),
              actions: [
                TextButton(
                    onPressed: submitLocationData, child: const Text('تعديل'))
              ],
            ));

    Future<String?> openPhoneDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              title: const Directionality(
                  textDirection: TextDirection.rtl, child: Text('رقم الهاتف ')),
              content: TextField(
                controller: phoneController,
                onSubmitted: (_) {
                  submitPhoneData();
                },
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: 'ادخل رقم الهاتف الجديد ',
                    hintStyle: TextStyle(fontSize: 14)),
              ),
              actions: [
                TextButton(
                    onPressed: submitPhoneData, child: const Text('تعديل'))
              ],
            ));

    Future<String?> openEmailDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              title: const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text('البريد الالكتروني')),
              content: TextField(
                controller: emailController,
                onSubmitted: (_) {
                  submitEmailData();
                },
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: 'ادخل البريد الالكتروني الجديد ',
                    hintStyle: TextStyle(fontSize: 14)),
              ),
              actions: [
                TextButton(
                    onPressed: submitEmailData, child: const Text('تعديل'))
              ],
            ));
    Future<String?> openJopDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              title: const Directionality(
                  textDirection: TextDirection.rtl, child: Text('الوظيفة')),
              content: TextField(
                controller: jopController,
                onSubmitted: (_) {
                  submitJobData();
                },
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: 'ادخل الوظيفة الجديده',
                    hintStyle: TextStyle(fontSize: 14)),
              ),
              actions: [
                TextButton(onPressed: submitJobData, child: const Text('تعديل'))
              ],
            ));

    Future<String?> openspeciDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
              title: const Directionality(
                  textDirection: TextDirection.rtl, child: Text('التخصص')),
              content: TextField(
                controller: specliController,
                onSubmitted: (_) {
                  submitspecData();
                },
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: 'ادخل التخصص الجديد ',
                    hintStyle: TextStyle(fontSize: 14)),
              ),
              actions: [
                TextButton(
                    onPressed: submitspecData, child: const Text('تعديل'))
              ],
            ));

    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getUserData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state)  {
        },
        builder: (context, state) {
          var appCubit= AppCubit.get(context);
          var userData= appCubit.userData;
          if (userData != null) {
              firistname = userData.data!.firstName;
              email = userData.data!.email;
              speci = userData.data!.speciality;
              jop = userData.data!.role;
              location = userData.data!.workPlace;
              phone = userData.data!.phoneNumber;
          }
          return Scaffold(
            backgroundColor: const Color.fromRGBO(124, 110, 163, 0.7),
            appBar: AppBar(
              backgroundColor: mainColor,
              toolbarHeight: MediaQuery.of(context).size.height * 0.11,
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
                  onPressed: ()  {
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
            body: SingleChildScrollView(
              child: userData != null ? Column(
                children: [
                  if (state is DisasterLoadingUpdateProfileStates)
                    const Center(child: CircularProgressIndicator()),
                  Container(
                    color: const Color.fromRGBO(124, 110, 163, 0.7),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile_Screen()));
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
                                          ' تعديل الملف الشخصي',
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
                                        radius: 60,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, left: 8, right: 8, bottom: 11),
                                          child: FadeInImage.assetNetwork(
                                            placeholder: 'تظهر الصورة الشخصية هنا ..',
                                            image: userData!.data!.photoUser,
                                            fit: BoxFit.fill,
                                            width: 70,
                                            height: 70,
                                            imageErrorBuilder: (context, error, stackTrace) {
                                              return Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Tooltip(
                                                    message: 'Failed to load profile photo',
                                                    child: Image.asset('images/man.png',width: 80,height: 80,),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),

                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            String? newName = await openNameDialog();
                                            if (newName != null) {
                                              setState(() {
                                                userData!.data!.firstName = newName;
                                              });
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.mode_edit_outlined,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Text(
                                            userData!.data!.firstName,
                                            style: const TextStyle(
                                                color: CupertinoColors.activeBlue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22),
                                          ),
                                        ),
                                      ],
                                    ), //name
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          children: [
                                            const Text(
                                              'الوظيفة : ',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              userData!.data!.role,
                                              style: const TextStyle(
                                                color: CupertinoColors.activeBlue,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () async {
                                                String? neJop = await openJopDialog();
                                                if (neJop != null) {
                                                  setState(() {
                                                    userData!.data!.role = neJop;
                                                  });
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.mode_edit_outlined,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ), //jop
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          children: [
                                            const Text(
                                              'التخصص : ',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              userData!.data!.speciality,
                                              style: const TextStyle(
                                                color: CupertinoColors.activeBlue,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () async {
                                                String? neSpeci = await openspeciDialog();
                                                if (neSpeci != null) {
                                                  setState(() {
                                                    userData!.data!.speciality = neSpeci;
                                                  });
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.mode_edit_outlined,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ), //spec
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              String? neEmail = await openEmailDialog();
                                              if (neEmail != null) {
                                                setState(() {
                                                  userData!.data!.email = neEmail;
                                                });
                                              }

                                            },
                                            icon: const Icon(
                                              Icons.mode_edit_outlined,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            userData!.data!.email,
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
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              String? nePhone = await openPhoneDialog();
                                              if (nePhone != null) {
                                                setState(() {
                                                  userData!.data!.phoneNumber = nePhone;
                                                });
                                              }
                                            },
                                            icon: const Icon(
                                              Icons.mode_edit_outlined,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            userData!.data!.phoneNumber,
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
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          children: [
                                            const Text(
                                              'مكان العمل : ',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              userData!.data!.workPlace,
                                              style: const TextStyle(
                                                color: CupertinoColors.activeBlue,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () async {
                                                String? newLocation = await openLocationDialog();
                                                if (newLocation != null) {
                                                  setState(() {
                                                    userData!.data!.workPlace = newLocation;
                                                  });
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.mode_edit_outlined,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: SizedBox(
                                        width: 250,
                                        height: 65,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: mainColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(25),
                                              ),
                                            ),
                                            onPressed: () {
                                              AppCubit.get(context).UpdateUserData(
                                                name: nameController.text,
                                                email: emailController.text,
                                                phone: phoneController.text,
                                                role: jopController.text,
                                                secondName: 'ali',
                                                specility: specliController.text,
                                                workPlace: locationController.text,
                                              );
                                            },
                                            child: const Text(
                                              ' حفظ البيانات ',
                                              style: TextStyle(fontSize: 18),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ) : Center(child: CircularProgressIndicator())
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 400);
}
/*
Image.network(
                                          userData!.data!.photoUser,
                                          fit: BoxFit.fill,
                                          width: 60,
                                          height: 60,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const [
                                                Tooltip(
                                                  message:"ستظهر الصورة الشخصية هنا بمجرد تحميلها...",
                                                  child: Icon(
                                                    Icons.error_outline,
                                                    size: 24,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        )
 */