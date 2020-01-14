import 'package:json_annotation/json_annotation.dart';
import "common.dart";
part 'salesBox.g.dart';

@JsonSerializable()
class SalesBox {
    SalesBox();

    String icon;
    String moreUrl;
    Common bigCard1;
    Common bigCard2;
    Common smallCard1;
    Common smallCard2;
    Common smallCard3;
    Common smallCard4;
    
    factory SalesBox.fromJson(Map<String,dynamic> json) => _$SalesBoxFromJson(json);
    Map<String, dynamic> toJson() => _$SalesBoxToJson(this);
}
