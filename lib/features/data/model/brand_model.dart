import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel {
  String brandId;
  String imageUrl;
  String brandName;

  BrandModel(this.brandId, this.imageUrl, this.brandName);

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}
