import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class BackCard extends StatelessWidget {
  static final Completer<GoogleMapController> mController = Completer();
  final double lat;
  final double long;

  BackCard({this.lat, this.long});

//33.071153, -96.704665

  @override
  Widget build(BuildContext context) {
//    var markerIdVal = MyWayToGenerateId();
    final MarkerId markerId = MarkerId("24213");
    Set<Marker> mrks = new Set<Marker>();
    Marker marker = new Marker(
        markerId: markerId,
        position: LatLng(
          lat,
          long,
        ));
    mrks.add(marker);
    return Container(
//        height: 300,
//        width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: SizedBox(
                      height: 300,
                      width: 300,
//                      child: Text("HERE"),

                      child: GoogleMap(
                        mapType: MapType.normal,
                        myLocationButtonEnabled: false,
                        zoomGesturesEnabled: false,
                        rotateGesturesEnabled: false,
                        scrollGesturesEnabled: false,
                        myLocationEnabled: false,
                        compassEnabled: false,
                        mapToolbarEnabled: false,

                        initialCameraPosition: CameraPosition(
                            target: LatLng(lat, long), zoom: 15.0),
                        markers: mrks,
//        markers: mapInfo.fireMarkers,
                        onMapCreated: (GoogleMapController controller) async {
//          SharedPreferences prefs = await SharedPreferences.getInstance();
//          controller.setMapStyle(mapInfo.mapStyle);
                          mController.complete(controller);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

//      Container(
//      child: GoogleMap(
//        mapType: MapType.normal,
//        myLocationButtonEnabled: false,
//        zoomGesturesEnabled: false,
//        rotateGesturesEnabled: false,
//        scrollGesturesEnabled: false,
//        initialCameraPosition:
//            CameraPosition(target: LatLng(lat, long), zoom: 10.0),
////        markers: mapInfo.fireMarkers,
//        onMapCreated: (GoogleMapController controller) async {
////          SharedPreferences prefs = await SharedPreferences.getInstance();
////          controller.setMapStyle(mapInfo.mapStyle);
//          mController.complete(controller);
//        },
//      ),
//    );
  }
}
