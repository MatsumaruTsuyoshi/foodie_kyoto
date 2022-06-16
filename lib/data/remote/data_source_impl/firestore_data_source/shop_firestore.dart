import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie_kyoto/data/remote/firestore_provider.dart';
import 'package:foodie_kyoto/data/model/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

final shopFirestoreProvider = Provider<ShopFirestore>(
    (ref) => ShopFirestore(firestore: ref.read(firestoreProvider)));

class ShopFirestore {
  ShopFirestore({required FirebaseFirestore firestore})
      : _firestore = firestore;
  final FirebaseFirestore _firestore;

  final shopFirestoreStreamController =
      StreamController<Stream<List<DocumentSnapshot<Map<String, Object?>>>>>();

  BehaviorSubject shopFirestoreRadius = BehaviorSubject<double>.seeded(1.0);

  Future<Result<QuerySnapshot<Map<String, dynamic>>>> fetchShops(
      {required int limit, String? cursor}) async {
    final ref = _firestore.collection('shops');
    if (cursor == null) {
      final query = ref.orderBy('shop_id', descending: false).limit(limit);

      try {
        final snapshot = await query.get();
        return Success(snapshot);
      } on Exception catch (e) {
        return Error(e);
      }
    } else {
      final query = ref
          .orderBy('shop_id', descending: false)
          .startAfter([cursor]).limit(limit);

      try {
        final snapshot = await query.get();
        return Success(snapshot);
      } on Exception catch (e) {
        return Error(e);
      }
    }
  }

  Future<Result<String>> fetchFilteredShops(
      {required double latitude,
      required double longitude,
      required double radius,
      int? minPrice,
      int? maxPrice,
      List<int>? serviceTags,
      List<int>? areaTags,
      List<int>? foodTags}) async {
    final geo = Geoflutterfire();
    final center = geo.point(latitude: latitude, longitude: longitude);
    final ref = _firestore
        .collection('shops')
        .where('price', isGreaterThanOrEqualTo: minPrice)
        .where('price', isLessThanOrEqualTo: maxPrice)
        .where('service_tags', arrayContainsAny: serviceTags)
        .where('area_tags', arrayContainsAny: areaTags)
        .where('food_tags', arrayContainsAny: foodTags);

    shopFirestoreRadius = BehaviorSubject<dynamic>.seeded(radius);

    try {
      // マップ移動したらonChangeMapRadiusが呼ばれ、shopFirestoreRadiusが変更される。
      // shopFirestoreRadiusが変更されたらswitchMapが作動し検索半径が変更される。
      final snapshot = shopFirestoreRadius.switchMap((rad) {
        return geo
            .collection(collectionRef: ref)
            .within(center: center, radius: rad, field: 'position');
      });
      shopFirestoreStreamController.add(snapshot.cast());
      return Success('SUCCESS');
    } on Exception catch (e) {
      return Error(e);
    }
  }

  Future<Result<String>> onChangeMapRadius({required double dx}) async {
    try {
      shopFirestoreRadius.add(dx);
      return Success('SUCCESS');
    } on Exception catch (e) {
      return Error(e);
    }
  }
}
