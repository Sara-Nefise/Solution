import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solution_app/core/constants/AppColor.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottomOpacity: 0,
        backgroundColor: AppColors().white,
        title: Text(
          'MESSAGES',
          style: TextStyle(
            color: AppColors().black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const Icon(Icons.navigate_before),
        iconTheme: IconThemeData(color: AppColors().black),
      ),
      body: Container(
          color: AppColors().white,
          width: double.infinity,
          child: Column(
            children: [Card()],
          )),
    );
  }
}
