

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virtualcasino/colorpredication/home.dart';
import 'package:virtualcasino/colorpredication/recharge_record.dart';

class balance extends StatefulWidget {
  const balance({Key? key}) : super(key: key);

  @override
  State<balance> createState() => _balanceState();
}

class _balanceState extends State<balance> {
  final List<String> categoriesList = [
    "EkPay",
    "DyPAy",
    "WinPay",
    "WowPay",
    "AtPay",

  ];
  final List<BeRecord> _listdata = [
    BeRecord('₹ 500',Colors.grey.shade200),
    BeRecord('₹ 1000',Colors.grey.shade200),
    BeRecord('₹ 2000',Colors.grey.shade200),
    BeRecord('₹ 5000',Colors.grey.shade200),
    BeRecord('₹ 10000',Colors.grey.shade200),
    BeRecord('₹ 49999',Colors.grey.shade200)
  ];
  var catogery;
  final TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      elevation: 0,
        leading: IconButton(onPressed: (){  Navigator.push(context, MaterialPageRoute(builder: (context)=>colorpredicationhome()));}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text('Recharge ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),
      ),
        actions: [IconButton(onPressed: (){
Navigator.push(context,
MaterialPageRoute(builder: (context)=>recharge()));
        }, icon: Icon(Icons.dehaze_rounded,color: Colors.white,))],
      ),
body: SingleChildScrollView(
  child:   Column(
  
    children: [
  
      SizedBox(height: 30,),
  
      Row(
  
        crossAxisAlignment: CrossAxisAlignment.center,
  
        mainAxisAlignment: MainAxisAlignment.center,
  
        children: [
  
          Text('Balance: ₹ 0.00',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18),)
  
        ],
  
      ),
  
  
  
      Padding(
  
        padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
  
        child: Card(
  
          elevation: 5,
  
  
  
          child: Container(
  
            height: 40.h,
  
            width:330.w,
  
            color: Colors.white,
  
            child: TextField(
  
              controller:amountController,
  
  
  
              textAlign: TextAlign.start,
  
              onChanged: (value) {},
  
  
  
              decoration: InputDecoration(
  
  
  
                  prefixIcon: Icon(Icons.account_balance_wallet_rounded,color: Colors.grey,),
  
  
  
                  hintText: "Enter or Select recharge amount ",
  
  
  
                  helperStyle: TextStyle(fontSize: 10,color: Colors.grey.shade200),
  
                  border: OutlineInputBorder(
  
                      borderSide: BorderSide.none,
  
  
  
                  )
  
  
  
              ),
  
              cursorColor: Colors.grey,
  
            ),
  
          ),
  
        ),
  
      ),
  
      SizedBox(height: 16.h,),
  
          Padding(
  
            padding: const EdgeInsets.only(left: 20,right: 20),
  
            child: GridView.builder(
  
                physics: NeverScrollableScrollPhysics(),
  
                shrinkWrap: true,
  
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  
                  //  crossAxisSpacing: 20,
  
                    maxCrossAxisExtent: 130,
  
                    childAspectRatio: 3.5 / 1.5,
  
                    mainAxisSpacing: 5),
  
                itemCount: _listdata.length,
  
                itemBuilder: (BuildContext ctx, index) {
  
                  return InkWell(
  
                    onTap: (){
  
                    },
  
                    child: Card(
  
                      elevation: 5,
  
                      color: _listdata[index].color,
  
                 //     shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  
                      child: Center(child: Text(_listdata[index].amount,style: TextStyle(color: Colors.black),)),
  
                    ),
  
                  );
  
                }),
  
          ),
  
  
  
      Row(
  
        children: [
  
          Padding(
  
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
  
            child: Text('Payment',style: TextStyle(color: Colors.grey.shade500,fontSize: 13),),
  
          ),
  
        ],
  
      ),
  
      Container(
  
  
  
        height: 250.h,
  
        width: 370.w,
  
        child: ListView.builder(
  
  padding: EdgeInsets.only(left: 20,right: 20),
  
            physics: NeverScrollableScrollPhysics(),
  
            itemCount: categoriesList.length,
  
            itemBuilder: (BuildContext context, int index) {
  
              return InkWell(
  
                onTap: (){
  
                  setState(() {
  
                    catogery = categoriesList[index].toString();
  
                  });
  
                },
  
                child: ListTile(
  
                    leading:catogery.toString()== categoriesList[index].toString()?  Icon(Icons.check,color: Colors.black,size: 25,):Text(""),
  
                    title: Text(categoriesList[index],style: TextStyle(fontSize: 13),)),
  
              );
  
            }
  
        ),
  
      ),
  
  
  
  
  
      GestureDetector(
  
        onTap: () {},
  
        child: Container(
  
          width: 200.w,
  
          height: 45.h,
  
          decoration: BoxDecoration(
  
          color: Colors.teal,
  
  
  
  
  
          ),
  
          child: Center(
  
            child: Text(
  
              'Recharge',
  
              style: TextStyle(
  
                color: Colors.white,
  
                fontSize: 18,
  
                fontWeight: FontWeight.w400,
  
              ),
  
            ),
  
          ),
  
        ),
  
      ),
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
      ]
  
      ),
),
    );
  }
}
class BeRecord {
  final String amount;
  final Color color;
  BeRecord(this.amount, this.color);
}