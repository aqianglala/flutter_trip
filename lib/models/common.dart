import 'package:json_annotation/json_annotation.dart';

part 'common.g.dart';

@JsonSerializable()
class Common {
    Common();

    bool hideAppBar;
    String icon;
    String statusBarColor;
    String title;
    String url;
    
    factory Common.fromJson(Map<String,dynamic> json) => _$CommonFromJson(json);
    Map<String, dynamic> toJson() => _$CommonToJson(this);
}
