import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class popup extends StatefulWidget {
final name;
final color;
popup({required this.name,required this.color});
  @override
  State<popup> createState() => _popupState();
}

class _popupState extends State<popup> {
  bool showvalue = false;
  @override
  Widget build(BuildContext context) {

    return  AlertDialog(

      backgroundColor: Colors.transparent,
      content: Container(
        color: Colors.white,
       height: 340.h,
        width:500.w,
        child: Column(
          children: [
Container(
      height: 50.h,
       width:400.w,

  color: widget.color,
      child: Padding(
padding:  EdgeInsets.only(left: 20,top: 20),
child: Text(widget.name,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22,color: Colors.white),),
      ),

    ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text('Contract Money'),
                ),
              ],
            ),
SizedBox(height: 10.h,),
Padding(
  padding: const EdgeInsets.only(left: 10,right: 10),
  child:   Card(

    elevation: 5,

    child:   Row(

      children: [

        Container(

          height: 50,

          width: 45,

         color: Colors.grey.shade400,

          child: Center(child: Text('10')),



        ),



        Container(

          height: 50,





  child: Center(



      child: Text(' 100    1000   1000',style: TextStyle(color: Colors.grey.shade400,fontSize: 17),)),





        ),



      ],



    ),

  ),
),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text('Number'),
                ),
              ],
            ),
            SizedBox(height: 5.h,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 3,
                    color: Colors.grey.shade200,
                    child: Container(
                     height: 40.h,
                      width: 65.w,
                     child: Center(child: Text('-',style: TextStyle(fontSize:35, ),)),
                    ),
                  ),
                  Card(
                    elevation: 3,
                    color: Colors.grey.shade200,
                    child: Container(
                      height: 40.h,
                      width: 65.w,
                      child: Center(child: Text('+',style: TextStyle(fontSize:35, ),)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text('Total Contract money is 10'),
                ),

              ],
            ),
            Row(

              children: [
                Container(


                  child: Checkbox(

                    checkColor: Colors.grey,

                    activeColor: Colors.black,

                    value: this.showvalue,

                    onChanged: (bool? value ){

                      setState(() {

                        this.showvalue = value!;
                        print(showvalue);

                      });

                    },

                  ),

                ),
                Padding(
                  padding:  EdgeInsets.only(right:5),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'I agree',
                          style: TextStyle(
                           color: Colors.grey,
                            fontSize: 15)
                      ),

                      TextSpan(
                          text: 'PRESALE RULE',
                          style: TextStyle(

                              fontSize: 17,
                              color: Colors.teal))
                    ]),
                  ),
                ),

              ],

            ),
SizedBox(height: 30,),
Padding(
  padding: const EdgeInsets.only(right: 15),
  child:   Row(

    mainAxisAlignment: MainAxisAlignment.end,


        children: [



      Text('CANCEL',style: TextStyle(fontSize: 15),),



  SizedBox(width: 13,),



  Text('CONFIRM',style: TextStyle(fontSize: 15,color: Colors.teal),),



        ],



      ),
),

          ],
        ),
      ),
    );
  }
}