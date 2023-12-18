import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  String id;
  String email;
  String name;
  String? phone;
  DateTime? birthDay;
  // 0: male, 1: Female
  int? sex;
  String? avatar;
  String? address;

  Account({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    this.birthDay,
    this.sex,
    this.address,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
