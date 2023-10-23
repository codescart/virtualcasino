

import 'package:flutter/material.dart';
import 'package:virtualcasino/colorpredication/popup.dart';

class button extends StatefulWidget {
  const button({Key? key}) : super(key: key);

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  final List<BeRecord> _listdata = [
    BeRecord('Join Green', Color(0xff4caf50),),
    BeRecord('Join Violet', Color(0xff9c27b0)),
    BeRecord('Join Red', Color(0xfff44336)),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0,right: 18),
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 25,
                  maxCrossAxisExtent: 130,
                  childAspectRatio: 3 / 1.1,
                  mainAxisSpacing: 2),
              itemCount: _listdata.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>popup()));
                    showDialog(
                        context: context,
                        builder: (BuildContext context)=>popup(
                          color: _listdata[index].color,
                          name:  _listdata[index].name,
                        )
                    );
                  },
                  child: Card(
                    elevation: 5,
                    color: _listdata[index].color,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text(_listdata[index].name,style: TextStyle(color: Colors.white),)),
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class BeRecord {
  final String name;
  final Color color;
  BeRecord(this.name, this.color);
}
