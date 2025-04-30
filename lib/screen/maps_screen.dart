import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final dicodingOffice = const LatLng(-6.8957473, 107.6337669);
  late GoogleMapController mapController;

  final Set<Marker> markers = {};
  MapType selectedMapType = MapType.normal;

  final tourismPlaces = const [
    LatLng(-6.8168954, 107.6151046),
    LatLng(-6.8331128, 107.6048483),
    LatLng(-6.8668408, 107.608081),
    LatLng(-6.9218518, 107.6025294),
    LatLng(-6.780725, 107.637409),
  ];

  @override
  void initState() {
    super.initState();

    final marker = Marker(
      markerId: const MarkerId("dicoding"),
      position: dicodingOffice,
      onTap: () {
        mapController.animateCamera(
          CameraUpdate.newLatLngZoom(dicodingOffice, 18),
        );
      },
    );
    markers.add(marker);

    addManyMarker();
  }

  void addManyMarker() {
    for (var tourismPlace in tourismPlaces) {
      markers.add(
        Marker(
          markerId: MarkerId("Tourism $tourismPlace"),
          position: tourismPlace,
          onTap: () {
            mapController.animateCamera(
              CameraUpdate.newLatLngZoom(tourismPlace, 18),
            );
          },
        ),
      );
    }
  }

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
      northeast: LatLng(x1!, y1!),
      southwest: LatLng(x0!, y0!),
    );
  }

  Future<void> setMapStyle() async {
    String value = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/map_style.json');
    await mapController.setMapStyle(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            GoogleMap(
              // type map
              mapType: selectedMapType,
              // marker
              markers: markers,
              // zoom in and zoom out
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              initialCameraPosition: CameraPosition(
                zoom: 18,
                target: dicodingOffice,
              ),
              onMapCreated: (controller) async {
                setState(() {
                  mapController = controller;
                });

                final bound = boundsFromLatLngList([
                  dicodingOffice,
                  ...tourismPlaces,
                ]);
                mapController.animateCamera(
                  CameraUpdate.newLatLngBounds(bound, 50),
                );

                await setMapStyle();
              },
            ),

            Positioned(
              bottom: 16,
              right: 16,
              child: Column(
                children: [
                  FloatingActionButton.small(
                    heroTag: "zoom-in",
                    onPressed: () {
                      mapController.animateCamera(CameraUpdate.zoomIn());
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton.small(
                    heroTag: "zoom-out",
                    onPressed: () {
                      mapController.animateCamera(CameraUpdate.zoomOut());
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ),

            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton.small(
                onPressed: null,
                child: PopupMenuButton<MapType>(
                  onSelected: (MapType item) {
                    setState(() {
                      selectedMapType = item;
                    });
                  },
                  offset: const Offset(0, 54),
                  icon: const Icon(Icons.layers_outlined),
                  itemBuilder:
                      (BuildContext context) => <PopupMenuEntry<MapType>>[
                        const PopupMenuItem<MapType>(
                          value: MapType.normal,
                          child: Text('Normal'),
                        ),
                        const PopupMenuItem<MapType>(
                          value: MapType.satellite,
                          child: Text('Satellite'),
                        ),
                        const PopupMenuItem<MapType>(
                          value: MapType.terrain,
                          child: Text('Terrain'),
                        ),
                        const PopupMenuItem<MapType>(
                          value: MapType.hybrid,
                          child: Text('Hybrid'),
                        ),
                      ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
