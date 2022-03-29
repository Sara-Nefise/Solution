import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kartal/kartal.dart';
import '../../core/constants/AppColor.dart';

class GoogleMappage extends StatefulWidget {
  const GoogleMappage({Key? key}) : super(key: key);

  @override
  _GoogleMappageState createState() => _GoogleMappageState();
}

class _GoogleMappageState extends State<GoogleMappage> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingLow,
      //color: AppColors().green,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/googlemap.png'),
          fit: BoxFit.cover,
          //alignment: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: context.dynamicHeight(0.07),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 20,
                  height: 20,
                  child: InkWell(
                      child: Image.asset('assets/images/icons8-back-50.png'),
                      onTap: () {
                       // Navigator.of(context).pop();
                      }),
                ),
              ),
              _searchbar(context)
            ],
          )
        ],
      ),
    );
  }

  Container _searchbar(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search..',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors().grey, width: 2.0),
            borderRadius: context.highBorderRadius,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors().grey, width: 2.0),
              borderRadius: context.highBorderRadius),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors().grey, width: 2.0),
              borderRadius: context.highBorderRadius),
        ),
        style: TextStyle(color: AppColors().black),
      ),
    );
  }
}
