import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {

 final String title;
 final Widget leading;
 final Widget titleWidget;

  const AppBarWidget({super.key,  this.title='', required this.leading, required this.titleWidget});


  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size(double .infinity,80);
}
