import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
class ShopModel {
  const ShopModel(
      {required this.name,
      required this.shopId,
      required this.latitude,
      required this.longitude,
      required this.comment,
      required this.images,
      required this.serviceTags,
      required this.areaTags,
      required this.foodTags,
      required this.postUser,
      required this.price});

  factory ShopModel.fromJson(Map<String, Object?> json) {
    final position = json['position'] as Map<String, dynamic>;
    final GeoPoint geoPoint = position['geopoint'];

    final dynamicImages = json['images'] as List<dynamic>;
    final images = dynamicImages.cast<String>();

    final dynamicServiceTags = json['service_tags'] as List<dynamic>;
    final serviceTags = dynamicServiceTags.cast<int>();

    final dynamicFoodTags = json['food_tags'] as List<dynamic>;
    final foodTags = dynamicFoodTags.cast<int>();

    final dynamicAreaTags = json['area_tags'] as List<dynamic>;
    final areaTags = dynamicAreaTags.cast<int>();

    return ShopModel(
        name: json['name'] as String,
        shopId: json['shop_id'] as String,
        latitude: geoPoint.latitude,
        longitude: geoPoint.longitude,
        comment: json['comment'] as String,
        images: images,
        serviceTags: serviceTags,
        areaTags: areaTags,
        foodTags: foodTags,
        postUser: json['post_user'] as String,
        price: json['price'] as int);
  }

  final String name;
  final String shopId;
  final double latitude;
  final double longitude;
  final String comment;
  final List<String> images;
  final List<int> serviceTags;
  final List<int> areaTags;
  final List<int> foodTags;
  final String postUser;
  final int price;

  ShopModel copyWith(
      {String? name,
      String? shopId,
      double? latitude,
      double? longitude,
      String? comment,
      List<String>? images,
      List<int>? serviceTags,
      List<int>? areaTags,
      List<int>? foodTags,
      String? postUser,
      int? price}) {
    return ShopModel(
        name: name as String,
        shopId: shopId as String,
        latitude: latitude as double,
        longitude: longitude as double,
        comment: comment as String,
        images: images as List<String>,
        serviceTags: serviceTags as List<int>,
        areaTags: areaTags as List<int>,
        foodTags: foodTags as List<int>,
        postUser: postUser as String,
        price: price as int);
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'shop_id': shopId,
      'latitude': latitude,
      'longitude': longitude,
      'comment': comment,
      'images': images,
      'service_tags': serviceTags,
      'area_tags': areaTags,
      'food_tags': foodTags,
      'post_user': postUser,
      'price': price,
    };
  }

  @override
  String toString() {
    return 'ShopModel('
        'name: $name,'
        'shop_id: $shopId,'
        'latitude: $latitude,'
        'longitude: $longitude,'
        'comment: $comment,'
        'images: $images,'
        'service_tags: $serviceTags,'
        'area_tags: $areaTags,'
        'food_tags: $foodTags,'
        'post_user: $postUser,'
        'price: $price,'
        ')';
  }

  @override
  bool operator ==(Object other) => identical(ShopModel, other);

  @override
  int get hashCode {
    return Object.hash(runtimeType, name, shopId, latitude, longitude, comment,
        images, serviceTags, areaTags, foodTags, postUser, price);
  }
}
