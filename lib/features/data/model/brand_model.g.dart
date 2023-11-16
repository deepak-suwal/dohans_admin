// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => BrandModel(
      json['brandId'] as String,
      json['imageUrl'] as String,
      json['brandName'] as String,
    );

Map<String, dynamic> _$BrandModelToJson(BrandModel instance) =>
    <String, dynamic>{
      'brandId': instance.brandId,
      'imageUrl': instance.imageUrl,
      'brandName': instance.brandName,
    };
