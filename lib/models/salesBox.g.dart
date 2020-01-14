// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salesBox.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesBox _$SalesBoxFromJson(Map<String, dynamic> json) {
  return SalesBox()
    ..icon = json['icon'] as String
    ..moreUrl = json['moreUrl'] as String
    ..bigCard1 = json['bigCard1'] == null
        ? null
        : Common.fromJson(json['bigCard1'] as Map<String, dynamic>)
    ..bigCard2 = json['bigCard2'] == null
        ? null
        : Common.fromJson(json['bigCard2'] as Map<String, dynamic>)
    ..smallCard1 = json['smallCard1'] == null
        ? null
        : Common.fromJson(json['smallCard1'] as Map<String, dynamic>)
    ..smallCard2 = json['smallCard2'] == null
        ? null
        : Common.fromJson(json['smallCard2'] as Map<String, dynamic>)
    ..smallCard3 = json['smallCard3'] == null
        ? null
        : Common.fromJson(json['smallCard3'] as Map<String, dynamic>)
    ..smallCard4 = json['smallCard4'] == null
        ? null
        : Common.fromJson(json['smallCard4'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SalesBoxToJson(SalesBox instance) => <String, dynamic>{
      'icon': instance.icon,
      'moreUrl': instance.moreUrl,
      'bigCard1': instance.bigCard1,
      'bigCard2': instance.bigCard2,
      'smallCard1': instance.smallCard1,
      'smallCard2': instance.smallCard2,
      'smallCard3': instance.smallCard3,
      'smallCard4': instance.smallCard4
    };
