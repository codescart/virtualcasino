

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class becone extends StatefulWidget {
  const becone({Key? key}) : super(key: key);

  @override
  State<becone> createState() => _beconeState();
}

class _beconeState extends State<becone> {
  final List<BeRecord> _listdata = [
    BeRecord('12456781', '25123', 0),
    BeRecord('12456782', '25253', 1),
    BeRecord('12456783', '25343', 2),
    BeRecord('12456784', '25121', 3),
    BeRecord('12456785', '25343', 4),
    BeRecord('12456786', '25676', 5),
    BeRecord('12456787', '25343', 6),
    BeRecord('12456788', '25121', 7),
    BeRecord('12456789', '25343', 8),
    BeRecord('12456790', '25676', 9),
  ];
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.h,
        ),
        Align(
          alignment: Alignment.topCenter,
        //  child:Image.asset(Assets.trophy,scale: 2,color: Colors.grey.shade600,),
        ),
        SizedBox(height: 5.h,),
        Text('Parity Record'),
        SizedBox(
          height: 5.h,
        ),
        Divider(
          color: Colors.teal,
          thickness: 2,
        ),
        SizedBox(height: 5.h,),
        Padding(
          padding: const EdgeInsets.only(right: 15,left: 15),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Text(
              "Parity",
              style: TextStyle(
                color: Colors.grey.shade500,fontWeight: FontWeight.w500
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text("Price",
                  style: TextStyle(
                    color:Colors.grey.shade500,fontWeight: FontWeight.w500
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text("Number",
                  style: TextStyle(
                    color: Colors.grey.shade500,fontWeight: FontWeight.w500,
                  )),
            ),
            Text("Result",
                style: TextStyle(
                  color: Colors.grey.shade500,fontWeight: FontWeight.w500
                )),
          ]),
        ),
        SizedBox(height: 10.h,),
        Divider(),
        Container(
           height: height * 0.46,
            width: double.infinity.w,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                itemCount: _listdata.length,
                itemBuilder: (BuildContext context, int index) {
                // print( _listdata.length);
                bool rcbn=false;
                if(_listdata[index].number==0){
                  // setState(() {
                    rcbn=true;
                  // });
                }else if(_listdata[index].number==5){
                  // setState(() {
                    rcbn=true;
                  // });
                }else{
                  rcbn=false;
                }
                  return Padding(
                    padding: const EdgeInsets.only(left: 10,right:10 ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _listdata[index].period,
                              style: TextStyle(
                                color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(_listdata[index].prise,
                                style: TextStyle(
                                  color: Colors.black,fontSize: 13,fontWeight: FontWeight.w500
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(_listdata[index].number.toString(),
                                  style: TextStyle(
                                  //  color: Colors.black,
                                      fontSize: 15, color:_listdata[index].number.isEven?Color(0xff4caf50):Color(0xfff44336),
                                  )),
                            ),
                            rcbn==false?
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: _listdata[index].number.isEven?Color(0xff4caf50):Color(0xfff44336),
                              ),
                            ):
                            Column(

                              children: [
                                Row(


                                  children: [
                                    // Color(0xff9c27b0),Color(0xff4caf50)Color(0xfff44336)

                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor:_listdata[index].number.isEven?Color(0xff4caf50):Color(0xfff44336),
                                    ),
                                    SizedBox(width: 4,),
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Color(0xff9c27b0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      Divider(),

                      ],
                    ),
                  );
                })),

      Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Text('1-10 of 1514',style: TextStyle(fontSize: 15,color: Colors.grey.shade400),),
SizedBox(width: 10.w,),
Padding(
  padding: const EdgeInsets.only(right: 10),
  child:   Text('View all',style: TextStyle(fontSize: 16,color: Color(0xff4caf50)),),
)
            ],
          ),
      ),
        Divider(
          color: Colors.grey,
          thickness: 1,
        ),


      ],
    );
  }
}

class BeRecord {
  final String period;
  final String prise;
  final int number;
  // final Color color;
  BeRecord(this.period, this.prise, this.number);
}
