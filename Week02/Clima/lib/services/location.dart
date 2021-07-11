import 'package:geolocator/geolocator.dart';

class Location{
  double _longitude, _latitude;
  void getCurrentLocation()async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
     _latitude = position.latitude;
     _longitude = position.longitude;
      print('Latitude:  $_latitude , Longitude : $_longitude');
    } catch (e) {
      print(e);
      throw e;
    }
  }
  double getLatitude(){return _latitude;}
  double getLongitude(){return _longitude;}
}