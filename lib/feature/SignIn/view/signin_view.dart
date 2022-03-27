import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:solution_app/core/constants/AppString.dart';

import '../../../core/constants/AppColor.dart';
import '../../../products/widgets/dropdown.dart';
import '../../../products/widgets/labeledText.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dropdownController = TextEditingController();

  bool isCheckBox = false;
  final FocusNode _nameNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isValidate = false;
  bool isAccept = false;
  bool isEmailUpdatesOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors().green,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: _nameNode.hasFocus || _passwordNode.hasFocus
              ? const ScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: context.dynamicHeight(1),
            child: Padding(
              padding: context.horizontalPaddingLow,
              child: Column(children: [
                SizedBox(height: context.dynamicHeight(0.05)),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppString().creataccount,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.11,
                            color: AppColors().greyLight))),
                SizedBox(height: context.dynamicHeight(0.01)),
                _textFields(),
                Spacer()
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Form _textFields() {
    return Form(
      key: _formKey,
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
              focusNode: _passwordNode,
              codeController: _passwordController,
              labelText: AppString().password,
              isPassword: true,
              textInputType: TextInputType.visiblePassword,
              suffixIcon: Icons.visibility,
            ),
            _checkboxes(AppString().acccept),
            _checkboxes(AppString().appdate),
            SizedBox(height: context.dynamicHeight(0.02)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
                  primary: AppColors().red,
                  shape: RoundedRectangleBorder(
                    borderRadius: context.highBorderRadius,
                  )),
              onPressed: () {},
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
