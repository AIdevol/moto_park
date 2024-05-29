// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:moto_park/utilities/google_font_text_style.dart';

// class LocationController extends StatefulWidget {
//   @override
//   _LocationControllerState createState() => _LocationControllerState();
// }

// class _LocationControllerState extends State<LocationController> {
//   String currentAddress = 'My Address';
//   late Position currentPosition;
//   final box = GetStorage();
//   List<String> locationHistory = [];

//   @override
//   void initState() {
//     super.initState();
//     _getLocation();
//     _loadLocationHistory();
//     // _loadLocationHistories();
//   }

//   Future<void> _getLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       Fluttertoast.showToast(msg: 'Please enable Your Location Service');
//       return;
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         Fluttertoast.showToast(msg: 'Location permissions are denied');
//         return;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       Fluttertoast.showToast(
//         msg:
//             'Location permissions are permanently denied, we cannot request permissions.',
//       );
//       return;
//     }

//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );

//       List<Placemark> placemarks =
//           await placemarkFromCoordinates(position.latitude, position.longitude);

//       Placemark place = placemarks.first;

//       setState(() {
//         currentPosition = position;
//         currentAddress =
//             "${place.locality}, ${place.postalCode}, ${place.country}";
//       });

//       // Save location to local storage
//       _saveLocationToHistory(currentAddress);
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<void> _saveLocationToHistory(String location) async {
//     locationHistory.add(location);
//     await box.write('location_history', locationHistory);
//   }

//   Future<void> _loadLocationHistory() async {
//     var savedHistory = box.read<List<dynamic>>('location_history');
//     if (savedHistory != null) {
//       setState(() {
//         // Using `map` to convert each element to a String.
//         locationHistory = savedHistory.map((e) => e.toString()).toList();
//       });
//     }
//   }

//   Future<void> _loadLocationHistories() async {
//     List<String>? savedHistory = box.read<List<String>>('location_history');
//     if (savedHistory != null) {
//       setState(() {
//         locationHistory = [...savedHistory];
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Current Address:',
//               style:
//                   BalooStyles.balooboldTextStyle(color: Colors.black, size: 16),
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               currentAddress,
//               style: TextStyle(fontSize: 18.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LocationHistoryWidget extends StatelessWidget {
//   final List<String> locationHistory;

//   LocationHistoryWidget({required this.locationHistory});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Location History"),
//       ),
//       body: locationHistory.isEmpty
//           ? Center(child: Text("No location history found"))
//           : ListView.builder(
//               itemCount: locationHistory.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(locationHistory[index],
//                       style: BalooStyles.balooboldTextStyle(
//                           color: Colors.black, size: 16)),
//                   subtitle: Text('Entry ${index + 1}'),
//                 );
//               },
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moto_park/utilities/google_font_text_style.dart';
import 'package:moto_park/utilities/helper_widget.dart';

// Main Widget for Location Services
class LocationController extends StatefulWidget {
  @override
  _LocationControllerState createState() => _LocationControllerState();
}

class _LocationControllerState extends State<LocationController> {
  String currentAddress = 'My Address';
  late Position currentPosition;
  final box = GetStorage();
  List<String> locationHistory = [];

  @override
  void initState() {
    super.initState();
    _getLocation();
    _loadLocationHistory();
  }

  // Method to fetch the current location
  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
      return;
    }

    // Check and request permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
        msg:
            'Location permissions are permanently denied, we cannot request permissions.',
      );
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks.first;

      setState(() {
        currentPosition = position;
        currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });

      _saveLocationToHistory(currentAddress);
    } catch (e) {
      print(e.toString());
    }
  }

  // Save location to local storage
  Future<void> _saveLocationToHistory(String location) async {
    locationHistory.add(location);
    await box.write('location_history', locationHistory);
  }

  // Load location history from local storage
  Future<void> _loadLocationHistory() async {
    var savedHistory = box.read<List<dynamic>>('location_history');
    if (savedHistory != null) {
      setState(() {
        locationHistory = savedHistory.map((e) => e.toString()).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.location_on),
                ),
                hGap(30),
                Center(
                  child: Text(
                    'Current Address:',
                    style: BalooStyles.balooboldTextStyle(
                        color: Colors.black, size: 16),
                  ),
                ),
              ],
            ),
          ),
          vGap(40),
          Center(
            child: Text(
              currentAddress,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}

// Separate Widget for displaying location history
class LocationHistoryWidget extends StatelessWidget {
  final List<String> locationHistory;

  LocationHistoryWidget({required this.locationHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.data_exploration_sharp),
        title: Text("Your last location history:",
            style:
                BalooStyles.balooboldTextStyle(color: Colors.black, size: 16)),
      ),
      body: locationHistory.isEmpty
          ? const Center(child: Text("No location history found"))
          : ListView.builder(
              itemCount: locationHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(locationHistory[index],
                      style: BalooStyles.balooboldTextStyle(
                          color: Colors.black, size: 16)),
                  subtitle: Text('Entry ${index + 1}'),
                );
              },
            ),
    );
  }
}
