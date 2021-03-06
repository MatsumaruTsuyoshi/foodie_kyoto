import 'package:flutter_test/flutter_test.dart';
import 'package:foodie_kyoto/data/model/shop_model.dart';
import 'package:foodie_kyoto/data/remote/data_source/shop_data_source.dart';
import 'package:foodie_kyoto/data/model/result.dart';
import 'package:foodie_kyoto/data/repository/shop_repository_impl.dart';
import 'package:foodie_kyoto/domain/entity/shop.dart';
import 'package:foodie_kyoto/domain/repository/shop_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'shop_repository_test.mocks.dart';

@GenerateMocks([ShopDataSource])
void main() {
  late MockShopDataSource _shopDataSource;

  setUp(() {
    _shopDataSource = MockShopDataSource();
  });

  final container = ProviderContainer(overrides: [
    shopRepositoryProvider.overrideWithProvider(
        Provider((ref) => ShopRepositoryImpl(dataSource: _shopDataSource)))
  ]);

  group('fetch shops', () {
    test('shop repository can correctly change data type shop_model to shop',
        () async {
      final List<Map<String, dynamic>> data = [
        {
          'name': 'name_1',
          'shop_id': 'shop_id_1',
          'comment': 'comment_1',
          'images': ['image1', 'image2'],
          'tags': [1, 3],
          'created_at': DateTime(2020, 1, 1),
        },
        {
          'name': 'name_2',
          'shop_id': 'shop_id_2',
          'comment': 'comment_2',
          'images': ['image1', 'image2'],
          'tags': [2, 4],
          'created_at': DateTime.now(),
        },
      ];
      when(_shopDataSource.fetchShops(limit: 10)).thenAnswer((_) async {
        return Success(data.map((e) => ShopModel.fromJson(e)).toList());
      });

      final model = container.read(shopRepositoryProvider);
      final shopResult = await model.fetchShops(limit: 10);

      // ShopModel -> Shop の変換確認
      expect(shopResult, isA<Success<List<Shop>>>());

      // dataの中身を確認
      shopResult.whenWithResult(
        (list) => expect(list.value.first.name, 'name_1'),
        (e) => expect(e, null),
      );
    });
  });
}
