import 'dart:async';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

class FlutterLocationsDistance {
  factory FlutterLocationsDistance() {
    if (_instance == null) {
      final MethodChannel methodChannel =
          const MethodChannel('flutter.eimji.io/flutter_locations_distance');
      _instance = new FlutterLocationsDistance.private(methodChannel);
    }
    return _instance;
  }

  @visibleForTesting
  FlutterLocationsDistance.private(this._methodChannel);

  static FlutterLocationsDistance _instance;

  final MethodChannel _methodChannel;


  /// Returns the distance between the supplied coordinates in meters.
  Future<double> distanceBetween(double startLatitude, double startLongitude,
    double endLatitude, double endLongitude) =>
      _methodChannel.invokeMethod('distanceBetween', <String, double>{
        "startLatitude": startLatitude,
        "startLongitude": startLongitude,
        "endLatitude": endLatitude,
        "endLongitude": endLongitude
      }).then<double>((dynamic result) => result);
}
