import 'dart:io';
import 'package:disaster_app/screens/about_us/about_us_screen.dart';
import 'package:disaster_app/screens/login/login_screen.dart';
import 'package:disaster_app/screens/register/register_cubit/reg_cubit.dart';
import 'package:disaster_app/screens/register/register_states/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ImagePicker _picker = ImagePicker();
  File? PersonalImageFile;
  File? AffiarImageFile;
  File? image;
  List<String> genderList2 = ["انثي", 'ذكر'];
  List<String> spelizationList = ["اداري", 'طبيب'];
  var genderValue = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? selectedGender;
  var personalPhotoControllerForDesign = 'لا يوجد ';
  var photoControllerForApi = 'لا يوجد ';
  var managementPhotoFormData;
  var personalPhotoFormData;
  var mangePhotoControllerForDesign = 'لا يوجد ';
  var mangephotoControllerForApi = 'لا يوجد ';
  var firstNameController = TextEditingController();
  var secondNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var jopController = TextEditingController();
  var speciController = TextEditingController();
  var locationController = TextEditingController();
  String? selectedSpeslization;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DisasterRegisterCubit(),
      child: BlocConsumer<DisasterRegisterCubit, DisasterRegisterStates>(
        listener: (context, state) {
          if (state is DisasterRegisterSucessStates) {
            if (state.userRegisterData!.status) {
              Fluttertoast.showToast(
                      msg: state.userRegisterData!.message,
                      toastLength: Toast.LENGTH_LONG,
                      timeInSecForIosWeb: 5,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16,
                      gravity: ToastGravity.BOTTOM)
                  .then((value) => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const LoginPage())));
            } else
            {
              Fluttertoast.showToast(
                  msg: state.userRegisterData!.message,
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
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0.0,
                leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                      size: 18,
                    )),
                actions: [
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => about_usScreen()));
                  }, icon: const Icon(Icons.help,color: Colors.blue,))
                ],
              ),
              body: LayoutBuilder(
                builder: (context, constraints) {
                  final screenWidth = constraints.maxWidth;
                  final screenHeight = constraints.maxHeight;
                  return Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Disaster',
                                style: TextStyle(
                                  fontFamily: 'Lobster',
                                  fontSize: screenWidth * 0.11,
                                  fontWeight: FontWeight.w400,
                                  height: 1.25,
                                  color: const Color(0xff4b4bee),
                                ),
                              ),
                            ),
                            Text(
                              'Warning',
                              style: TextStyle(
                                fontFamily: 'Lobster',
                                fontSize: screenWidth * 0.11,
                                fontWeight: FontWeight.w400,
                                height: 1.25,
                                color: const Color(0xff000000),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    ' انشيء حسابك',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                      color: const Color(0xff2c107b),
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            Container(
                              padding: const EdgeInsets.all(6),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0XFF2C107B),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                            width: screenWidth * 0.4,
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: TextFormField(
                                                controller:
                                                    secondNameController,
                                                validator: (secondname) {
                                                  if (secondname!.isEmpty) {
                                                    return 'الاسم الثاني مطلوب ';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  labelText: 'الاسم الثاني',
                                                  labelStyle: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.05,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5,
                                                    color: CupertinoColors
                                                        .activeBlue,
                                                  ),
                                                  hintText: 'الاسم الاول',
                                                  hintStyle: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.03,
                                                      color: Colors.grey),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                ),
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                            width: screenWidth * 0.4,
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: TextFormField(
                                                controller: firstNameController,
                                                validator: (firstname) {
                                                  if (firstname!.isEmpty) {
                                                    return 'الاسم الاول مطلوب';
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                    labelText: 'الاسم الاول',
                                                    labelStyle: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.05,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.5,
                                                      color: CupertinoColors
                                                          .activeBlue,
                                                    ),
                                                    hintStyle: TextStyle(
                                                        fontSize:
                                                            screenWidth * 0.03,
                                                        color: Colors.grey),
                                                    hintText: 'الاسم الثاني',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15))),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 8, right: 8, bottom: 8),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: emailController,
                                        validator: (emailvalue) {
                                          if (emailvalue!.isEmpty) {
                                            return 'الايميل مطلوب';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'حساب الايميل',
                                          labelStyle: TextStyle(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                          hintText: 'الاسم الاول',
                                          hintStyle: TextStyle(
                                              fontSize: screenWidth * 0.03,
                                              color: Colors.grey),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: passwordController,
                                        validator: (pass) {
                                          if (pass!.isEmpty) {
                                            return 'كلمه المرور مطلوبة';
                                          } else if (pass.length < 6) {
                                            return 'كلمه المرور يجب الا تقل عن ست حروف او ارقام';
                                          }
                                          return null;
                                        },
                                        obscureText:
                                            DisasterRegisterCubit.get(context)
                                                .passwordHidden,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                                DisasterRegisterCubit.get(
                                                        context)
                                                    .sufix),
                                            onPressed: () {
                                              DisasterRegisterCubit.get(context)
                                                  .changePasswordVis();
                                            },
                                          ),
                                          labelText: 'كلمه المرور',
                                          labelStyle: TextStyle(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                          hintText: 'ادخل كلمه مرور قوية',
                                          hintStyle: TextStyle(
                                              fontSize: screenWidth * 0.03,
                                              color: Colors.grey),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        obscureText:
                                            DisasterRegisterCubit.get(context)
                                                .passwordHidden,
                                        controller: confirmPasswordController,
                                        validator: (confirmpass) {
                                          if (confirmpass!.isEmpty) {
                                            return 'اعادة كتابة كلمة المرور مطلوبة ';
                                          } else if (confirmpass.length < 6) {
                                            return 'اعادة كتابة كلمة المرور يجب ان لا تقل عن ست حروف او ارقام';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'اعد اخال كلمه المرور',
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                                DisasterRegisterCubit.get(
                                                        context)
                                                    .sufix),
                                            onPressed: () {
                                              DisasterRegisterCubit.get(context)
                                                  .changePasswordVis();
                                            },
                                          ),
                                          labelStyle: TextStyle(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                          hintText: 'اعد اخال كلمه المرور',
                                          hintStyle: TextStyle(
                                              fontSize: screenWidth * 0.03,
                                              color: Colors.grey),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: phoneController,
                                        validator: (phonevalue) {
                                          if (phonevalue!.isEmpty) {
                                            return 'رقم الهاتف مطلوب';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: ' الهاتف',
                                          labelStyle: TextStyle(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                          hintText: ' رقم الهاتف',
                                          hintStyle: TextStyle(
                                              fontSize: screenWidth * 0.03,
                                              color: Colors.grey),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          labelText: 'الوظيفة',
                                          labelStyle: TextStyle(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                        value: selectedSpeslization,
                                        items:
                                            spelizationList.map((String spe) {
                                          return DropdownMenuItem<String>(
                                            value: spe,
                                            child: Text(spe),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedSpeslization = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: speciController,
                                        validator: (spvalue) {
                                          if (spvalue!.isEmpty) {
                                            return 'التخصص مطلوب';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: ' التخصص',
                                          labelStyle: TextStyle(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                          hintText: 'اكتب تخصصك',
                                          hintStyle: TextStyle(
                                              fontSize: screenWidth * 0.03,
                                              color: Colors.grey),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: TextFormField(
                                        controller: locationController,
                                        validator: (locvalue) {
                                          if (locvalue!.isEmpty) {
                                            return 'مكان العمل مطلوب';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: ' مكان العمل',
                                          labelStyle: TextStyle(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                          hintText: ' اكتب مكان العمل',
                                          hintStyle: TextStyle(
                                              fontSize: screenWidth * 0.03,
                                              color: Colors.grey),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, bottom: 8),
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: DropdownButtonFormField<String>(
                                        validator: (type) {
                                          if (type == null || type.isEmpty) {
                                            return 'النوع مطلوب';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'النوع',
                                          labelStyle: TextStyle(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        value: selectedGender,
                                        items: genderList2
                                            .map<DropdownMenuItem<String>>(
                                                (String gender) {
                                          return DropdownMenuItem<String>(
                                            value: gender,
                                            child: Text(gender),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGender = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Text(
                                            'الصورة الشخصية ',
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5,
                                              color: CupertinoColors.activeBlue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        builder: (builder) =>
                                                            bottomSheetPersonal());
                                                  },
                                                  icon: const Icon(
                                                    Icons.file_open_rounded,
                                                    color: CupertinoColors
                                                        .activeBlue,
                                                  )),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Expanded(
                                                  child: Text(
                                                    personalPhotoControllerForDesign,
                                                    maxLines: 10,
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Container(
                                                    color: Colors.lightBlue,
                                                    child: InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                              context: context,
                                                              builder: (builder) =>
                                                                  bottomSheetPersonal());
                                                        },
                                                        child: const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child:
                                                              Text('اختر صورة'),
                                                        ))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.03,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Text(
                                            'موافقة معتمدة من المؤسسة(ملف) ',
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.05,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5,
                                              color: CupertinoColors.activeBlue,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        builder: (builder) =>
                                                            bottomSheetManagment());
                                                  },
                                                  icon: const Icon(
                                                    Icons.file_open_rounded,
                                                    color: CupertinoColors
                                                        .activeBlue,
                                                  )),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Expanded(
                                                  child: Text(
                                                    mangePhotoControllerForDesign,
                                                    maxLines: 10,
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Directionality(
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: Container(
                                                    color: Colors.lightBlue,
                                                    child: InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                              context: context,
                                                              builder: (builder) =>
                                                                  bottomSheetManagment());
                                                        },
                                                        child: const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child:
                                                              Text('اختر صورة'),
                                                        ))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.04,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 24),
                                      width: screenWidth * 0.7,
                                      height: screenHeight * 0.08,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff4b4bee),
                                        borderRadius: BorderRadius.circular(40),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x3f000000),
                                            offset: Offset(0, 4),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: state is! DisasterRegisterLoadingStates ? ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            backgroundColor:
                                                const Color(0XFF4B4BEE),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            )),
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            DisasterRegisterCubit.get(context)
                                                .userRegister(
                                                    firstName: firstNameController.text,
                                                    lastName: secondNameController.text,
                                                    email: emailController.text,
                                                    password: passwordController.text,
                                                    confirmPassword:
                                                    confirmPasswordController.text,
                                                    gender: selectedGender!,
                                                    speciality: speciController.text,
                                                    role: selectedSpeslization!,
                                                    photoUser: PersonalImageFile,
                                                    photoAffair: AffiarImageFile,
                                                    phoneNumber: phoneController.text,
                                                    workPlace: locationController.text);
                                            // userRegister(firstName: firstNameController.text, lastName: secondNameController.text, email: emailController.text, password: passwordController.text, confirmPassword: confirmPasswordController.text, gender: selectedGender!, speciality: speciController.text, role: selectedSpeslization!, photoUser: PersonalImageFile, photoAffair: AffiarImageFile, phoneNumber: phoneController.text, workPlace: locationController.text);
                                          }
                                        },
                                        child: Text(
                                          'سجل حسابك',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
                                      ): const Center(child: CircularProgressIndicator(),)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget bottomSheetPersonal() {
    return Container(
      height: 105,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              'اختار صورة  ',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF4B4BEE),
                  ),
                  onPressed: () {
                    takePersonalPhoto(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text('الكاميرا'))),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF4B4BEE),
                ),
                onPressed: () {
                  takePersonalPhoto(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text('المعرض '),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomSheetManagment() {
    return Container(
      height: 105,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              'اختار صورة  ',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF4B4BEE),
                  ),
                  onPressed: () {
                    takeManagementPhoto(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text('الكاميرا'))),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF4B4BEE),
                ),
                onPressed: () {
                  takeManagementPhoto(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text('المعرض '),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void takePersonalPhoto(ImageSource source) async {
    final pickedPersonalFile = await _picker.pickImage(source: source);
    if (pickedPersonalFile != null) {
      setState(() {
        if (PersonalImageFile == null) {
          PersonalImageFile = File(pickedPersonalFile.path);
          setState(() {
            personalPhotoControllerForDesign = pickedPersonalFile.name;
          });
        }
      });
    }
  }

  void takeManagementPhoto(ImageSource source) async {
    final pickedAffiarFile =
        await _picker.pickImage(source: source, imageQuality: 80);
    print(pickedAffiarFile!.path);
    if (pickedAffiarFile != null) {
      setState(() {
        if (AffiarImageFile == null) {
          AffiarImageFile = File(pickedAffiarFile.path);
          setState(() {
            mangePhotoControllerForDesign = pickedAffiarFile.name;
          });
        }
      });
    }
  }



// void userRegister({
//   required String firstName,
//   required String lastName,
//   required String email,
//   required String password,
//   required String confirmPassword,
//   required String gender,
//   required String speciality,
//   required String role,
//   required File? photoUser,
//   required File? photoAffair,
//   required String phoneNumber,
//   required String workPlace,
// }) async {
//   print('hello from register');
//   // emit(DisasterRegisterLoadingStates());
//
//   final url = Uri.parse('https://projectwebadvanced.onrender.com/user/signUp');
//
//   final request = http.MultipartRequest('POST', url);
//
//   request.fields['firstName'] = firstName;
//   request.fields['lastName'] = lastName;
//   request.fields['email'] = email;
//   request.fields['password'] = password;
//   request.fields['confirmPassword'] = confirmPassword;
//   request.fields['gender'] = gender;
//   request.fields['speciality'] = speciality;
//   request.fields['role'] = role;
//   request.fields['phoneNumber'] = phoneNumber;
//   request.fields['workPlace'] = workPlace;
//
//   if (photoUser != null) {
//     final photoUserBytes = await photoUser.readAsBytes();
//     request.files.add(
//       http.MultipartFile.fromBytes(
//         'photoUser',
//         photoUserBytes,
//         filename: 'photo_user.jpg',
//       ),
//     );
//   }
//
//   if (photoAffair != null) {
//     final photoAffairBytes = await photoAffair.readAsBytes();
//     request.files.add(
//       http.MultipartFile.fromBytes(
//         'photoAffair',
//         photoAffairBytes,
//         filename: 'photo_affair.jpg',
//       ),
//     );
//   }
//
//   try {
//     final response = await http.Response.fromStream(await request.send());
//     print(response.body);
//
//     // Handle the response data as needed
//   } catch (error) {
//     print(error.toString());
//     // Handle the error as needed
//   }
// }
}
