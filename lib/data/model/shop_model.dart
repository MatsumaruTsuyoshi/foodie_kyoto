import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_model.freezed.dart';

part 'shop_model.g.dart';

@freezed
abstract class ShopModel with _$ShopModel {
  factory ShopModel({
    required String name,
    required String shopId,
    required String comment,
    required List<String> images,
    required List<int> tags,
  }) = _AppShop;

  const ShopModel._();

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);
}
