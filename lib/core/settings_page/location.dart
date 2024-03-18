import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/constants/backgroundimage.dart';
import '../../constants/constants/images.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  Future<void> _launchMapsUrl() async {
    final lat = 33.509883; // إحداثيات الموقع
    final lng = 36.305231; // إحداثيات الموقع
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            BackGroundImage(),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            ImageAssets.nour,
                            width: 80,
                          ),
                          Image.asset(
                            ImageAssets.book,
                            width: 80,
                          ),
                        ],
                      ),
                      Image.asset(
                        ImageAssets.school,
                        width: 70,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: const DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'boutros',
                      ),
                      child: Text('موقعنا'),
                    ),
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'boutros',
                    ),
                    child: Text('دمشق, طريق المطار , الجسر الثالث'),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 300,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(33.509883, 36.305231), // إحداثيات الموقع
                      zoom: 18.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c'],
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point:
                                LatLng(33.509883, 36.305231), // إحداثيات الموقع
                            builder: (ctx) => GestureDetector(
                              onTap: _launchMapsUrl,
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../constants/constants/backgroundimage.dart';
// import '../../constants/constants/images.dart';
//
// class LocationScreen extends StatelessWidget {
//   const LocationScreen({Key? key}) : super(key: key);
//
//   Future<void> _launchMapsUrl() async {
//     final lat = 33.509883; // إحداثيات الموقع
//     final lng = 36.305231; // إحداثيات الموقع
//     final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
//
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           alignment: AlignmentDirectional.center,
//           children: [
//             BackGroundImage(),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Image.asset(
//                             ImageAssets.nour,
//                             width: 80,
//                           ),
//                           Image.asset(
//                             ImageAssets.book,
//                             width: 80,
//                           ),
//                         ],
//                       ),
//                       Image.asset(
//                         ImageAssets.school,
//                         width: 70,
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 50),
//                     child: const DefaultTextStyle(
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 35,
//                         fontWeight: FontWeight.w900,
//                         fontFamily: 'boutros',
//                       ),
//                       child: Text('موقعنا'),
//                     ),
//                   ),
//                   DefaultTextStyle(
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontFamily: 'boutros',
//                     ),
//                     child: Text('دمشق, طريق المطار , الجسر الثالث'),
//                   ),
//                   SizedBox(
//                     height: 55,
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 width: 300,
//                 height: 150,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(25),
//                   child: FlutterMap(
//                     options: MapOptions(
//                       center: LatLng(33.509883, 36.305231), // إحداثيات الموقع
//                       zoom: 18.0,
//                     ),
//                     layers: [
//                       TileLayerOptions(
//                         urlTemplate:
//                             'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                         subdomains: ['a', 'b', 'c'],
//                       ),
//                       MarkerLayerOptions(
//                         markers: [
//                           Marker(
//                             width: 80.0,
//                             height: 80.0,
//                             point:
//                                 LatLng(33.509883, 36.305231), // إحداثيات الموقع
//                             builder: (ctx) => GestureDetector(
//                               onTap: _launchMapsUrl,
//                               child: const Icon(
//                                 Icons.location_on,
//                                 color: Colors.red,
//                                 size: 40,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
