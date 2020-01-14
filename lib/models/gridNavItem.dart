import 'package:json_annotation/json_annotation.dart';
import "common.dart";
part 'gridNavItem.g.dart';

@JsonSerializable()
class GridNavItem {
    GridNavItem();

    String startColor;
    String endColor;
    Common mainItem;
    Common item1;
    Common item2;
    Common item3;
    Common item4;
    
    factory GridNavItem.fromJson(Map<String,dynamic> json) => _$GridNavItemFromJson(json);
    Map<String, dynamic> toJson() => _$GridNavItemToJson(this);
}
