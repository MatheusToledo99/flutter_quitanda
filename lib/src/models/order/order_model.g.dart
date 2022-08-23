// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String,
      total: (json['total'] as num).toDouble(),
      qrCodeImage: json['qrCodeImage'] as String,
      copyAndPaste: json['copiaecola'] as String,
      overdueDateTime: DateTime.parse(json['due'] as String),
      status: json['status'] as String,
      createdDateTime: json['createdDateTime'] == null
          ? null
          : DateTime.parse(json['createdDateTime'] as String),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'qrCodeImage': instance.qrCodeImage,
      'copiaecola': instance.copyAndPaste,
      'due': instance.overdueDateTime.toIso8601String(),
      'status': instance.status,
      'createdDateTime': instance.createdDateTime?.toIso8601String(),
      'items': instance.items,
    };
