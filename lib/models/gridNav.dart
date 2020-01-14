import 'package:json_annotation/json_annotation.dart';
import "gridNavItem.dart";
part 'gridNav.g.dart';

@JsonSerializable()
class GridNav {
    GridNav();

    GridNavItem hotel;
    GridNavItem flight;
    GridNavItem travel;
    
    factory GridNav.fromJson(Map<String,dynamic> json) => _$GridNavFromJson(json);
    Map<String, dynamic> toJson() => _$GridNavToJson(this);
}
