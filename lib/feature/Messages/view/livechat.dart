import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../HomePage/view/homepage_view.dart';

class LivechatPage extends StatefulWidget {
  LivechatPage({Key? key}) : super(key: key);

  @override
  State<LivechatPage> createState() => _LivechatPageState();
}

class _LivechatPageState extends State<LivechatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/livechat.PNG'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
          });
        },
      ),
    );
  }
}
