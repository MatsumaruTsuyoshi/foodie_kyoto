import 'dart:async';

import 'package:foodie_kyoto/data/model/shop_model.dart';
import 'package:foodie_kyoto/data/remote/data_source/shop_data_source.dart';
import 'package:foodie_kyoto/data/remote/data_source_impl/firestore_data_source/shop_firestore.dart';
import 'package:foodie_kyoto/data/model/result.dart';
import 'package:rxdart/rxdart.dart';

class ShopDataSourceImpl implements ShopDataSource {
  ShopDataSourceImpl({required ShopFirestore shopFirestore})
      : _shopFirestore = shopFirestore;
  final ShopFirestore _shopFirestore;

  @override
  get shopDataSourceStreamController => _shopDataSourceStreamController;

  final _shopDataSourceStreamController =
      StreamController<Stream<List<ShopModel>>>();

  @override
  set shopDataSourceStreamController(
          StreamController<Stream<List<ShopModel>>>?
              _shopDataSourceStreamController) =>
      _shopDataSourceStreamController;

  @override
  get shopDataSourceRadius => _shopDataSourceRadius;

  BehaviorSubject _shopDataSourceRadius = BehaviorSubject<double>.seeded(1.0);

  @override
  set shopDataSourceRadius(BehaviorSubject? _shopDataSourceRadius) =>
      _shopDataSourceRadius;

  @override
  Future<Result<List<ShopModel>>> fetchShops(
      {required int limit, String? cursor}) async {
    final snapshotResult =
        await _shopFirestore.fetchShops(limit: limit, cursor: cursor);
    return snapshotResult.whenWithResult(
        (data) => Success(
            data.value.docs.map((e) => ShopModel.fromJson(e.data())).toList()),
        (e) => Error(Exception(e)));
  }

  @override
  Future<Result<String>> fetchFilteredShops(
      {required double latitude,
      required double longitude,
      required double radius,
      int? minPrice,
      int? maxPrice,
      List<int>? serviceTags,
      List<int>? areaTags,
      List<int>? foodTags}) async {
    final shopResult = await _shopFirestore.fetchFilteredShops(
        latitude: latitude, longitude: longitude, radius: radius);

    return shopResult.whenWithResult(
      (success) {
        _shopFirestore.shopFirestoreStreamController.stream.listen((event) {
          _shopDataSourceRadius = _shopFirestore.shopFirestoreRadius;
          final shopModel = event.map((list) =>
              list.map((e) => ShopModel.fromJson(e.data()!)).toList());

          _shopDataSourceStreamController.add(shopModel);
        });

        return Success('SUCCESS');
      },
      (e) => Error(Exception(e)),
    );
  }

  @override
  Future<Result<String>> onChangeMapRadius({required double dx}) async {
    final result = await _shopFirestore.onChangeMapRadius(dx: dx);

    return result.whenWithResult((success) {
      _shopDataSourceRadius.add(dx);
      return Success('SUCCESS');
    }, (e) {
      return Error(Exception(e));
    });
  }
}
