import 'package:disaster_app/screens/admin/admin_screen.dart';
import 'package:disaster_app/screens/login/login_screen.dart';
import 'package:disaster_app/screens/profile/profile_screen.dart';
import 'package:disaster_app/screens/posts/add_post/add_post_screen.dart';
import 'package:disaster_app/shared_preferences/cashe_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


selectedItemMenuButton(context,item){
  switch(item){
    case 1 :
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Profile_Screen()));
      break;
    case 2:
      Navigator.push(context, MaterialPageRoute(builder: (context) => AddPostScreen()));
      break;
    case 3 :
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const AdminScreen()));
      break;
    case 4 :
      buildLogOutDialog(context: context);
      break;
  }
}

Future<void> buildLogOutDialog({context}) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'الغاء ', style:TextStyle(color :Colors.cyan,
                  fontSize: 18,
                ),
            ),
              ),),
            TextButton(
              onPressed: () {
                SignOut(context);
              },
              child: const Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'تسجيل خروج  ', style:TextStyle(color :CupertinoColors.activeBlue,
                  fontSize: 18,

                ),
                ),
              ),
            ),
          ],
          title: Row(
            children: const [
               Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'تسجيل الخروج',
                  style: TextStyle(),
                ),
              )
            ],
          ),
          content: const Directionality(
              textDirection: TextDirection.rtl,
              child: Text('هل ترغب بالخروج ؟')),
        );
      });
}

void SignOut(context){
  Cashe_Helper.removeData(
    Key: 'token',
  ).then((value) => {
    if (value)
      {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const LoginPage())),
      }
  });
}





// Directionality(
//   textDirection: TextDirection.rtl,
//   child: Flex(
//     direction: Axis.horizontal,
//       children: const [
//         Flexible(
//           flex: 1,
//           child: Text(
//             'مدي اثر الحادث :',
//             style: TextStyle(
//                 fontSize: 10,
//                 color: CupertinoColors.activeBlue,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         Flexible(
//           flex: 2,
//           child: Text(
//             textAlign: TextAlign.start,
//             'هل تم الاعلان عن حاددث كبير ؟( نعم /لا - اذا كانت الاجابة لا , فقم باكمال رساله ETHANE  ',
//             style: TextStyle(
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//         ),
//       ],
//
//   ),
// ),
// const SizedBox(
//   height: 10,
// ),
// Directionality(
//   textDirection: TextDirection.rtl,
//   child: Flex(
//     direction: Axis.horizontal,
//       children: const [
//         Flexible(
//           flex: 1,
//           child: Text(
//             'تحديد الموقع بدقة :',
//             style: TextStyle(
//                 fontSize: 10,
//                 color: CupertinoColors.activeBlue,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         Flexible(
//           flex: 2,
//           child: Text(
//             'ما هو بالضبط الموقع او المنطقة الجغرافية للحادث ؟  ',
//             style: TextStyle(
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//         ),
//       ],
//
//   ),
// ),
// const SizedBox(
//   height: 10,
// ),
// Directionality(
//   textDirection: TextDirection.rtl,
//   child: Flex(
//     direction: Axis.horizontal,
//       children: const [
//         Flexible(
//           flex: 1,
//           child: Text(
//             'نوع الحادث :',
//             style: TextStyle(
//                 fontSize: 10,
//                 color: CupertinoColors.activeBlue,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         Flexible(
//           flex: 2,
//           child: Text(
//             'ما هو نوع الحادث ؟',
//             style: TextStyle(
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//         ),
//       ],
//
//   ),
// ),
// const SizedBox(
//   height: 10,
// ),
// Directionality(
//   textDirection: TextDirection.rtl,
//   child: Flex(
//     direction: Axis.horizontal,
//       children: const [
//         Flexible(
//           flex: 1,
//           child: Text(
//             'انواع الخطر المحتملة :',
//             style: TextStyle(
//                 fontSize: 10,
//                 color: CupertinoColors.activeBlue,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         Flexible(
//           flex: 2,
//           child: Text(
//             'ما هي الاخطار او الاخطار المحتملة التي يمكن تحديدها ؟',
//             style: TextStyle(
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//         ),
//       ],
//
//   ),
// ),
// const SizedBox(
//   height: 10,
// ),
// Directionality(
//   textDirection: TextDirection.rtl,
//   child: Flex(
//     direction: Axis.horizontal,
//       children: const [
//         Flexible(
//           flex: 1,
//           child: Text(
//             'طريقة الوصول للموقع :',
//             style: TextStyle(
//                 fontSize: 10,
//                 color: CupertinoColors.activeBlue,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         Flexible(
//           flex: 2,
//           child: Text(
//             'ما هي افضل طرق الوصول والخروج ؟',
//             style: TextStyle(
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//         ),
//       ],
//
//   ),
// ),
// const SizedBox(
//   height: 10,
// ),
// Directionality(
//   textDirection: TextDirection.rtl,
//   child: Flex(
//     direction: Axis.horizontal,
//     children: const [
//         Flexible(
//           flex: 1,
//           child: Text(
//             'عدد الضحايا :',
//             style: TextStyle(
//                 fontSize: 10,
//                 color: CupertinoColors.activeBlue,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         Flexible(
//           flex: 3,
//           child: Text(
//             'كم عدد الضحايا وما هي ظروفهم  ؟',
//             style: TextStyle(
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//         ),
//       ],
//
//   ),
// ),
// const SizedBox(
//   height: 10,
// ),
// Directionality(
//   textDirection: TextDirection.rtl,
//   child: Flex(
//     direction: Axis.horizontal,
//       children: const [
//         Flexible(
//           flex: 1,
//           child: Text(
//             'خدمات الطوارئ المطلوبة :',
//             style: TextStyle(
//                 fontSize: 10,
//                 color: CupertinoColors.activeBlue,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         Flexible(
//           flex: 2,
//           child: Text(
//             'ما هي , وعدد , اصول المستجيب في حالات الطوارئ والموظفين المطلوبين او الموجودين بالفعل علي الموقع ',
//             style: TextStyle(
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//         ),
//       ],
//
//   ),
// ),