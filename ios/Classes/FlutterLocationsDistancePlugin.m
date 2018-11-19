#import "FlutterLocationsDistancePlugin.h"
#import <flutter_locations_distance/flutter_locations_distance-Swift.h>

@implementation FlutterLocationsDistancePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterLocationsDistancePlugin registerWithRegistrar:registrar];
}
@end
