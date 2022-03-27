import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/AppString.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController codeController;
  final TextInputType textInputType;
  final String labelText;
  bool isPassword;
  final FocusNode focusNode;
  var prefixIcon;
  var suffixIcon;
  CustomTextFormField(
      {Key? key,
      required this.codeController,
      required this.textInputType,
      required this.labelText,
      this.isPassword = false,
      required this.focusNode,
      required this.prefixIcon,
      required this.suffixIcon})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Bu alan boş kalmamalı";
            }
            if (value.length < 6) {
              return "6 dan küçük olamaz";
            }
            if (value.length > 20) {
              return "20 den büyük olamaz";
            }
          },
          focusNode: widget.focusNode,
          controller: widget.codeController,
          keyboardType: widget.textInputType,
          obscureText: widget.isPassword,
          decoration: widget.labelText == AppString().password
              ? _passwordfeild(context)
              : _emailfeild(context)),
    );
  }

  InputDecoration _emailfeild(BuildContext context) {
    return InputDecoration(
      contentPadding: context.paddingNormal,
      labelText: widget.labelText,
      prefixIcon: Icon(
        widget.prefixIcon,
        color: Colors.grey,
      ),
      labelStyle: context.textTheme.headline6,
      enabledBorder: _outlineborder(context),
      focusedBorder: _outlineborder(context),
    );
  }

  InputDecoration _passwordfeild(BuildContext context) {
    return InputDecoration(
      contentPadding: context.paddingNormal,
      labelText: widget.labelText,
      prefixIcon: Icon(
        widget.prefixIcon,
        color: Colors.grey,
      ),
      suffix: InkWell(
          onTap: () {
            setState(() {
              widget.isPassword = !widget.isPassword;
            });
          },
          child: Icon(
            widget.isPassword ? Icons.visibility : Icons.visibility_off,
          )),
      labelStyle: context.textTheme.headlineSmall,
      border: _outlineborder(context),
    );
  }

  OutlineInputBorder _outlineborder(BuildContext context) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: context.appTheme.primaryColor),
        borderRadius: context.highBorderRadius);
  }
}
