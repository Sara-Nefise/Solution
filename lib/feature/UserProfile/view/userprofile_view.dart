import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/AppColor.dart';

class Userprofile extends StatefulWidget {
  Userprofile({Key? key}) : super(key: key);

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  int emptyfeilds = 186;
  int fullfeilds = 85;
  int total = 250;
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
          Column(
            children: [
              _profile(context),
              SizedBox(height: context.dynamicHeight(0.02)),
              Text(
                'YASMEIN TORAMEN',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: context.dynamicHeight(0.006)),
              _userInfo(),
            ],
          ),
          SizedBox(height: context.dynamicHeight(0.01)),
          _istatistics(),
          SizedBox(height: context.dynamicHeight(0.01)),
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
                ],
              ),
            ),
          ],
        ));
  }

  Padding _istatistics() {
    return Padding(
      padding: context.paddingLow,
      child: Align(
          alignment: Alignment.bottomLeft,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text('$emptyfeilds',
                style: TextStyle(fontSize: 25, color: AppColors().grey)),
            SizedBox(height: context.dynamicHeight(0.01)),
            Text('Empty Feilds',
                style: TextStyle(fontSize: 18, color: AppColors().grey)),
          ])),
    );
  }
}
