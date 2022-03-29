import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:solution_app/core/constants/AppColor.dart';

import '../../core/constants/AppString.dart';
import '../utils/validator/validator.dart';

class LabledTextFormField extends StatefulWidget {
  final TextEditingController codeController;
  final TextInputType textInputType;
  final String labelText;
  bool isPassword;
  final FocusNode focusNode;
  var prefixIcon;
  var suffixIcon;
  LabledTextFormField(
      {Key? key,
      required this.codeController,
      required this.textInputType,
      required this.labelText,
      this.isPassword = false,
      required this.focusNode,
      required this.suffixIcon})
      : super(key: key);

  @override
  _LabledTextFormFieldState createState() => _LabledTextFormFieldState();
}

class _LabledTextFormFieldState extends State<LabledTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.labelText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  color: AppColors().white),
            ),
          ),
          SizedBox(height: context.dynamicHeight(0.01)),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (widget.labelText == AppString().password) {
                  return Validator().validatePassword(password: value);
                } else if (widget.labelText == AppString().email) {
                  return Validator().validateEmail(email: value);
                } else if (widget.labelText == AppString().nameSurename) {
                  return Validator().validateName(name: value);
                }
              },
              focusNode: widget.focusNode,
              controller: widget.codeController,
              keyboardType: widget.textInputType,
              obscureText: widget.isPassword,
              decoration: widget.labelText == AppString().password
                  ? _passwordfeild(context)
                  : _emailfeild(context))
        ],
      ),
    );
  }

  InputDecoration _emailfeild(BuildContext context) {
    return InputDecoration(
      contentPadding: context.paddingNormal,
      filled: true,
      fillColor: Colors.white,
      labelStyle: context.textTheme.headline6,
      border: _outlineborder(context),
    );
  }

  InputDecoration _passwordfeild(BuildContext context) {
    return InputDecoration(
        contentPadding: context.paddingNormal,
        filled: true,
        fillColor: Colors.white,
        suffix: InkWell(
            onTap: () {
              setState(() {
                widget.isPassword = !widget.isPassword;
              });
            },
            child: Icon(
              widget.isPassword ? Icons.visibility : Icons.visibility_off,
            )),
        labelStyle: context.textTheme.headline6,
        border: _outlineborder(context));
  }

  OutlineInputBorder _outlineborder(BuildContext context) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: AppColors().white),
        borderRadius: context.highBorderRadius);
  }
}
