import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodie_kyoto/data/remote/firestore_provider.dart';
import 'package:foodie_kyoto/data/repository/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final shopFirestoreProvider = Provider<ShopFirestore>(
    (ref) => ShopFirestore(firestore: ref.read(firestoreProvider)));

class ShopFirestore {
  ShopFirestore({required FirebaseFirestore firestore})
      : _firestore = firestore;
  final FirebaseFirestore _firestore;

  Future<Result<QuerySnapshot<Map<String, dynamic>>>> fetchShops(
      {required int limit, String? cursor}) async {
    final ref = _firestore.collection('shops');
    if (cursor == null) {
      final query = ref.orderBy('shop_id', descending: false).limit(limit);

      try {
        final snapshot = await query.get();
        return Success(snapshot);
      } on Exception catch (e) {
        return Error(e);
      }
    } else {
      final query = ref
          .orderBy('shop_id', descending: false)
          .startAfter([cursor]).limit(limit);

      try {
        final snapshot = await query.get();
        return Success(snapshot);
      } on Exception catch (e) {
        return Error(e);
      }
    }
  }
}
