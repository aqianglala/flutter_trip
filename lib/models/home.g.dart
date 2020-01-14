// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Home _$HomeFromJson(Map<String, dynamic> json) {
  return Home()
    ..config = json['config'] == null
        ? null
        : Config.fromJson(json['config'] as Map<String, dynamic>)
    ..bannerList = (json['bannerList'] as List)
        ?.map((e) =>
            e == null ? null : Common.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..localNavList = (json['localNavList'] as List)
        ?.map((e) =>
            e == null ? null : Common.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..gridNav = json['gridNav'] == null
        ? null
        : GridNav.fromJson(json['gridNav'] as Map<String, dynamic>)
    ..subNavList = (json['subNavList'] as List)
        ?.map((e) =>
            e == null ? null : Common.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..salesBox = json['salesBox'] == null
        ? null
        : SalesBox.fromJson(json['salesBox'] as Map<String, dynamic>);
}

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'config': instance.config,
      'bannerList': instance.bannerList,
      'localNavList': instance.localNavList,
      'gridNav': instance.gridNav,
      'subNavList': instance.subNavList,
      'salesBox': instance.salesBox
    };
