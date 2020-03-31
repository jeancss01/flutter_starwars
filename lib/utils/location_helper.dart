import 'package:location/location.dart';

class LocationHelper {
  Location _currentLocation;

  LocationHelper() {
    _currentLocation = Location();
  }

  Future<bool> checkLocationEnabled() async {


    if (!(await _currentLocation.serviceEnabled())) {
      return await _currentLocation.requestService();
    }
    return true;
  }

  Future<bool> checkPermission() async {


    var permissionStatus = await _currentLocation.hasPermission();

    if (permissionStatus != PermissionStatus.GRANTED) {

      permissionStatus = await _currentLocation.requestPermission();

      return permissionStatus == PermissionStatus.GRANTED;

    } else {
      return true;
    }
  }

  Future<LocationData> getLocation() async {
    try {
      return await _currentLocation.getLocation();
    } catch (error) {
      return null;
    }
  }
}
