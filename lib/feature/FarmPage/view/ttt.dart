import 'package:flutter/material.dart';
import 'package:solution_app/core/constants/AppColor.dart';
import 'package:kartal/kartal.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class tttt extends StatefulWidget {
  tttt({Key? key}) : super(key: key);

  @override
  State<tttt> createState() => _ttttState();
}

class _ttttState extends State<tttt> {
  final List<String> fruitsVega = ['Apple', 'Banana', 'Tomato', 'Carrots'];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180,
                    childAspectRatio: 4 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: fruitsVega.length,
                itemBuilder: (BuildContext ctx, index) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selected = index;
                      });
                    },
                    child: Text(
                      fruitsVega[index],
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: selected == index
                            ? Colors.blueGrey
                            : Color.fromARGB(255, 182, 153, 153)),
                  );
                  decoration:
                  BoxDecoration();
                }),
          ),
        ],
      ),
    );
  }
}
