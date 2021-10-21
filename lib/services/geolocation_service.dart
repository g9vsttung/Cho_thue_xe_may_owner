import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoLocatorCustom {
  Future<LatLng> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final postion = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);

    return LatLng(postion.latitude, postion.longitude);
  }

  Future<String> getAddress() async {
    final _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    String yourAdress = "";

    var address = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(_position.latitude, _position.longitude));
    yourAdress = address.first.addressLine;

    return yourAdress;
  }

  Future<String> getCityName() async {
    final _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    String yourCityName = "";

    var address = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(_position.latitude, _position.longitude));
    yourCityName = address.first.adminArea.replaceAll('Thành phố ', '');

    return yourCityName;
  }
}
