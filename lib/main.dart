import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solution_app/core/constants/AppColor.dart';
import 'package:solution_app/feature/LogIn/view/login_view.dart';
import 'package:solution_app/feature/Onboard/view/onboard_view.dart';
import 'package:solution_app/feature/SignUp/view/signup_view.dart';
import 'package:solution_app/products/widgets/googlemap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: AppColors().green),
      home: OnboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
