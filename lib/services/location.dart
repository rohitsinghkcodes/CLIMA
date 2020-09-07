import 'package:geolocator/geolocator.dart';

class Location {
  double Latitude;
  double Longitude;
  Future<void> getGeoLocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      Latitude = position.latitude;
      Longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
