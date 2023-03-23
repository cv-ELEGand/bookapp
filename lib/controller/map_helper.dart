import 'dart:convert';
import 'package:book_db/model/marker.dart';
import 'package:book_db/view/map_page.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

final Location location = Location();
bool serviceAndPermission = false;
List<MapMarker> markerList = [];

//check location service and permission status and get current location
Future getLocation() async {
  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return;
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  if (serviceEnabled && permissionGranted == PermissionStatus.granted) {
    serviceAndPermission = true;
  }

  locationData = await location.getLocation();
  centerLatLng = LatLng(locationData.latitude!, locationData.longitude!);
}


//gets markers locations
getMarkers() async {
  const String accessToken =
      "pk.eyJ1IjoibXlpbGRpcmltMCIsImEiOiJjbGZmZjAzbXYzYnQ3M3RvNHN3MWJsYjJ4In0.O7947PtGAeldVOIGvcCB7A";
  var searchUrl =
      "https://api.mapbox.com/geocoding/v5/mapbox.places/book.json?country=tr&bbox=${centerLatLng.longitude - 0.03}%2C${centerLatLng.latitude - 0.03}%2C${centerLatLng.longitude + 0.03}%2C${centerLatLng.latitude + 0.03}&limit=3&proximity=${centerLatLng.latitude}%2C${centerLatLng.longitude}&types=poi&language=tr&fuzzyMatch=true&access_token=$accessToken";
  var connect = GetConnect();
  var response = await connect.get(searchUrl);
  var r2 = Map.castFrom(jsonDecode(response.body));
  var results = r2.values.elementAt(2);
  for (var i = 0; i < 3; i++) {
    List<String> wholeAddress =
        results[i]["place_name"].toString().split(", ");
    var name = wholeAddress.first;
    wholeAddress.removeAt(0);
    var address = wholeAddress.join(", ");
    List coordinates = results[i]["geometry"]["coordinates"];
    double lng = coordinates.first;
    double lat = coordinates.last;
    markerList.add(MapMarker(name, address, lat, lng));
  }
}
