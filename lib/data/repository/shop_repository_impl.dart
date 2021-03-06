import 'package:foodie_kyoto/data/remote/data_source/shop_data_source.dart';
import 'package:foodie_kyoto/data/model/result.dart';
import 'package:foodie_kyoto/domain/entity/shop.dart';
import 'package:foodie_kyoto/domain/repository/shop_repository.dart';
import 'dart:async';

class ShopRepositoryImpl implements ShopRepository {
  ShopRepositoryImpl({required ShopDataSource dataSource})
      : _dataSource = dataSource;
  final ShopDataSource _dataSource;

  @override
  Future<Result<List<Shop>>> fetchShops(
      {required int limit, String? cursor}) async {
    final appShopList =
        await _dataSource.fetchShops(limit: limit, cursor: cursor);

    return appShopList.whenWithResult(
        (data) => Success(data.value
            .map((e) => Shop(
                name: e.name,
                shopId: e.shopId,
                comment: e.comment,
                images: e.images,
                tags: e.tags))
            .toList()),
        (e) => Error(Exception(e)));
  }
}
