import 'dart:async';

import 'package:foodie_kyoto/data/remote/data_source/shop_data_source.dart';
import 'package:foodie_kyoto/data/model/result.dart';
import 'package:foodie_kyoto/data/repository/shop_repository_impl.dart';
import 'package:foodie_kyoto/domain/entity/shop.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final shopRepositoryProvider = Provider<ShopRepositoryImpl>(
    (ref) => ShopRepositoryImpl(dataSource: ref.read(shopDataSourceProvider)));

abstract class ShopRepository {
  StreamController<Stream<List<Shop>>>? shopRepositoryStreamController;
  BehaviorSubject? shopRepositoryRadius;

  Future<Result<List<Shop>>> fetchShops({required int limit, String? cursor});

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
