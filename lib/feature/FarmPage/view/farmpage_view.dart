import 'package:flutter/material.dart';
import 'package:solution_app/core/constants/AppColor.dart';
import 'package:kartal/kartal.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class FarmPage extends StatefulWidget {
  FarmPage({Key? key}) : super(key: key);

  @override
  State<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  final List<String> fruitsVega = ['Apple', 'Banana', 'Tomato', 'Carrots'];
  int selected = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          padding: context.horizontalPaddingLow,
          child: Column(children: [
            SizedBox(height: context.dynamicHeight(0.04)),
            _imageCard(context),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Padding(
                    padding: context.horizontalPaddingMedium,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: context.dynamicHeight(0.02),
                          ),
                          Text(
                            'What can you harvest?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            flex: 5,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 100,
                                        childAspectRatio: 5 / 2,
                                        crossAxisSpacing: 13,
                                        mainAxisSpacing: 13),
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
                                          ? AppColors().grey
                                          : AppColors().greyLight,
                                    ),
                                  );
                                  decoration:
                                  BoxDecoration();
                                }),
                          ),
                          SizedBox(
                            height: context.dynamicHeight(0.013),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Expenses for Apple:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  'Labour wage: 5.000',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Watering: 10.000',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'Empty Field Price: 500',
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        child: Text('Total\t\t\t\t2500.00 TlL'),
                                        style: ElevatedButton.styleFrom(
                                            primary: AppColors().green,
                                            minimumSize: Size(400, 35),
                                            maximumSize: Size(450, 35),
                                            textStyle: TextStyle(fontSize: 18),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  context.highBorderRadius,
                                            )),
                                        onPressed: () {},
                                      )),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                          child: Text('Get Contact'),
                                          style: ElevatedButton.styleFrom(
                                              primary: AppColors().red,
                                              minimumSize: Size(100, 35),
                                              maximumSize: Size(150, 35),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    context.highBorderRadius,
                                              )),
                                          onPressed: () {}))
                                ],
                              )),
                        ]),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: context.normalBorderRadius),
                  elevation: 5,
                  margin: context.paddingNormal,
                ),
              ),
            ),
          ])),
    );
  }

  Expanded _imageCard(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(children: [
          Image.network(
            'https://placeimg.com/640/480/any',
            fit: BoxFit.fill,
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: ElevatedButton.icon(
                icon: Image.asset('assets/images/map.png'),
                onPressed: () {},
                label: Text(
                  'See on map',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: context.highBorderRadius),
                    padding: context.paddingNormal,
                    primary: AppColors().white,
                    onPrimary: AppColors().green,
                    fixedSize: Size(200, 50)),
              ))
        ]),
        shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
        elevation: 5,
        margin: context.paddingLow,
      ),
    );
  }
}
