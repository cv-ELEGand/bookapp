import 'package:book_db/controller/map_helper.dart';
import 'package:book_db/view/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart' as lottie;

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

LatLng centerLatLng = LatLng(38.963745, 35.243322);

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: locationFuture(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                body: FlutterMap(
              options: MapOptions(
                  center: centerLatLng, zoom: serviceAndPermission ? 13 : 6),
              nonRotatedChildren: [
                AttributionWidget(
                    attributionBuilder: (context) =>
                        const Text("© OpenStreetMap"))
              ],
              children: [
                TileLayer(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/myildirim0/clffh8974000601n4cejk4do9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibXlpbGRpcmltMCIsImEiOiJjbGZmZjAzbXYzYnQ3M3RvNHN3MWJsYjJ4In0.O7947PtGAeldVOIGvcCB7A",
                  additionalOptions: const {
                    "accessToken":
                        "pk.eyJ1IjoibXlpbGRpcmltMCIsImEiOiJjbGZmZjAzbXYzYnQ3M3RvNHN3MWJsYjJ4In0.O7947PtGAeldVOIGvcCB7A",
                    "id": "mapbox.mapbox-streets-v8"
                  },
                ),
                serviceAndPermission
                    ? MarkerLayer(
                        markers: [
                          Marker(
                              point: centerLatLng,
                              height: 80,
                              width: 80,
                              builder: (context) {
                                return IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                        FontAwesomeIcons.locationCrosshairs),
                                    color: Colors.red);
                              }),
                          Marker(
                              point: LatLng(markerList[0].latitude!,
                                  markerList[0].longitude!),
                              height: 80,
                              width: 80,
                              builder: (context) {
                                return IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                backgroundColor:
                                                    Colors.blue.shade100,
                                                title:
                                                    Text(markerList[0].name!),
                                                content: Text(
                                                    markerList[0].address!),
                                              ));
                                    },
                                    icon: const FaIcon(
                                        FontAwesomeIcons.locationDot),
                                    color: Colors.blue);
                              }),
                          Marker(
                              point: LatLng(markerList[1].latitude!,
                                  markerList[1].longitude!),
                              height: 80,
                              width: 80,
                              builder: (context) {
                                return IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                backgroundColor:
                                                    Colors.blue.shade100,
                                                title:
                                                    Text(markerList[1].name!),
                                                content: Text(
                                                    markerList[1].address!),
                                              ));
                                    },
                                    icon: const FaIcon(
                                        FontAwesomeIcons.locationDot),
                                    color: Colors.blue);
                              }),
                          Marker(
                              point: LatLng(markerList[2].latitude!,
                                  markerList[2].longitude!),
                              height: 80,
                              width: 80,
                              builder: (context) {
                                return IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                backgroundColor:
                                                    Colors.blue.shade100,
                                                title:
                                                    Text(markerList[2].name!),
                                                content: Text(
                                                    markerList[2].address!),
                                              ));
                                    },
                                    icon: const FaIcon(
                                        FontAwesomeIcons.locationDot),
                                    color: Colors.blue);
                              }),
                        ],
                      )
                    : const SizedBox()
              ],
            ));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: lottie.Lottie.asset("assets/reveal-loading.json"));
          } else {
            return const ErrorPage();
          }
        });
  }

  //get location and its permissions and get markers location data
  Future locationFuture() async {
    await getLocation().then((value) => getMarkers());
  }
}
