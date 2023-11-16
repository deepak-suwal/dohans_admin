// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => DeviceModel(
      json['brandId'] as String,
      json['deviceId'] as String,
      json['deviceName'] as String,
      json['imageUrl'] as String,
    );

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) =>
    <String, dynamic>{
      'brandId': instance.brandId,
      'deviceId': instance.deviceId,
      'deviceName': instance.deviceName,
      'imageUrl': instance.imageUrl,
    };
