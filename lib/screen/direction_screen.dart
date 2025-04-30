import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../model/direction.dart';

class DirectionScreen extends StatefulWidget {
  const DirectionScreen({super.key});

  @override
  State<DirectionScreen> createState() => _DirectionScreenState();
}

class _DirectionScreenState extends State<DirectionScreen> {
  late GoogleMapController mapController;
  late final Set<Marker> markers = {};
  final dicodingOffice = const LatLng(-6.8957473, 107.6337669);
  final gedungSateLatLng = const LatLng(-6.902525, 107.618796);

  final Set<Polyline> polylines = <Polyline>{};

  final Location location = Location();
  bool isNavigationOn = false;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await setupLocation();
    });

    location.onLocationChanged.listen((currentLocation) {
      if (isNavigationOn) {
        final latLng = LatLng(
          currentLocation.latitude!,
          currentLocation.longitude!,
        );
        CameraPosition cPosition = CameraPosition(
          zoom: 16,
          tilt: 80,
          bearing: 30,
          target: latLng,
        );
        mapController.animateCamera(CameraUpdate.newCameraPosition(cPosition));

        setState(() {
          markers.removeWhere((m) => m.markerId.value == 'source');
          markers.add(
            Marker(
              markerId: const MarkerId('source'),
              position: latLng,
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueRose,
              ),
            ),
          );
        });
      }
    });
  }

  Future<void> setupLocation() async {
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print("Location services is not available");
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Location permission is denied");
        return;
      }
    }
  }

  Future<void> setPolylines(LatLng source, LatLng destination) async {
    final result = await Direction.getDirections(
      googleMapsApiKey: "AIzaSyA3ZraRa5Ht4nSx-b9giOrfUbHOOpMpVJU",
      origin: source,
      destination: destination,
    );

    final polylineCoordinates = <LatLng>[];
    if (result != null && result.polylinePoints.isNotEmpty) {
      polylineCoordinates.addAll(result.polylinePoints);
    }
    final polyline = Polyline(
      polylineId: const PolylineId('default-polyline'),
      color: Colors.blue,
      width: 7,
      points: polylineCoordinates,
    );
    setState(() {
      polylines.add(polyline);
    });
    mapController.animateCamera(
      CameraUpdate.newLatLngBounds(result!.bounds, 50),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                zoom: 18,
                target: dicodingOffice,
              ),

              markers: markers,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              myLocationButtonEnabled: false,

              onMapCreated: (controller) async {
                final dicodingMarker = Marker(
                  markerId: const MarkerId("source"),
                  position: dicodingOffice,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed,
                  ),
                );

                final gedungSateMarker = Marker(
                  markerId: const MarkerId("destination"),
                  position: gedungSateLatLng,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed,
                  ),
                );

                setState(() {
                  mapController = controller;
                  markers.addAll([dicodingMarker, gedungSateMarker]);
                });
              },

              //polylines: polylines,
            ),

            Positioned(
              bottom: 16,
              right: 16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      setState(() {
                        isNavigationOn = false;
                        markers.removeWhere(
                          (m) => m.markerId.value == 'source',
                        );
                        markers.add(
                          Marker(
                            markerId: const MarkerId('source'),
                            position: dicodingOffice,
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueRed,
                            ),
                          ),
                        );
                      });

                      await setPolylines(dicodingOffice, gedungSateLatLng);
                    },
                    child: const Icon(Icons.directions),
                  ),

                  const SizedBox(height: 8),
                  FloatingActionButton(
                    onPressed: () async {
                      setState(() {
                        isNavigationOn = true;
                      });
                    },
                    child: const Icon(Icons.navigation),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
