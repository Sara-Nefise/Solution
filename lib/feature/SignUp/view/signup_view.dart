import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:solution_app/core/constants/AppColor.dart';
import '../../../core/constants/AppString.dart';
import '../../../products/widgets/customText.dart';
// import '../../core/constants/AppString.dart';
// import '../../products/widgets/customText.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isCheckBox = false;
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: _emailNode.hasFocus || _passwordNode.hasFocus
            ? const ScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: context.dynamicHeight(1),
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
                const Spacer(),
              ],
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
            SizedBox(height: context.dynamicHeight(0.05)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
                primary: AppColors().red,
                shape: RoundedRectangleBorder(
                  borderRadius: context.highBorderRadius,
                ),
              ),
              onPressed: () {},
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
}
