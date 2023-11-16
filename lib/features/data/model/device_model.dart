import 'package:json_annotation/json_annotation.dart';

part 'device_model.g.dart';

@JsonSerializable()
class DeviceModel {
  String brandId;
  String deviceId;
  String deviceName;
  String imageUrl;

  DeviceModel(this.brandId, this.deviceId, this.deviceName, this.imageUrl);

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);
}
