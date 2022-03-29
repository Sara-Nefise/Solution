import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/AppColor.dart';
import '../../../core/service/auth.dart';
import '../../../products/widgets/listofimages.dart';
import '../../FarmPage/view/farmpage_view.dart';
import '../../LogIn/view/login_view.dart';

class Farmarprofile extends StatefulWidget {
  final User? user;
  Farmarprofile({Key? key, required this.user}) : super(key: key);

  @override
  State<Farmarprofile> createState() => _FarmarprofileState();
}

class _FarmarprofileState extends State<Farmarprofile> {
  int emptyfeilds = 186;
  int fullfeilds = 85;
  int total = 250;
  late User? user;
  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: AppColors().white,
      width: double.infinity,
      padding: context.paddingLow,
      child: Column(
        children: [
          SizedBox(height: context.dynamicHeight(0.05)),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
                child: const Icon(Icons.exit_to_app),
                onTap: () {
                  setState(() async {
                    await Authentication().singOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: ((context) => LoginPage())));
                  });
                }),
          ),
          Column(
            children: [
              _profile(context),
              SizedBox(height: context.dynamicHeight(0.02)),
              Text(
                'Eda Akdeniz',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: context.dynamicHeight(0.006)),
              _userInfo(),
            ],
          ),
          SizedBox(height: context.dynamicHeight(0.02)),
          _istatistics(),
          SizedBox(height: context.dynamicHeight(0.02)),
          _galleryGrid()
        ],
      ),
    ));
  }

  RichText _userInfo() {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Image.asset("assets/images/map.png"),
          ),
          TextSpan(
              text: " Kötekli, Muğla",
              style: TextStyle(color: AppColors().black)),
        ],
      ),
    );
  }

  Stack _profile(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          child: Image.asset('assets/images/profil.png'),
          radius: 70,
          backgroundColor: AppColors().white,
        ),
        Positioned(
            right: -15,
            bottom: 0,
            child: MaterialButton(
              onPressed: () {},
              color: AppColors().white,
              textColor: AppColors().black,
              child: const Icon(
                Icons.add,
                size: 24,
              ),
              padding: context.paddingNormal,
              shape: const CircleBorder(),
            ))
      ],
    );
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
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                crossAxisCount: 2,
                children: <Widget>[
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

  Padding _istatistics() {
    return Padding(
      padding: context.paddingLow,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(children: [
            Text('$emptyfeilds',
                style: TextStyle(fontSize: 25, color: AppColors().grey)),
            SizedBox(height: context.dynamicHeight(0.01)),
            Text('Empty Feilds',
                style: TextStyle(fontSize: 18, color: AppColors().grey)),
          ]),
          //SizedBox(width: context.dynamicWidth(0.15)),
          VerticalDivider(
            color: Colors.amber,
            width: context.dynamicWidth(0.15),
          ),
          Column(children: [
            Text(
              '$fullfeilds',
              style: TextStyle(fontSize: 25, color: AppColors().grey),
            ),
            SizedBox(height: context.dynamicHeight(0.01)),
            Text('Full Feilds',
                style: TextStyle(fontSize: 18, color: AppColors().grey))
          ]),
          VerticalDivider(
            color: Colors.amber,
            width: context.dynamicWidth(0.2),
          ),
          Column(children: [
            Text('${emptyfeilds+fullfeilds}',
                style: TextStyle(fontSize: 25, color: AppColors().grey)),
            SizedBox(height: context.dynamicHeight(0.01)),
            Text('Total',
                style: TextStyle(fontSize: 18, color: AppColors().grey))
          ]),
        ],
      ),
    );
  }
}
