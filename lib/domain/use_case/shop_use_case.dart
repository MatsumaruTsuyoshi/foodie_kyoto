import 'package:foodie_kyoto/data/model/result.dart';
import 'package:foodie_kyoto/domain/entity/shop.dart';
import 'package:foodie_kyoto/domain/repository/shop_repository.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final shopUseCaseProvider = Provider<ShopUseCase>(
    (ref) => ShopUseCase(repository: ref.read(shopRepositoryProvider)));

class ShopUseCase {
  ShopUseCase({required ShopRepository repository}) : _repository = repository;

  final ShopRepository _repository;
  final shopUseCaseStreamController = StreamController<Stream<List<Shop>>>();
  BehaviorSubject shopUseCaseRadius = BehaviorSubject<double>.seeded(1.0);

  Future<Result<List<Shop>>> fetchShops({required int limit, String? cursor}) =>
      _repository.fetchShops(limit: limit, cursor: cursor);

  Future<Result<String>> fetchFilteredShops(
      {required double latitude,
      required double longitude,
      required double radius,
      int? minPrice,
      int? maxPrice,
      List<int>? serviceTags,
      List<int>? areaTags,
      List<int>? foodTags}) async {
    final result = await _repository.fetchFilteredShops(
        latitude: latitude, longitude: longitude, radius: radius);

    return result.whenWithResult(
      (success) {
        _repository.shopRepositoryStreamController?.stream.listen((event) {
          if (_repository.shopRepositoryRadius != null) {
            shopUseCaseRadius = _repository.shopRepositoryRadius!;
          }
          shopUseCaseStreamController.add(event);
        });

        return Success('SUCCESS');
      },
      (e) => Error(Exception(e)),
    );
  }

  Future<Result<String>> onChangeMapRadius({required double dx}) async {
    final result = await _repository.onChangeMapRadius(dx: dx);

    return result.whenWithResult((success) {
      shopUseCaseRadius.add(dx);
      return Success('SUCCESS');
    }, (e) {
      return Error(Exception(e));
    });
  }
}
