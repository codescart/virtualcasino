

import 'package:flutter/material.dart';
import 'package:virtualcasino/colorpredication/selectpopup.dart';
class buttongridview extends StatefulWidget {
  const buttongridview({Key? key}) : super(key: key);

  @override
  State<buttongridview> createState() => _buttongridviewState();
}

class _buttongridviewState extends State<buttongridview> {
  final List<BeRecord> _listdata = [
    BeRecord('0', Color(0xff9c27b0),Color(0xfff44336)),
    BeRecord('1', Color(0xff4caf50),Color(0xff4caf50)),
    BeRecord('2', Color(0xfff44336),Color(0xfff44336)),
    BeRecord('3', Color(0xff4caf50),Color(0xff4caf50)),
    BeRecord( '4', Color(0xfff44336),Color(0xfff44336)),
    BeRecord('5', Color(0xff9c27b0),Color(0xff4caf50)),
    BeRecord('6', Color(0xfff44336),Color(0xfff44336)),
    BeRecord('7', Color(0xff4caf50),Color(0xff4caf50)),
    BeRecord('8', Color(0xfff44336),Color(0xfff44336)),
    BeRecord('9', Color(0xff4caf50),Color(0xff4caf50)),
  ];

  @override
  Widget build(BuildContext context) {
    return
    GridView.builder(
      physics: NeverScrollableScrollPhysics(),
       shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 5,
            childAspectRatio:1.9,
            mainAxisSpacing: 10),
        itemCount: _listdata.length,
        padding: EdgeInsets.only(left: 15,right: 15, top: 20),
        itemBuilder: (BuildContext ctx, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 3.0,right: 3),
            child: InkWell(
              onTap: (){
                showDialog(
                   context: context,
                 builder: (BuildContext context)=>selectpopup(
                   number: _listdata[index].number,
                   color: _listdata[index].color,
                   color1: _listdata[index].color1,
                 )
               );
              },
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 3,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                 height: 30,
              width: 40,

                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      stops: [0.5, 0.5],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        _listdata[index].color,
                        _listdata[index].color1,// top Right part
                      ],
                    ),
                  ),
                  child: Text(_listdata[index].number,style: TextStyle(fontSize: 14,color: Colors.white),),
                ),
              ),
            ),
          );
        }

    );
  }
}

class BeRecord {
  final String number;
  final Color color;
  final Color color1;
  BeRecord(this.number, this.color, this.color1);
}