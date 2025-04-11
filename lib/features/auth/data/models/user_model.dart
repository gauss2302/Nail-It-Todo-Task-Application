import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nail_it/features/auth/domain/entities/user_entities.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel extends UserEntities with _$UserModel {
  const factory UserModel({
    @Default("") String id,
    @Default('') String username,
    @Default('') String email,
    @Default('') String name,
    @Default('') String photoUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);


}
