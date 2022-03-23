import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? email;
  String? password;
  List<String>? wishList;

  User({this.id, this.name, this.email, this.password, this.wishList});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
