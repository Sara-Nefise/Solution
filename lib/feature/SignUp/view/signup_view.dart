import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:solution_app/core/constants/AppString.dart';
import 'package:solution_app/feature/LogIn/view/login_view.dart';

import '../../../core/constants/AppColor.dart';
import '../../../core/service/auth.dart';
import '../../../products/widgets/dropdown.dart';
import '../../../products/widgets/labeledText.dart';
import '../../UserProfile/view/userprofile_view.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isCheckBox = false;
  final FocusNode _nameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _emailNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isValidate = false;
  bool isAccept = false;
  bool isEmailUpdatesOn = false;
  bool _isCircular = false;
  void changeIsCircular() {
    _isCircular = !_isCircular;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: AppColors().green,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: FutureBuilder(
                future: Authentication().initializeFirebase(context: context),
                builder: (context, snapshot) {
                  return Padding(
                    padding: context.horizontalPaddingLow,
                    child: Column(children: [
                      SizedBox(height: context.dynamicHeight(0.04)),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 20,
                          height: 30,
                          child: InkWell(
                              child: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: AppColors().white,
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppString().creataccount,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.11,
                                  color: AppColors().greyLight))),
                      SizedBox(height: context.dynamicHeight(0.01)),
                      _textFields(),
                    ]),
                  );
                }),
          )),

      //other params
    );
  }

  Form _textFields() {
    return Form(
      key: _formKey,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dropdown(AppString().country),
            LabledTextFormField(
              focusNode: _nameNode,
              codeController: _nameController,
              labelText: AppString().nameSurename,
              textInputType: TextInputType.text,
              suffixIcon: null,
            ),
            LabledTextFormField(
              focusNode: _emailNode,
              codeController: _emailController,
              labelText: AppString().email,
              textInputType: TextInputType.text,
              suffixIcon: null,
            ),
            LabledTextFormField(
              focusNode: _passwordNode,
              codeController: _passwordController,
              labelText: AppString().password,
              isPassword: true,
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icons.visibility,
            ),
            _checkboxes(AppString().acccept),
            _checkboxes(AppString().appdate),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
                  primary: AppColors().red,
                  shape: RoundedRectangleBorder(
                    borderRadius: context.highBorderRadius,
                  )),
              onPressed: () async {
                setState(() {
                  changeIsCircular();
                });

                User? user = await Authentication().createUser(
                    email: _emailController.text,
                    password: _passwordController.text);

                setState(() {
                  changeIsCircular();
                });
                if (user != null) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => LoginPage())));
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
            SizedBox(height: context.dynamicHeight(0.03)),
            Text(AppString().agreement,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    color: AppColors().white,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }

  Row _checkboxes(String text) {
    return Row(
      children: [
        Checkbox(
            checkColor: Colors.white,
            value: isAccept,
            onChanged: (bool? value) {
              setState(() {
                isAccept = value!;
              });
            }),
        Text(
          text,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.035,
              color: AppColors().white,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
