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
  get shopRepositoryStreamController => _shopRepositoryStreamController;

  final _shopRepositoryStreamController =
      StreamController<Stream<List<Shop>>>();

  @override
  set shopRepositoryStreamController(
          StreamController<Stream<List<Shop>>>?
              _shopRepositoryStreamController) =>
      _shopRepositoryStreamController;

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
                latitude: e.latitude,
                longitude: e.longitude,
                comment: e.comment,
                images: e.images,
                serviceTags: e.serviceTags,
                areaTags: e.areaTags,
                foodTags: e.foodTags,
                postUser: e.postUser,
                price: e.price))
            .toList()),
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
    final dataSourceResult = await _dataSource.fetchFilteredShops(
        latitude: latitude, longitude: longitude, radius: radius);

    return dataSourceResult.whenWithResult(
      (success) {
        _dataSource.shopDataSourceStreamController?.stream.listen((event) {
          final shopList = event.map((list) => list
              .map((e) => Shop(
                  name: e.name,
                  shopId: e.shopId,
                  latitude: e.latitude,
                  longitude: e.longitude,
                  comment: e.comment,
                  images: e.images,
                  serviceTags: e.serviceTags,
                  areaTags: e.areaTags,
                  foodTags: e.foodTags,
                  postUser: e.postUser,
                  price: e.price))
              .toList());

          _shopRepositoryStreamController.add(shopList);
        });
        return Success('SUCCESS');
      },
      (e) => Error(Exception(e)),
    );
  }
}
