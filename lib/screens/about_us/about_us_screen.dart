import 'package:flutter/material.dart';

class about_usScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: const [
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    'images/man.png',
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Dr/ Hanfy Khroub',
                style: TextStyle(fontSize: 16, color: Colors.blue,fontWeight: FontWeight.bold),
              ),
              Text(
                'UI UX Team',
                style: TextStyle(),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ],
      ),
    );
  }
}