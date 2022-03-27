import 'package:flutter/material.dart';
import 'package:solution_app/core/constants/AppColor.dart';
import 'package:solution_app/feature/SignUp/view/Signup_view.dart';
import 'feature/FarmPage/view/farmpage_view.dart';
import 'feature/FarmPage/view/ttt.dart';
import 'feature/FarmarProfile/view/farmarpage_view.dart';
import 'feature/HomePage/view/homepage_view.dart';
import 'feature/Messages/view/messages_view.dart';
import 'feature/SignIn/view/signin_view.dart';
import 'feature/UserProfile/view/userprofile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: AppColors().green),
      home: MessagePage(),
    );
  }
}
