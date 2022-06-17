import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:foodie_kyoto/domain/entity/shop.dart';
import 'package:foodie_kyoto/domain/use_case/shop_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'google_map_model.freezed.dart';

@freezed
class GoogleMapState with _$GoogleMapState {
  factory GoogleMapState(
      {required GoogleMapController googleMapController,
      @Default([]) List<Shop> shopList,
      @Default(0) double radius,
      @Default(LatLng(35.01, 135.78)) LatLng center}) = _GoogleMapState;

  factory GoogleMapState.creating() = _GoogleMapStateCreating;

  factory GoogleMapState.error() = _GoogleMapStateError;
}

class GoogleMapPageController extends StateNotifier<GoogleMapState> {
  GoogleMapPageController(this._shopUseCase) : super(GoogleMapState.creating());

  final ShopUseCase _shopUseCase;

  void onMapCreated(controller) async {
    state = GoogleMapState(googleMapController: controller);
  }

  Future<void> goToTheLake({required CameraPosition position}) async {
    final currentState = state as _GoogleMapState;
    if (state is _GoogleMapState) {
      await currentState.googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(position));
    }
  }

  Future<void> searchShop() async {
    final currentState = state as _GoogleMapState;

    final latitude = currentState.center.latitude;
    final longitude = currentState.center.longitude;
    final radius = currentState.radius;

    final result = await _shopUseCase.fetchFilteredShops(
        latitude: latitude, longitude: longitude, radius: radius);

    result.whenWithResult(
      (success) {
        _shopUseCase.shopUseCaseStreamController.stream.listen((event) {
          event.listen((list) {
            state = currentState.copyWith(shopList: list);
          });
        });
      },
      (e) => state = GoogleMapState.error(),
    );
  }

  Future<void> getCenterLocation() async {
    if (state is _GoogleMapState) {
      final currentState = state as _GoogleMapState;
      final controller = currentState.googleMapController;

      final region = await controller.getVisibleRegion();
      final centerLat =
          (region.northeast.latitude + region.southwest.latitude) / 2;
      final centerLng =
          (region.northeast.longitude + region.southwest.longitude) / 2;

      state = currentState.copyWith(center: LatLng(centerLat, centerLng));
    }
  }

  Future<double?> getZoomLevel() async {
    if (state is _GoogleMapState) {
      final currentState = state as _GoogleMapState;
      final controller = currentState.googleMapController;

      final zoomLevel = await controller.getZoomLevel();
      return zoomLevel;
    }
    return null;
  }

  Future<void> getMapRadiusKiloMeter() async {
    final currentState = state as _GoogleMapState;

    double mapRadiusM = 150000;
    final zoomLevel = await getZoomLevel();
    if (zoomLevel != null) {
      final _zoomLevel = zoomLevel;
      if (_zoomLevel > 8) {
        mapRadiusM = mapRadiusM / pow(2, _zoomLevel - 8);
      }
    }
    final mapRadiusKiloMeter = mapRadiusM / 1000;
    state = currentState.copyWith(radius: mapRadiusKiloMeter);
  }

  Future<void> onCameraMove(CameraPosition position) async {
    if (state is _GoogleMapState) {
      final currentState = state as _GoogleMapState;
      final currentRadius = currentState.radius;

      final currentCenter = currentState.center;
      final currentLat = currentCenter.latitude;
      final currentLng = currentCenter.longitude;

      final cameraUpdate = CameraUpdate.newCameraPosition(position);
      currentState.googleMapController.animateCamera(cameraUpdate);

      await getMapRadiusKiloMeter();
      await getCenterLocation();

      final updatedState = state as _GoogleMapState;
      final updatedRadius = updatedState.radius;

      final updatedCenter = updatedState.center;
      final updatedLat = updatedCenter.latitude;
      final updatedLng = updatedCenter.longitude;

      final dCenter = sqrt(
          pow(2, updatedLat - currentLat) + pow(2, updatedLng - currentLng));

      final dx = updatedRadius - currentRadius + dCenter;
      final result = await _shopUseCase.onChangeMapRadius(dx: dx);

      result.whenWithResult((success) {
        debugPrint(success.value);
      }, (e) {
        debugPrint('$e');
      });
    }
  }
}
