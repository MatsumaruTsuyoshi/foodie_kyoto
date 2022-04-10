import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'google_map_model.freezed.dart';

@freezed
class GoogleMapState with _$GoogleMapState {
  factory GoogleMapState({GoogleMapController? googleMapController}) =
      _GoogleMapState;

  factory GoogleMapState.creating() = _GoogleMapStateCreating;
}

class GoogleMapPageController extends StateNotifier<GoogleMapState> {
  GoogleMapPageController() : super(GoogleMapState.creating());

  void onMapCreated(controller) async {
    state = GoogleMapState(googleMapController: controller);
  }

  Future<void> goToTheLake({required CameraPosition position}) async {
    final currentState = state as _GoogleMapState;
    if (state is _GoogleMapState) {
      await currentState.googleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(position));
    }
  }
}
