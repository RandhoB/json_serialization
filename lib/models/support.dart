import 'package:json_annotation/json_annotation.dart';

part 'support.g.dart';

@JsonSerializable()
class Support {
  final String url;
  final String text;

  Support({
    required this.url,
    required this.text,
  });

//Map -> Model
  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);

  //Model -> Map
  Map<String, dynamic> toJson() => _$SupportToJson(this);
}
