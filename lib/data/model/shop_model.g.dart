// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppShop _$$_AppShopFromJson(Map<String, dynamic> json) => _$_AppShop(
      name: json['name'] as String,
      shopId: json['shop_id'] as String,
      comment: json['comment'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_AppShopToJson(_$_AppShop instance) =>
    <String, dynamic>{
      'name': instance.name,
      'shop_id': instance.shopId,
      'comment': instance.comment,
      'images': instance.images,
      'tags': instance.tags,
    };
