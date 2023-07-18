import 'package:flutter/material.dart';
const mainColor = Color(0xFF4B4BEE);
const secondryColor = Color(0xFF2C107B);



bool isadmin=false;
bool isValid=false;
String token='';
/*
Scaffold(
          body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 40, 0, 166),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  // disasterwarningZy4 (32:176)
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(5, 0, 0, 71),
                    constraints: const BoxConstraints(
                      maxWidth: 195,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          color: Color(0xffffffff),
                        ),
                        children: [
                          TextSpan(
                            text: 'Disaster\n',
                            style: TextStyle(
                              fontFamily: 'Lobster',
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                              color: Color(0xff4b4bee),
                            ),
                          ),
                          TextSpan(
                            text: 'Warning',
                            style: TextStyle(
                              fontFamily: 'Lobster',
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  // logintoyouraccountnjL (40:182)
                  width: double.infinity,
                  height: 380,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle10wML (38:179)
                        left: 0,
                        top: 16,
                        right: 3,
                        child: Align(
                          child: SizedBox(
                            width: 340,
                            height: 364,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: const Color(0xff2b0f7b)),
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // logintoyouraccountSYz (32:180)
                        left: 9.5,
                        top: 0,
                        child: Container(
                          width: 234,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Color(0xffffffff),
                          ),
                          child: const Center(
                            child: Center(
                              child: Text(
                                'Log in to your account',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  color: Color(0xff2c107b),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // frame61XaS (38:181)
                        left: 20,
                        top: 40,
                        child: Container(
                          width: 300,
                          height: 326,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // frame60FWS (38:180)
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // email21Q (36:201)
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 20),
                                      width: double.infinity,
                                      height: 70,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            // rectangle9kCJ (36:200)
                                            left: 0,
                                            top: 20,
                                            child: Align(
                                              child: SizedBox(
                                                width: 300,
                                                height: 50,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xff2c107b)),
                                                    color:
                                                        const Color(0xffffffff),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x3f000000),
                                                        offset: Offset(0, 4),
                                                        blurRadius: 2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // frame54SL2 (34:189)
                                            left: 14,
                                            top: 0,
                                            child: Container(
                                              width: 66,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                color: Color(0xffffffff),
                                              ),
                                              child: const Center(
                                                child: Center(
                                                  child: Text(
                                                    'E-Mail',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.5,
                                                      color: Color(0xff2b0f7b),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // typeyouremailhere8Cr (34:196)
                                            left: 20,
                                            top: 38,
                                            child: Center(
                                              child: Align(
                                                child: SizedBox(
                                                  width: 400,
                                                  height: 20,
                                                  child: TextFormField(
                                                    decoration: const InputDecoration(
                                                        hintText:
                                                            'Type your E-mail here.....',
                                                        hintStyle: TextStyle(fontSize: 12),
                                                        border:
                                                            InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // password11k (36:202)
                                      width: double.infinity,
                                      height: 70,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            // rectangle9MrJ (36:204)
                                            left: 0,
                                            top: 20,
                                            child: Align(
                                              child: SizedBox(
                                                width: 300,
                                                height: 50,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xff2c107b)),
                                                    color:
                                                        const Color(0xffffffff),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x3f000000),
                                                        offset: Offset(0, 4),
                                                        blurRadius: 2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // frame543j8 (36:205)
                                            left: 14,
                                            top: 0,
                                            child: Container(
                                              width: 93,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                color: Color(0xffffffff),
                                              ),
                                              child: const Center(
                                                child: Center(
                                                  child: Text(
                                                    'Password',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.5,
                                                      color: Color(0xff2b0f7b),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                           Positioned(
                                            // typeyourpasswordhere8ka (36:208)
                                            left: 20,
                                            top: 38,
                                            child: Center(
                                              child: Align(
                                                child: SizedBox(
                                                  width: 400,
                                                  height: 20,
                                                  child: TextFormField(
                                                    decoration: const InputDecoration(
                                                      hintText:
                                                      'Type your password here.....',
                                                      hintStyle: TextStyle(fontSize: 12),
                                                      border:
                                                      InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroupxgmyvAe (RZcLxr32aXd92ZPujNXgMY)
                                padding:
                                    const EdgeInsets.fromLTRB(22, 14, 23, 0),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      // doyouforgetyourpasswordesL (38:175)
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 21),
                                        child: const Text(
                                          'Do you forget your password?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                            color: Color(0xff2b0f7b),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // frame24x7L (38:173)
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 24),
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff4b4bee),
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0x3f000000),
                                                offset: Offset(0, 4),
                                                blurRadius: 2,
                                              ),
                                            ],
                                          ),
                                          child:  Center(
                                            child: Center(
                                              child: InkWell(
                                                onTap: (){
                                                  print('hello');
                                                },
                                                child: const Text(
                                                  'Log in',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5,
                                                    color: Color(0xffffffff),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // frame59PTY (38:178)
                                      margin: const EdgeInsets.fromLTRB(
                                          38, 0, 37, 0),
                                      height: 30,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 35,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              Center(
                                                child: Center(
                                                  child: RichText(
                                                    textAlign: TextAlign.center,
                                                    text:  const TextSpan(
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                        height: 1.5,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                'Don’t Have an account? ',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.black)),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Sign Up',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  height: 1.5,
                                                  color:
                                                  Color(0xff2b0f7b),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ))





      ////////////////////////
      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 8),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: ' النوع',
                              suffixIcon: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  labelText: 'Gender',
                                  border: OutlineInputBorder(),
                                ),
                                value: selectedGender,
                                items: genderList.map((String gender) {
                                  return DropdownMenuItem<String>(
                                    value: gender,
                                    child: Text(gender),
                                  );
                                }).toList(),
                                onChanged: ( value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                              ),
                              labelStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight.w400,
                                height: 1.5,
                                color: CupertinoColors.activeBlue,
                              ),
                              hintText: 'اختر النوع',
                              hintStyle: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                            ),
                          ),
                        ),
                      ),









                      InkWell(
            onTap: (){
              setState(() {
                isClicked= !isClicked;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 8,right: 8),
              child: Card(
                color: Colors.white,
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(

                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20)
                      ),
                      child: ListTile(
                        title: Text('نوع المنشور ',style: TextStyle(color: CupertinoColors.activeBlue),),
                        trailing: Icon(Icons.arrow_drop_down_outlined,color: CupertinoColors.activeBlue,),
                      ),
                    )),
              ),
            ),
          ),
 */