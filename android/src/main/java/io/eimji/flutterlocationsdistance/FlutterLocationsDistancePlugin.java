package io.eimji.flutterlocationsdistance;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

import java.util.Map;
import android.location.Location;

class Coordinate {
    public final double latitude;
    public final double longitude;

    public Coordinate(double latitude, double longitude) {
        this.latitude = latitude;
        this.longitude = longitude;
    }
}

/** FlutterLocationsDistancePlugin */
public class FlutterLocationsDistancePlugin implements MethodCallHandler {
  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter.eimji.io/flutter_locations_distance");
    channel.setMethodCallHandler(new FlutterLocationsDistancePlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("distanceBetween")) {
      receiveDistanceBetweenLocations(call.arguments, result);
    } else {
      result.notImplemented();
    }
  }

  private static void receiveDistanceBetweenLocations(Object arguments, Result flutterResult) {
    // parse arguments to get coordiantes
    Coordinate sourceCoordinate;
    Coordinate destinationCoordinate;

    if(arguments == null) {
        throw new IllegalArgumentException("No coordinates supplied to calculate distance between.");
    }

    @SuppressWarnings("unchecked")
    Map<String, Double> coordinates = (Map<String, Double>)arguments;

    if(coordinates == null)
        throw new IllegalArgumentException("No coordinates supplied to calculate distance between.");

    sourceCoordinate = new Coordinate(
            coordinates.get("startLatitude"),
            coordinates.get("startLongitude"));
    destinationCoordinate = new Coordinate(
            coordinates.get("endLatitude"),
            coordinates.get("endLongitude"));    

    if(sourceCoordinate == null || destinationCoordinate == null) {
        flutterResult.error(
                "ERROR_CALCULATE_DISTANCE_INVALID_PARAMS",
                "Please supply start and end coordinates.",
                null);
    }

    float[] results = new float[1];

    try {
        Location.distanceBetween(
                sourceCoordinate.latitude,
                sourceCoordinate.longitude,
                destinationCoordinate.latitude,
                destinationCoordinate.longitude,
                results);

        // According to the Android documentation the distance is
        // always stored in the first position of the result array
        // (see: https://developer.android.com/reference/android/location/Location.html#distanceBetween(double,%20double,%20double,%20double,%20float[]))
        flutterResult.success(results[0]);
    } catch(IllegalArgumentException ex) {
        flutterResult.error(
                "ERROR_CALCULATE_DISTANCE_ILLEGAL_ARGUMENT",
                ex.getLocalizedMessage(),
                null);
    }
  }
}
