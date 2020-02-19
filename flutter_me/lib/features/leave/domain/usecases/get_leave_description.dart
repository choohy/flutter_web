import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_me/core/error/failure.dart';
import 'package:flutter_me/core/usercases/usecase.dart';
import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';
import 'package:flutter_me/features/leave/domain/repositories/leave_type_repository.dart';
import 'package:meta/meta.dart';

class GetLeaveDescription implements UseCase<LeaveType, Params> {
  final LeaveTypeRepository repository;

  GetLeaveDescription(this.repository);

  @override
  Future<Either<Failure, LeaveType>> call(
    Params params,
  ) async {
    return await repository.getLeaveDescription(params.leaveType);
  }
}

class Params extends Equatable {
  final String leaveType;
  Params({@required this.leaveType}) : super([leaveType]);
}
