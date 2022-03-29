import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:solution_app/core/constants/AppString.dart';

import '../../LogIn/view/login_view.dart';
import '../../SignUp/view/Signup_view.dart';

class OnboardPage extends StatefulWidget {
  OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(image: _onboardImage()),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: context.height * 0.5,
          ),
          _googlebutton(),
          _sizedbox(),
          _facebookbutton(),
          _sizedbox(),
          _emailbutton(),
          _sizedbox(),
          _signInbutton(),
          const Spacer()
        ]),
      ),
    );
  }

  ButtonStyle _elevatedstyle([Color? color, Color? onprimary]) {
    return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        minimumSize: Size(context.width * 0.9, context.height * 0.07),
        onPrimary: onprimary ?? Colors.black,
        primary: color ?? Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold));
  }

  DecorationImage _onboardImage() {
    return const DecorationImage(
        image: AssetImage("assets/images/nature.png"), fit: BoxFit.cover);
  }

  Widget _googlebutton() {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.android,
        color: Colors.pink,
        size: 24.0,
      ),
      style: _elevatedstyle(Colors.white, Colors.grey),
      onPressed: () {},
      label: Text(
        AppString().googleSign,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _facebookbutton() {
    return ElevatedButton.icon(
        icon: const Icon(
          Icons.facebook,
          color: Colors.white,
          size: 24.0,
        ),
        onPressed: () {},
        label: Text(
          AppString().facebookSign,
        ),
        style: _elevatedstyle(
            const Color.fromARGB(255, 24, 88, 141), Colors.white));
  }

  Widget _emailbutton() {
    return ElevatedButton.icon(
        icon: const Icon(
          Icons.email_outlined,
          size: 24.0,
        ),
        onPressed: () {
          setState(() {
            Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => SignUp())));
          });
        },
        label: Text(
          AppString().emailSign,
        ),
        style: _elevatedstyle());
  }

  Widget _signInbutton() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => LoginPage())));
          });
        },
        child: Text(
          AppString().singIn,
        ),
        style: _elevatedstyle(Colors.redAccent.shade700, Colors.white));
  }

  _sizedbox() {
    return SizedBox(height: context.height * 0.04);
  }
}
