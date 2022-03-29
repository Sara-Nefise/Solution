// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:solution_app/core/constants/AppColor.dart';
import 'package:solution_app/feature/HomePage/view/homepage_view.dart';
import '../../../core/constants/AppString.dart';
import '../../../core/service/auth.dart';
import '../../../products/widgets/bottomNavigationBar.dart';
import '../../../products/widgets/customText.dart';
import '../../../products/widgets/saveuser.dart';
import '../../UserProfile/view/userprofile_view.dart';
// import '../../core/constants/AppString.dart';
// import '../../products/widgets/customText.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

enum userTip { farmar, user }

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int isCheckBox = 0;
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _isCircular = false;
  void changeIsCircular() {
    _isCircular = !_isCircular;
  }

  userTip? type = userTip.farmar;
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: context.horizontalPaddingNormal,
          child: Column(
            children: [
              SizedBox(height: context.dynamicHeight(0.08)),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/nature.png'),
                minRadius: MediaQuery.of(context).size.width * 0.1,
                maxRadius: MediaQuery.of(context).size.width * 0.2,
              ),
              SizedBox(height: context.dynamicHeight(0.02)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppString().welcom,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.1,
                        color: AppColors().green),
                  )),
              SizedBox(height: context.dynamicHeight(0.01)),
              _textFields(),
            ],
          ),
        ),
      ),
    );
  }

  Form _textFields() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              focusNode: _emailNode,
              codeController: _mailController,
              labelText: AppString().email,
              textInputType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
              suffixIcon: null,
            ),
            CustomTextFormField(
              focusNode: _passwordNode,
              codeController: _passwordController,
              labelText: AppString().password,
              isPassword: true,
              textInputType: TextInputType.visiblePassword,
              prefixIcon: Icons.password,
              suffixIcon: Icons.visibility,
            ),
            // SizedBox(height: context.dynamicHeight(0.01)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRadioButton("Farmar", 1),
                CustomRadioButton("User", 2),
              ],
            ),
            SizedBox(height: context.dynamicHeight(0.05)),

            _isCircular
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.7, 50),
                      primary: AppColors().red,
                      shape: RoundedRectangleBorder(
                        borderRadius: context.highBorderRadius,
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        changeIsCircular();
                      });

                      User? user = await Authentication().emailSignIn(
                          email: _mailController.text,
                          password: _passwordController.text);
                      user_1 = user;
                      setState(() {
                        changeIsCircular();
                      });
                      print('${user_1?.email}');
                      print('$value');
                      if (user_1 != null) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) =>
                                ButtonNavigation(value: value))));
                      }
                    },
                    child: Text(
                      AppString().singIn,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        color: AppColors().white,
                      ),
                    ),
                  ),
            SizedBox(height: context.dynamicHeight(0.1)),
          ],
        ),
      ),
    );
  }

  Widget CustomRadioButton(String text, int index) {
    return OutlineButton(
      onPressed: () {
        setState(() {
          value = index;
        });
      },
      child: Text(
        text,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      borderSide:
          BorderSide(color: (value == index) ? Colors.green : Colors.black),
    );
  }
}
