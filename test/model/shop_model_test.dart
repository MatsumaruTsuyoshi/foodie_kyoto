import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodie_kyoto/data/model/shop_model.dart';

void main() {
  final List<Map<String, dynamic>> data = [
    {
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
      'created_at': DateTime(2020, 1, 1),
      'post_user': 'user1',
      'price': 3000,
    },
    {
      'name': 'name_2',
      'shop_id': 'shop_id_2',
      'position': {
        'geohash': 'xn0x1ktq9',
        'geopoint': const GeoPoint(35.006323, 135.765321),
      },
      'comment': 'comment_2',
      'images': ['image1', 'image2'],
      'service_tags': [1],
      'area_tags': [3],
      'food_tags': [5],
      'created_at': DateTime.now(),
      'post_user': 'user1',
      'price': 1000,
    },
  ];

  test('ShopModel.fromJson', () {
    final test = ShopModel.fromJson(data.first);

    const actual = ShopModel(
        name: 'name_1',
        shopId: 'shop_id_1',
        latitude: 35.006323,
        longitude: 135.765321,
        comment: 'comment_1',
        images: ['image1', 'image2'],
        serviceTags: [1, 2],
        areaTags: [3, 4],
        foodTags: [5, 6],
        postUser: 'user1',
        price: 3000);

    expect(test.name, actual.name);
    expect(test.shopId, actual.shopId);
    expect(test.latitude, actual.latitude);
    expect(test.longitude, actual.longitude);
    expect(test.comment, actual.comment);
    expect(test.images, actual.images);
    expect(test.serviceTags, actual.serviceTags);
    expect(test.postUser, actual.postUser);
  });

  group('copyWith', () {
    test('copyWith = original', () {
      const original = ShopModel(
          name: 'name_2',
          shopId: 'shop_id_2',
          latitude: 35.006323,
          longitude: 135.765321,
          comment: 'comment_2',
          images: ['image1', 'image2'],
          serviceTags: [1, 2],
          areaTags: [3, 4],
          foodTags: [5, 6],
          postUser: 'user1',
          price: 3000);

      final copyWith = original.copyWith(
          name: original.name,
          shopId: original.shopId,
          latitude: original.latitude,
          longitude: original.longitude,
          comment: original.comment,
          images: original.images,
          serviceTags: original.serviceTags,
          areaTags: original.areaTags,
          foodTags: original.foodTags,
          postUser: original.postUser,
          price: original.price);

      expect(copyWith.name, original.name);
      expect(copyWith.shopId, original.shopId);
      expect(copyWith.latitude, original.latitude);
      expect(copyWith.longitude, original.longitude);
      expect(copyWith.comment, original.comment);
      expect(copyWith.images, original.images);
      expect(copyWith.serviceTags, original.serviceTags);
      expect(copyWith.postUser, original.postUser);
    });

    test('copyWith != original', () {
      const original = ShopModel(
          name: 'name_2',
          shopId: 'shop_id_2',
          latitude: 35.006323,
          longitude: 135.765321,
          comment: 'comment_2',
          images: ['image1', 'image2'],
          serviceTags: [1, 2],
          areaTags: [3, 4],
          foodTags: [5, 6],
          postUser: 'user1',
          price: 1000);
      final copyWith = original.copyWith(
          name: original.name,
          shopId: original.shopId,
          latitude: original.latitude,
          longitude: original.latitude,
          comment: original.comment,
          images: original.images,
          serviceTags: original.serviceTags,
          areaTags: original.areaTags,
          foodTags: original.foodTags,
          postUser: original.postUser,
          price: original.price);

      expect(copyWith.longitude, isNot(original.longitude));
    });
  });

  test('toJson()', () {
    const original = ShopModel(
        name: 'name_2',
        shopId: 'shop_id_2',
        latitude: 35.006323,
        longitude: 135.765321,
        comment: 'comment_2',
        images: ['image1', 'image2'],
        serviceTags: [1, 2],
        areaTags: [3, 4],
        foodTags: [5, 6],
        postUser: 'user1',
        price: 3000);

    final json = original.toJson();
    expect(json, isA<Map<String, dynamic>>());
  });

  test('toString()', () {
    const original = ShopModel(
        name: 'name_2',
        shopId: 'shop_id_2',
        latitude: 35.006323,
        longitude: 135.765321,
        comment: 'comment_2',
        images: ['image1', 'image2'],
        serviceTags: [1, 2],
        areaTags: [3, 4],
        foodTags: [5, 6],
        postUser: 'user1',
        price: 3000);

    final json = original.toString();
    expect(json, isA<String>());
  });
}
