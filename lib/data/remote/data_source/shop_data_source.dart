import 'dart:async';

import 'package:foodie_kyoto/data/model/shop_model.dart';
import 'package:foodie_kyoto/data/remote/data_source_impl/firestore_data_source/shop_firestore.dart';
import 'package:foodie_kyoto/data/remote/data_source_impl/model_data_source_impl/shop_data_source_impl.dart';
import 'package:foodie_kyoto/data/model/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final shopDataSourceProvider = Provider<ShopDataSourceImpl>((ref) =>
    ShopDataSourceImpl(shopFirestore: ref.read(shopFirestoreProvider)));

abstract class ShopDataSource {
  StreamController<Stream<List<ShopModel>>>? shopDataSourceStreamController;
  BehaviorSubject? shopDataSourceRadius;

  Future<Result<List<ShopModel>>> fetchShops(
      {required int limit, String? cursor});

  Future<Result<String>> fetchFilteredShops(
      {required double latitude,
      required double longitude,
      required double radius,
      int? minPrice,
      int? maxPrice,
      List<int>? serviceTags,
      List<int>? areaTags,
      List<int>? foodTags});

  Future<Result<String>> onChangeMapRadius({required double dx});
}
