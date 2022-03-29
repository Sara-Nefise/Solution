import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../HomePage/view/homepage_view.dart';

class CameraPage extends StatefulWidget {
  CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  String img1 = 'assets/images/c.PNG';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Container(
          // padding: context.paddingLow,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('$img1'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            img1 = 'assets/images/cam2.PNG';
          });
        },
        onDoubleTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
