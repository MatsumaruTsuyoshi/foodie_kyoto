import 'package:foodie_kyoto/data/model/shop_model.dart';
import 'package:foodie_kyoto/data/remote/data_source_impl/shop_data_source_impl.dart';
import 'package:foodie_kyoto/data/remote/firestore_provider.dart';
import 'package:foodie_kyoto/data/repository/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final shopDataSourceProvider = Provider(
    (ref) => ShopDataSourceImpl(firestore: ref.read(firestoreProvider)));

abstract class ShopDataSource {
  Future<Result<List<ShopModel>>> fetchShops({required int limit, int? cursor});
}
