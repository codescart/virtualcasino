import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualcasino/HomeDirectory/NewHome.dart';
import 'package:http/http.dart' as http;
import 'package:virtualcasino/Login_directory/Otp.dart';
import 'package:virtualcasino/Login_directory/SSighnup.dart';
import 'package:virtualcasino/constant/apihelper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  final AudioCache _player = AudioCache();

  FocusNode focusNode = FocusNode();
  @override
  sound()async{
    final prefs = await SharedPreferences.getInstance();
    final soundsl= await prefs.getBool('sounds')??false;
    soundsl ==false?print('ok'):
    await _player.play('audio/click_sound.mp3');
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                    image: AssetImage("assets/home/loginbg.png",)
                )
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h,),
              Center(
                child: Container(
                    height: 50.h,

                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/home/buttonappbarbg.png",)
                        )
                    ),

                    padding:  EdgeInsets.only(left: 36.0.r, right: 36.0),
                    child:  Center(
                      child: IntlPhoneField(
                        disableLengthCheck: true,

                        controller: phoneController,
                        focusNode: focusNode,
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(color: Colors.white),
                        cursorColor: const Color(0xFF075E54),
                        decoration: InputDecoration(
                          counterText: "",
                          contentPadding: const EdgeInsets.only(bottom: 13.0),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.white, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.white, width: 1),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Color(0xFFF65054)),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(color: Color(0xFFF65054)),
                          ),
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15,
                          ),
                        ),
                        languageCode: "IN",
                        initialCountryCode: 'IN',
                        dropdownIcon: Icon(Icons.arrow_drop_down_rounded,color: Colors.white,),
                        dropdownTextStyle: (TextStyle(color: Colors.white)),
                         dropdownIconPosition: IconPosition.trailing,
                         onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                        onCountryChanged: (country) {
                          print('Country changed to: ' + country.name);
                        },
                      ),
                    ),

                ),
              ),
              SizedBox(height: 30.h,),
              InkWell(
                onTap: (){
                  sound();
                  login(phoneController.text);
                },
                child: Container(
                    decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.circular(5),
                      // color: Colors.green,

                    ),
                    child:Container(
                      height: 30.h,
                      decoration: BoxDecoration(

                          image: DecorationImage(
                            fit: BoxFit.fill,
                              image: AssetImage("assets/home/btn_sure.png",)
                          )
                      ),
                      width: 150.w,
                      child:Center(
                        child: Text('Get Otp',
                          style:  GoogleFonts.playfairDisplay( textStyle:TextStyle(
                            fontSize: 20.sp,fontWeight: FontWeight.w900,color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ),
              ),)
            ],
          )
        ],

      ),
    );
  }
  login(String mobile)async {
    final response = await http.post(
      Uri.parse(
          Apiconstant.baseurl + "userlogin"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "mobile":mobile,
      }),
    );
    final data = jsonDecode(response.body);
    print(data);
    if (data['error'] == "200") {

      final prefs = await SharedPreferences.getInstance();
      final key = 'user_id';
      final userid = data['id']['id'] ;
      prefs.setString(key, userid);
      print("sssss");



      print("user_id Printed");
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Otp(mobile:mobile,status: "200")));

      print(" login SucessFully");
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Otp(mobile:mobile,status: "400")));

      print("not regisdterd");
    }
  }


}