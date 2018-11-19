#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_locations_distance'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter package which provides the distance between two locations'
  s.description      = <<-DESC
A Flutter package which provides the distance between two locations
                       DESC
  s.homepage         = 'https://github.com/eimji/flutter_locations_distance'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Eimji' => 'contact@eimji.io' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '8.0'
end

