// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Common _$CommonFromJson(Map<String, dynamic> json) {
  return Common()
    ..hideAppBar = json['hideAppBar'] as bool
    ..icon = json['icon'] as String
    ..statusBarColor = json['statusBarColor'] as String
    ..title = json['title'] as String
    ..url = json['url'] as String;
}

Map<String, dynamic> _$CommonToJson(Common instance) => <String, dynamic>{
      'hideAppBar': instance.hideAppBar,
      'icon': instance.icon,
      'statusBarColor': instance.statusBarColor,
      'title': instance.title,
      'url': instance.url
    };
