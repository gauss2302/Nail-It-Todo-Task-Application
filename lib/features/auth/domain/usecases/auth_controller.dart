// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:nail_it/core/error/failure.dart';

import 'package:nail_it/core/usecase/usecase.dart';
import 'package:nail_it/features/auth/domain/entities/user_entities.dart';
import 'package:nail_it/features/auth/domain/repositories/auth_repo.dart';

class CurrentUser implements UseCase<UserEntities, NoParams> {
  final AuthRepo authRepo;
  CurrentUser({
    required this.authRepo,
  });

  @override
  Future<Either<Failure, UserEntities>> call(NoParams params) async {
    return await authRepo.currentUser();
  }
}
