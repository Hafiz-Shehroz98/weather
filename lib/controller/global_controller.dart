import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_task/api/fetch_weather.dart';
import 'package:weather_task/model/weather_data.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _lat = 0.0.obs;
  final RxDouble _lng = 0.0.obs;
  final RxInt _currentIndex = 0.obs;
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lat;
  RxDouble grtLongitude() => _lng;
  final weatherData = WeatherData().obs;
  WeatherData getWeatherData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }

    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    // return is service is enabled
    if (!isServiceEnabled) {
      return Future.error('Location not enabled');
    }
    // location permission
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location Permission Denied Forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location Permission is Denied");
      }
    }
    // getting current  position
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      //update lat and lng
      _lat.value = value.latitude;
      _lng.value = value.longitude;
      //calling our weather api
      return FetchWeatherApi()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }

  RxInt getIndex() {
    return _currentIndex;
  }
}
