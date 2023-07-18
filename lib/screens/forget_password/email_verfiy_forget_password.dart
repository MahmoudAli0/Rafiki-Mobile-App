import 'package:disaster_app/constants/colors.dart';
import 'package:disaster_app/screens/forget_password/new_password.dart';
import 'package:flutter/material.dart';

class VerfiyEmail extends StatelessWidget {


  const VerfiyEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var globalKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0.0,
        leading:InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.keyboard_backspace_outlined,)),
      ),
      body: Form(
        key: globalKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'إعادة تعيين كلمة المرور ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل بريدًا إلكترونيًا يحتوي على إرشادات لإعادة تعيين كلمة المرور الخاصة بك......',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'عنوان البريد الإلكتروني',
                    style: TextStyle(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'الايميل مطلوب';
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if(globalKey.currentState!.validate()){
                       // RafikiResetPasswordCubit.get(context).updatePassword(email: emailController.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateNewPassword()));
                      }
                    },
                    child: const Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        'أرسل الإرشادات',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
