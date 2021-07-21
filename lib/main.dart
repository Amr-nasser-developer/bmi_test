import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/modules/auth/login_screen.dart';
import 'modules/calculateApp/home/Calculate.dart';
import 'package:social_app/shared/network/local/cash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CashHelper.init();
  String uId = await CashHelper.getData(key: 'uId');
  print('uId : $uId');
  runApp(MyApp(uId));
}

class MyApp extends StatelessWidget {
  var uId;
  MyApp(this.uId);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleSpacing: 20.0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: (uId != null) ? Calculate() : LoginScreen(),
    );
  }
}
