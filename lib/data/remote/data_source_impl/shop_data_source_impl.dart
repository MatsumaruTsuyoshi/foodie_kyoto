import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie_kyoto/data/model/shop_model.dart';
import 'package:foodie_kyoto/data/remote/data_source/shop_data_source.dart';
import 'package:foodie_kyoto/data/repository/result.dart';

class ShopDataSourceImpl implements ShopDataSource {
  ShopDataSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;
  final FirebaseFirestore _firestore;

  @override
  Future<Result<List<ShopModel>>> fetchShops(
      {required int limit, int? cursor}) async {
    final ref = _firestore.collection('shops');
    if (cursor == null) {
      final query = ref.orderBy('created_at', descending: true).limit(limit);

      try {
        final snapshot = await query.get();
        final shopList =
            snapshot.docs.map((e) => ShopModel.fromJson(e.data())).toList();
        return Success(shopList);
      } on Exception catch (e) {
        return Error(e);
      }
    } else {
      final query = ref
          .orderBy('created_at', descending: true)
          .startAt([cursor]).limit(limit);

      try {
        final snapshot = await query.get();
        final shopList =
            snapshot.docs.map((e) => ShopModel.fromJson(e.data())).toList();
        return Success(shopList);
      } on Exception catch (e) {
        return Error(e);
      }
    }
  }
}
