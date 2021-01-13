# flutter-piScreen

Flutter-PiScreen is a WIP timetable for swiss transportation (SBB) which will show the next leaving trains from a given station. This includes delays and potentially platform changes.  

This project is intended to run on the official [Raspberry Pi Touch Display](https://www.raspberrypi.org/products/raspberry-pi-touch-display/). Although it should run on any platform, that supports flutter.

## Build
1. Clone repository  
`$ git clone git@github.com:luismeier/flutter-piScreen.git && cd flutter-piScreen`
2. Get Flutter packages  
`$ flutter pub get`
3. Build  
`$ flutter build bundle`
4. Copy to pi
`$ rsync -a ./build/flutter_assets/ pi@raspberrypi:/home/pi/piScreen`


##  Run
To run flutter on the RaspberryPi use the awesome [flutter-pi](https://github.com/ardera/flutter-pi) project by ardera.


