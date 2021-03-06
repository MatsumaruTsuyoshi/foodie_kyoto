import 'package:foodie_kyoto/data/model/result.dart';
import 'package:foodie_kyoto/domain/entity/shop.dart';
import 'package:foodie_kyoto/domain/repository/shop_repository.dart';
import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final shopUseCaseProvider = Provider<ShopUseCase>(
    (ref) => ShopUseCase(repository: ref.read(shopRepositoryProvider)));

class ShopUseCase extends ShopRepository {
  ShopUseCase({required ShopRepository repository}) : _repository = repository;

  final ShopRepository _repository;

  @override
  Future<Result<List<Shop>>> fetchShops({required int limit, String? cursor}) =>
      _repository.fetchShops(limit: limit, cursor: cursor);
}
