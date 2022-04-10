import 'package:flutter/material.dart';
import 'package:foodie_kyoto/ui/pages/google_map_page/google_map_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoogleMapPage extends HookConsumerWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(googleMapProvider);

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: ref.read(googleMapProvider.notifier).onMapCreated,
      ),
      floatingActionButton: state.when(
          (googleMapController) => FloatingActionButton.extended(
                onPressed: () => ref
                    .read(googleMapProvider.notifier)
                    .goToTheLake(position: _kLake),
                label: const Text('To the lake!'),
                icon: const Icon(Icons.directions_boat),
              ),
          creating: () => const SizedBox()),
    );
  }
}
