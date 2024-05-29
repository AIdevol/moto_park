import 'package:flutter/material.dart';
import 'package:moto_park/constants/color_constants.dart';
import 'package:moto_park/pages/home/sheets/sheet_controller/location_controller.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/helper_widget.dart';

class MapLocation extends StatefulWidget {
  final List<String> locationHistory;

  const MapLocation({Key? key, required this.locationHistory})
      : super(key: key);

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: Text(
          "Live Location",
          style: BalooStyles.balooboldTextStyle(color: Colors.black, size: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: appColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: LocationController(),
              ),
            ),
            vGap(20),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: appColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: LocationHistoryWidget(locationHistory: const []),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
