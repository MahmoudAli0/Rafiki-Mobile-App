import 'package:disaster_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0.0,
        title: const Directionality(
            textDirection: TextDirection.rtl, child: Text('رجوع')),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.keyboard_backspace_outlined,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'إنشاء كلمة مرور جديدة ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                    //textDirection: TextDirection.rtl,
                    // textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Expanded(
                    child: Text(
                      'يجب أن تكون كلمة مرورك مختلفة عن كلمات المرور السابقة المستخدمة..... ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text('كلمة المرور'),
                ),
              ],
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffix: Icon(
                      Icons.visibility,
                      color: mainColor,
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text('تأكيد كلمة المرور'),
                ),
              ],
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    suffix: Icon(
                      Icons.visibility,
                      color: mainColor,
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
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
                  onPressed: () {},
                  child: const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      'إعادة تعيين كلمة المرور',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
