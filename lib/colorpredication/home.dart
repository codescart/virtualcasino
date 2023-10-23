

import 'dart:async';



import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:virtualcasino/colorpredication/balance_recharge.dart';
import 'package:virtualcasino/colorpredication/becone_record.dart';
import 'package:virtualcasino/colorpredication/buttongridview2.dart';



import 'buttongridview.dart';


class colorpredicationhome extends StatefulWidget {
  const colorpredicationhome({Key? key}) : super(key: key);
  @override
  State<colorpredicationhome> createState() => _colorpredicationhomeState();
}
class _colorpredicationhomeState extends State<colorpredicationhome> {
  final CountdownController _controller =
  new CountdownController(autoStart: true);
 // final Duration timerTastoPremuto;
  final List<String> categoriesList = [
    "Join Green",
    "Join Violet",

    "Join",

  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // margin: EdgeInsets.only(left: 30,top: 20,bottom: 30,right: 30),
                  height:97.h,
                  width: 380.w,
                  color: Colors.teal,
                  child:Column(
                    children: [
                      SizedBox(height: 25.h),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text('Available balance: ₹ 8.40',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Padding(
                      padding: const EdgeInsets.only(left: 3.0,right: 3),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>balance()));
                              },
                              child: Card(
                                elevation: 5,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Container(

                                  height: 40.h,
                                  width: 100.w,
                                  child: Center(
                                    child: Text(
                                      'Recharge',
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 1.w,),
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0,right: 3),
                            child: Card(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Container(

                                height: 40.h,
                                width: 100.w,
                                child: Center(
                                  child: Text(
                                    'Read Rule',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
                Container(
                  height:height*0.06,
                  width:width,
                  color: Colors.grey.shade300,
                  child: Center(
                    child: Text(
                      'Parity',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.black),
                    ),
                  ),
                ),
                Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                 //     child:Image.asset(Assets.trophy,scale: 3,color: Colors.grey.shade600),
                   //   Icon(Icons.tag_rounded,color: Colors.grey,),
                    ),
                    SizedBox(width: 4.w,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text('Period',style: TextStyle(color: Colors.grey.shade700,fontSize: 15 ),),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                      child: Text('Count Down',style: TextStyle(color: Colors.grey.shade700,fontSize: 15 ),),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(

                      children: [

                        SizedBox(width: 4.w,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text('20230725347',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500 ),),
                        ),
                        Spacer(),
                        Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5,right: 15),
                            child: buildTime1()),
                        // button(),
                        // buttongridview(),
                        // becone(),
                        // myrecord(),
                      ],
                    ),
                   button(),
                  buttongridview(),
                   becone(),
           //  myrecord(),
                  ],
                ),
                // button(),
                // buttongridview(),
                // becone()




              ],




            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    final isRunning = timer1 == null ? false : timer1!.isActive;
    if (isRunning) {
      timer1!.cancel();
    }
    Navigator.of(context, rootNavigator: true).pop(context);
    return true;
  }

  static var countdownDuration1 = Duration(seconds: 02);

  Duration duration1 = Duration();
  Timer? timer1;
  bool countDown = true;
  bool countDown1 = true;

  @override
  void initState() {

    var hours1;
    var mints1;
    var secs1;
    hours1 = int.parse("10");
    mints1 = int.parse("00");
    secs1 = int.parse("00");
    countdownDuration1 =
        Duration(hours: hours1, minutes: mints1, seconds: secs1);
    startTimer1();
    reset1();
    super.initState();
  }

  void reset1() {
    if (countDown) {
      setState(() => duration1 = countdownDuration1);
    } else {
      setState(() => duration1 = Duration());
    }
  }


  void startTimer1() {
    timer1 = Timer.periodic(Duration(seconds: 1), (_) => addTime1());
  }


  void addTime1() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration1.inSeconds - addSeconds;
      if (seconds < 0) {
        timer1?.cancel();
      } else {
        duration1 = Duration(seconds: seconds);
      }
    });
  }



  Widget buildTime1() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final minutes = twoDigits(duration1.inMinutes.remainder(02));
    final seconds = twoDigits(duration1.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [

      buildTimeCard(time: minutes, header: 'MINUTES'),
      SizedBox(
        width: 8,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
            child: Text(
              time,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15),
            ),
          ),

        ],
      );
}
