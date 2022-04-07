import 'package:foodie_kyoto/data/remote/data_source/shop_data_source.dart';
import 'package:foodie_kyoto/data/repository/result.dart';
import 'package:foodie_kyoto/data/repository/shop_repository_impl.dart';
import 'package:foodie_kyoto/domain/entity/shop.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final shopRepositoryProvider = Provider<ShopRepositoryImpl>(
    (ref) => ShopRepositoryImpl(dataSource: ref.read(shopDataSourceProvider)));

abstract class ShopRepository {
  Future<Result<List<Shop>>> fetchShops({required int limit, int? cursor});
}
