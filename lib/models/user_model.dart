import 'package:json_annotation/json_annotation.dart';
import './data.dart';
import './support.dart';
part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  final Data data;
  final Support support;

  UserModel({
    required this.data,
    required this.support,
  });

//Map -> Model
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

//Model -> Map
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // factory UserModel.fromMap(Map<String, dynamic> data) {
  //   return UserModel(
  //     id: data['id'],
  //     email: data['email'],
  //     first_name: data['first_name'],
  //     last_name: data['last_name'],
  //     avatar: data['avatar'],
  //   );
  // }
}
