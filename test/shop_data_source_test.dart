import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodie_kyoto/data/model/shop_model.dart';
import 'package:foodie_kyoto/data/remote/data_source/shop_data_source.dart';
import 'package:foodie_kyoto/data/remote/data_source_impl/firestore_data_source/shop_firestore.dart';
import 'package:foodie_kyoto/data/remote/data_source_impl/model_data_source_impl/shop_data_source_impl.dart';
import 'package:foodie_kyoto/data/model/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'shop_data_source_test.mocks.dart';

@GenerateMocks([ShopFirestore])
Future<void> main() async {
  final _shopFirestore = MockShopFirestore();
  final _firestore = FakeFirebaseFirestore();

  final container = ProviderContainer(overrides: [
    // ShopDataSourceImplで読み込むfirestoreProviderをFakeFirebaseFirestoreにしたいので以下を定義
    shopFirestoreProvider.overrideWithProvider(
        Provider<ShopFirestore>((ref) => ShopFirestore(firestore: _firestore))),
    shopDataSourceProvider.overrideWithProvider(Provider<ShopDataSourceImpl>(
        (ref) =>
            ShopDataSourceImpl(shopFirestore: ref.read(shopFirestoreProvider))))
  ]);

  await _firestore.collection('shops').add(
    <String, dynamic>{
      'name': 'name_1',
      'shop_id': 'shop_id_1',
      'position': {
        'geohash': 'xn0x1ktq9',
        'geopoint': const GeoPoint(35.006323, 135.765321),
      },
      'comment': 'comment_1',
      'images': ['image1', 'image2'],
      'service_tags': [1, 2],
      'area_tags': [3, 4],
      'food_tags': [5, 6],
      'post_user': 'user1',
      'price': 3000,
      'created_at': DateTime(2020, 1, 1),
    },
  );

  await _firestore.collection('shops').add(
    <String, dynamic>{
      'name': 'name_2',
      'shop_id': 'shop_id_2',
      'position': {
        'geohash': 'xn0x1ktq9',
        'geopoint': const GeoPoint(35.006323, 135.765321),
      },
      'comment': 'comment_2',
      'images': ['image1', 'image2'],
      'service_tags': [1, 2],
      'area_tags': [3, 4],
      'food_tags': [5, 6],
      'post_user': 'user1',
      'price': 1000,
      'created_at': DateTime.now(),
    },
  );

  group('fetch shops test', () {
    test('when cursor is null', () async {
      // shop_firestoreのfetchShops内のデータ取得部分をmockする
      when(_shopFirestore.fetchShops(limit: 10)).thenAnswer((_) async {
        try {
          final snapshot = await _firestore
              .collection('shops')
              .orderBy('shop_id', descending: false)
              .limit(10)
              .get();
          return Success(snapshot);
        } on Exception catch (e) {
          return Error(e);
        }
      });

      final model = container.read(shopDataSourceProvider);
      final result = await model.fetchShops(limit: 10);

      // ShopModel型が返ってくることを確認
      expect(result, isA<Result<List<ShopModel>>>());
      // dataの中身を確認
      result.whenWithResult(
        (list) => expect(list.value.first.name, 'name_1'),
        (e) => expect(e, Exception('Unhendled part, could be anything')),
      );
    });

    test('when cursor is not null', () async {
      when(_shopFirestore.fetchShops(limit: 10, cursor: 'shop_id_1'))
          .thenAnswer((_) async {
        try {
          final snapshot = await _firestore
              .collection('shops')
              .orderBy('shop_id', descending: false)
              .startAfter(['shop_id_1'])
              .limit(10)
              .get();
          return Success(snapshot);
        } on Exception catch (e) {
          return Error(e);
        }
      });

      final model = container.read(shopDataSourceProvider);
      final result = await model.fetchShops(limit: 10, cursor: 'shop_id_1');

      expect(result, isA<Result<List<ShopModel>>>());
      result.whenWithResult(
        (list) => expect(list.value.length, 1),
        (e) => expect(e, Exception('Unhendled part, could be anything')),
      );
    });
  });
}
