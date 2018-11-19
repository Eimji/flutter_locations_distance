# flutter_locations_distance

A Flutter package which provides the distance between two locations
* [See the example folder](https://github.com/Eimji/flutter_locations_distance/tree/master/example)

## Installation

* Add this to your package's pubspec.yaml file:
```
dependencies:
  flutter_locations_distance: "^0.0.1"
```
* You can install packages from the command line:
  with Flutter:
```
$ flutter packages get
```

* Import it now in your Dart code:
```
 import 'package:flutter_locations_distance/flutter_locations_distance.dart';
```


## Usage
* Code
```
    double distance;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      distance = await FlutterLocationsDistance().distanceBetween(48.8438543, -3.5232399, 48.8589507, 2.2770204);
    } on PlatformException {
      distance = -1.0;
    }
```


## Getting Started with Flutter

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/developing-packages/#edit-plugin-package).
