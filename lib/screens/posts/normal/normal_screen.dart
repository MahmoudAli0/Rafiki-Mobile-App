import 'dart:async';
import 'dart:io';
import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/constants/methods.dart';
import 'package:disaster_app/screens/posts/normal/cubit/normal_cubit.dart';
import 'package:disaster_app/screens/posts/normal/states/normal_states.dart';
import 'package:disaster_app/shared_preferences/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class NormalScreen extends StatefulWidget {
  const NormalScreen({Key? key}) : super(key: key);

  @override
  State<NormalScreen> createState() => _NormalScreenState();
}

class _NormalScreenState extends State<NormalScreen> {
  final ImagePicker _picker = ImagePicker();
  File? PersonalImageFile;
  var personalPhotoControllerForDesign = 'اضف صورة';
  String currentTime = '';
  late String formattedDate;
  var textAreaControlleer =TextEditingController();
  final formKey =GlobalKey<FormState>();
bool isAdmin=false;

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
  void dispose() {
    textAreaControlleer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (BuildContext context) => NormalCubit(),
      child: BlocConsumer<NormalCubit,NormalStates>(
        listener: (context,state){
          if(state is NormalSucessState){
            if(state.normalPost!.stauts){
              Fluttertoast.showToast(
                  msg: 'تم اضافة التقرير بنجاح ...',
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16,
                  gravity: ToastGravity.BOTTOM);
            }else{
              Fluttertoast.showToast(
                  msg: 'هناك مشكلة ما يرجي المحاولة لاحقا ....',
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16,
                  gravity: ToastGravity.BOTTOM);
            }
          }
        },
        builder: (context,state){
          return Form(
            key: formKey,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color.fromRGBO(124, 110, 163, 0.7),
              appBar: AppBar(
                backgroundColor: mainColor,
                toolbarHeight: MediaQuery.of(context).size.height * 0.10,
                elevation: 0.0,
                leading: IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                  icon: const Icon(Icons.arrow_back),),
                title: const Text('Disaster Warning',style: TextStyle(color: Colors.white,fontSize: 18,),),
                actions: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.refresh,color: Colors.white,size: 22,),),
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
              body: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            const Text(
                              'العادي',
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
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Container(
                                    width: 100,
                                    height: 0.5,
                                    color: CupertinoColors.activeBlue,
                                  ),
                                ),
                                const Text(
                                  '.',
                                  style: TextStyle(color: CupertinoColors.activeBlue),
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
                                    child: TextFormField(
                                      controller: textAreaControlleer,
                                      maxLines: 8,
                                      validator: (value){
                                        if(value!.isEmpty)
                                        {
                                          return 'مدي اثر الحادث مطلوب';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'الاعلان عن الحادث (تقرير)',
                                        hintText:
                                        'اكتب هنا بطريقة مفصلة عن الوضع الحالي.......',
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                        labelStyle: const TextStyle(),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ),
                                ),
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ListTile(
                                      title: Row(
                                        children: const [
                                          Text(
                                            'اضف روابط ',
                                            style: TextStyle(
                                                color: CupertinoColors.activeBlue),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Icon(
                                            Icons.add_link_outlined,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                        ],
                                      ),
                                      trailing: Container(
                                          width: 181,
                                          height: 25,
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                                contentPadding: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                hintText: 'اضف الروابط هنا',
                                                hintStyle: TextStyle(fontSize: 10),
                                                border: OutlineInputBorder()),
                                          )),
                                    )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ListTile(
                                      title: Row(
                                        children: const [
                                          Text(
                                            'اضف صوره ',
                                            style: TextStyle(
                                                color: CupertinoColors.activeBlue),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Icon(
                                            Icons.add_photo_alternate_outlined,
                                            color: CupertinoColors.activeBlue,
                                          ),
                                        ],
                                      ),
                                      trailing: Container(
                                          width: 181,
                                          color: Colors.grey[300],
                                          child: InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (builder) =>
                                                      bottomSheetManagment());
                                            },
                                            child:  Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: Text(
                                                personalPhotoControllerForDesign,
                                                style:
                                                const TextStyle(color: Colors.lightBlue,fontSize: 12),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                width: 250,
                                height: 50,
                                child: state is! NormalLoadinState ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color.fromRGBO(75, 75, 238, 0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          NormalCubit.get(context).SendPost(
                              photo: PersonalImageFile,
                              date: formattedDate,
                              time: currentTime,
                              textArea: textAreaControlleer.text);
                          textAreaControlleer.clear();
                          personalPhotoControllerForDesign='';

                        }
                      },
                      child: const Text('انشر التقرير')) :  Center(child: CircularProgressIndicator(),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
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
                    takeNormalPhoto(ImageSource.camera);
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
                  takeNormalPhoto(ImageSource.gallery);
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
  void takeNormalPhoto(ImageSource source) async {
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
}
