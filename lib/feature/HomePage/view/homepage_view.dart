import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/AppColor.dart';
import '../../../products/widgets/bottomNavigationBar.dart';
import '../../../products/widgets/listofimages.dart';
import '../../FarmPage/view/farmpage_view.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

  Expanded _galleryGrid() {
    return Expanded(
        flex: 4,
        child: CustomScrollView(
          primary: false,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(3),
              sliver: SliverGrid.count(
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                crossAxisCount: 2,
                children: <Widget>[
                  _imagecard(1),
                  _imagecard(2),
                  _imagecard(3),
                  _imagecard(4),
                  _imagecard(5),
                   _imagecard(0),
                  _imagecard(1),
                  _imagecard(2),
                  _imagecard(3),
                  _imagecard(4),
                  _imagecard(5),
                  _imagecard(6),
                ],
              ),
            ),
          ],
        ));
  }

  Card _imagecard(int img) {
    return Card(
      child: InkWell(
        child: Container(
          width: 200,
          height: 200,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('${images[img]}'),
              fit: BoxFit.cover,
              //alignment: Alignment.topCenter,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            index = img;
            print('$index');
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => FarmPage(
                      imageIndex: index,
                    ))));
          });
        },
      ),
    );
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
