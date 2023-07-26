import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_map_markers/custom_map_markers.dart';

import '../handlers/LoginSignupHandler.dart';
import 'home.dart';

class SOSMessageScreen extends StatefulWidget {
  const SOSMessageScreen({super.key});

  @override
  State<SOSMessageScreen> createState() => _SOSMessageScreenState();
}

class _SOSMessageScreenState extends State<SOSMessageScreen> {
  List<MarkerData> _customMarkers = [];
  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  String? _currentAddress = "";
  Position? _currentPosition;

  var lat = 24.8820169;
  var lng = 67.0812089;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    try {
      final hasPermission = await _handleLocationPermission();

      if (!hasPermission) return;
      var position = await Geolocator.getCurrentPosition();

      _currentPosition = position;

      lat = _currentPosition!.latitude;
      lng = _currentPosition!.longitude;

      _customMarkers = [
        MarkerData(
            marker: Marker(
                markerId: const MarkerId('id-1'), position: LatLng(lat, lng)),
            child: _customMarker()),
      ];
      await _getAddressFromLatLng(_currentPosition!);
    } catch (e) {}

    setState(() {});
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = placemarks[0];

      _currentAddress =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      await LoginSignupHandler().sendsos(_currentPosition?.latitude.toString(),
          _currentPosition!.longitude.toString(), _currentAddress);
      setState(() {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F2F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(9.0),
          child: CircleIconButton(
            backgroundColor: Color(0xFF007AB6),
            icon: Icons.arrow_back,
            iconColor: Colors.white,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "SOS",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "911, Emergency Contact",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff6C6C6C).withOpacity(0.53),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: CustomGoogleMapMarkerBuilder(
                  screenshotDelay: const Duration(seconds: 4),
                  customMarkers: _customMarkers,
                  builder: (BuildContext context, Set<Marker>? markers) {
                    if (markers == null) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Column(
                      children: [
                        Container(
                          height: 230,
                          width: 315,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 10.w,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: LatLng(lat, lng),
                                zoom: 14,
                              ),
                              markers: markers,
                              onMapCreated: (GoogleMapController controller) {},
                            ),
                          ),
                        ),
                        Container(
                          width: 315,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                              bottomRight: Radius.circular(10.r),
                            ),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.r, vertical: 10.r),
                              child: Text(
                                "$_currentAddress ",
                              ),
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "21:30",
                                style: TextStyle(
                                    fontSize: 14.sp, color: Color(0xff667080)),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),

              80.verticalSpace,

              // Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              // Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              // Text('ADDRESS: ${_currentAddress ?? ""}'),
              // const SizedBox(height: 32),
              // ElevatedButton(
              //   onPressed: _getCurrentPosition,
              //   child: const Text("Get Current Location"),
              // )
            ],
          ),
        ],
      ),
    );
  }

  _customMarker() {
    return Container(
        child: Image.asset(
      "assets/Group 921@3x.png",
      scale: 3.5,
      color: Color(0xff43B2FF),
    ));
  }
}
