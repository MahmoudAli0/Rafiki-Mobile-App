
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Befor_Approved  extends StatelessWidget {

  const Befor_Approved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(

      child: WillPopScope(

        onWillPop: () async {
         exit(0);
        },
        child: Scaffold(

          body: Column(
            children: [
              Center(
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const [
                      Icon(CupertinoIcons.checkmark_circle_fill,color: Colors.white,),
                      SizedBox(height: 5,),
                      Directionality(
                        textDirection: TextDirection.rtl,
                          child: Text('تم انشاء الحساب بنجاح ',style: TextStyle(color: Colors.white,fontSize: 20),)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Directionality(textDirection: TextDirection.rtl, child: Text(
                  'برجاء الانتظار حتي يتم مراجعة البيانات من قبل الادمن ..',
                  style: TextStyle(fontSize: 22,fontWeight: FontWeight.w200),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
