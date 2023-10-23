import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virtualcasino/HomeDirectory/NewHome.dart';
import 'package:virtualcasino/Login_directory/Login_Page.dart';
import 'package:virtualcasino/Login_directory/Sign_UP.dart';
import 'package:virtualcasino/roulette/CasinoBoard.dart';
import 'package:virtualcasino/roulette/RoulleteHome.dart';
import 'package:virtualcasino/sound.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]).then((_){
    runApp(MyApp());
  // });

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //
  //       primarySwatch: Colors.blue,
  //     ),
  //     home:
  //     //RouletteLayout()
  //     //Sound()
  //    Login(),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          //   textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          // ),
          // theme: lightTheme,
          // darkTheme: darkTheme,
          home: child,
        );
      },
      child: Login(),
      // child:MyTest(),
    );
  }
}


