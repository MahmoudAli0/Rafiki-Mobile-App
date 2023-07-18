

import 'dart:async';

import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/constants/methods.dart';
import 'package:disaster_app/models/methane_all_comments.dart';
import 'package:disaster_app/screens/posts/comments/cubit/send_coment_mathane_cubit.dart';
import 'package:disaster_app/screens/posts/comments/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPage extends StatefulWidget {
  final String postId;

   CommentPage({super.key, required this.postId});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  int commentsNumber=20;

  var commentController =TextEditingController();
  bool isAdmin=false;
  String currentTime = '';
  late String formattedDate;
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => SendMataneComment()..getMathaneCommentsData(postId: widget.postId),
      child: BlocConsumer<SendMataneComment,MathaneSendCommentStates>(
       listener: (context,state){
         /*
         if(state is MathaneSendCommentSucessState){
           if(state.mathaneSendComment!.status){
             Fluttertoast.showToast(
                 msg: 'تم اضافه الكومنت بنجاح ',
                 toastLength: Toast.LENGTH_LONG,
                 timeInSecForIosWeb: 5,
                 backgroundColor: Colors.red,
                 textColor: Colors.white,
                 fontSize: 16,
                 gravity: ToastGravity.BOTTOM);
           }else{
             Fluttertoast.showToast(
                 msg: 'لم يتم  اضافه الكومنت بنجاح ',
                 toastLength: Toast.LENGTH_LONG,
                 timeInSecForIosWeb: 5,
                 backgroundColor: Colors.red,
                 textColor: Colors.white,
                 fontSize: 16,
                 gravity: ToastGravity.BOTTOM);
           }
         }
          */
       },
        builder: (context,state){
         return Scaffold(
           appBar: AppBar(
             backgroundColor: mainColor,
             toolbarHeight: MediaQuery
                 .of(context)
                 .size
                 .height * 0.10,
             elevation: 0.0,
             title: const Directionality(
               textDirection: TextDirection.rtl,
               child: Text('التعليقات ',
                 style: TextStyle(color: Colors.white, fontSize: 18,),),
             ),
             actions: [
               IconButton(onPressed: () {
                 SendMataneComment.get(context).getMathaneCommentsData(postId: widget.postId);
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
           body: Column(
             children: [
               Expanded(child: buildCommentsGrid(context)),
               const Divider(),
               ListTile(
                 title: TextFormField(
                   controller: commentController,
                   validator: (value){
                     if(value!.isEmpty){
                       return ;
                     }
                     return null;
                   },
                   decoration: InputDecoration(
                     hintText: '....ادخل التعليق الخاص بك',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                     ),
                   ),
                 ),
                 trailing: TextButton(onPressed: (){
                   SendMataneComment.get(context).SendComment(comment: commentController.text, postId: widget.postId);
                   commentController.clear();
                 },child: const Text('ارسال'),),
               ),
             ],
           ),
         );
        },
      ),
    );
  }

  Widget buildCommentsGrid(BuildContext context) {
    final comments = SendMataneComment.get(context).allMethaneComments?.data?.comments;
    final commentsN = SendMataneComment.get(context).allMethaneComments?.result;
    if (comments != null) {
      return ListView.builder(
        itemCount: commentsN,
        itemBuilder: (context, index) => buildComment(comments[index]),
      );
    } else {
      return Center(
        child:commentsN == 0
            ? const Text('No comments yet')
            : const CircularProgressIndicator(),
      );
    }
  }

  Widget buildComment(Comments comment) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Card(
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text(comment.userId!.firstName +" "+ comment.userId!.lastName, style: const TextStyle(fontWeight: FontWeight.w400)),
          subtitle: Text(comment.comment),
        ),
      ),
    );
  }
}
