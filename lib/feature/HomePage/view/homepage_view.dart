import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/AppColor.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColors().greyLight,
      width: double.infinity,
      padding: context.paddingLow,
      child: Column(
        children: [
          SizedBox(height: context.dynamicHeight(0.05)),
          _searchbar(context),
          SizedBox(height: context.dynamicHeight(0.05)),
          _buttons(context),
          SizedBox(height: context.dynamicHeight(0.05)),
          _galleryGrid()
        ],
      ),
    ));
  }

  Expanded _galleryGrid() {
    return Expanded(
        flex: 4,
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(3),
              sliver: SliverGrid.count(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text("He'd have you all unravel at the"),
                    color: Colors.green[100],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Heed not the rabble'),
                    color: Colors.green[200],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Sound of screams but the'),
                    color: Colors.green[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Who scream'),
                    color: Colors.green[400],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution is coming...'),
                    color: Colors.green[500],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution, they...'),
                    color: Colors.green[600],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text("He'd have you all unravel at the"),
                    color: Colors.green[100],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Heed not the rabble'),
                    color: Colors.green[200],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Sound of screams but the'),
                    color: Colors.green[300],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Who scream'),
                    color: Colors.green[400],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution is coming...'),
                    color: Colors.green[500],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text('Revolution, they...'),
                    color: Colors.green[600],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Row _buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton.icon(
            onPressed: () {},
            icon: Image.asset("assets/images/Icon-filter.png"),
            label: Text('FILTER'),
            style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                primary: AppColors().green,
                padding: context.paddingNormal,
                shape: RoundedRectangleBorder(
                  borderRadius: context.highBorderRadius,
                ),
                maximumSize: const Size(180, 50),
                minimumSize: const Size(150, 50))),
        ElevatedButton.icon(
            onPressed: () {},
            icon: Image.asset("assets/images/Icon-sort.png"),
            label: Text('SORT'),
            style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                primary: AppColors().green,
                padding: context.paddingNormal,
                shape: RoundedRectangleBorder(
                  borderRadius: context.highBorderRadius,
                ),
                maximumSize: const Size(180, 50),
                minimumSize: const Size(150, 50)))
      ],
    );
  }

  TextField _searchbar(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search goods, #tag, user',
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
        prefixIcon: const Icon(Icons.search),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors().green, width: 2.0),
          borderRadius: context.highBorderRadius,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors().green, width: 2.0),
            borderRadius: context.highBorderRadius),
      ),
      style: TextStyle(
        color: AppColors().black,
      ),
    );
  }
}
