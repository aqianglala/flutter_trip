import 'package:json_annotation/json_annotation.dart';
import "config.dart";
import "common.dart";
import "gridNav.dart";
import "salesBox.dart";
part 'home.g.dart';

@JsonSerializable()
class Home {
    Home();

    Config config;
    List<Common> bannerList;
    List<Common> localNavList;
    GridNav gridNav;
    List<Common> subNavList;
    SalesBox salesBox;
    
    factory Home.fromJson(Map<String,dynamic> json) => _$HomeFromJson(json);
    Map<String, dynamic> toJson() => _$HomeToJson(this);
}
