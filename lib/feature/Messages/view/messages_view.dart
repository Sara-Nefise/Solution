import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solution_app/core/constants/AppColor.dart';
import 'package:kartal/kartal.dart';
import 'package:solution_app/feature/Messages/view/livechat.dart';

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
            children: [
              _imageCards(
                  context, 'ava.png', 'Jennifer Lawrence', 'Thanx for all'),
              _imageCards(context, 'avatar.png', 'Dina Lawrence', 'Hi'),
              _imageCards(context, 'ava-1.png', 'Mike Jo', 'Hi'),
              _imageCards(context, 'ava-2.png', 'Steven Law', 'I will buy')
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors().black,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  InkWell _imageCards(
      BuildContext context, String img, String name, String message,
      {Color? color}) {
    return InkWell(
      child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Container(
            color: AppColors().green,
            height: 70,
            child: Padding(
              padding: context.paddingNormal,
              child: Row(children: [
                //avatar
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/$img'),
                ),
                SizedBox(
                  width: context.dynamicWidth(0.08),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: AppColors().white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: context.dynamicHeight(0.01),
                    ),
                    Text(message,
                        style: TextStyle(
                            color: AppColors().white,
                            fontWeight: FontWeight.bold)),
                  ],
                )
              ]),
            ),
          )),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: ((context) => LivechatPage())));
      },
    );
  }
}
