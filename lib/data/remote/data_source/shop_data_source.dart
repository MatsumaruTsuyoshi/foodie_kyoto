import 'package:foodie_kyoto/data/model/shop_model.dart';
import 'package:foodie_kyoto/data/remote/data_source_impl/firestore_data_source/shop_firestore.dart';
import 'package:foodie_kyoto/data/remote/data_source_impl/model_data_source_impl/shop_data_source_impl.dart';
import 'package:foodie_kyoto/data/repository/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final shopDataSourceProvider = Provider<ShopDataSourceImpl>((ref) =>
    ShopDataSourceImpl(shopFirestore: ref.read(shopFirestoreProvider)));

abstract class ShopDataSource {
  Future<Result<List<ShopModel>>> fetchShops(
      {required int limit, String? cursor});
}
