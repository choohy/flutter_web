import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_me/core/error/failure.dart';
import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';
import 'package:flutter_me/features/leave/domain/repositories/leave_type_repository.dart';
import 'package:meta/meta.dart';

class GetLeaveDescription {
  final LeaveTypeRepository repository;

  GetLeaveDescription(this.repository);

  Future<Either<Failure, LeaveType>> execute(
      {@required String leaveType}) async {
    return await repository.getLeaveDescription(leaveType);
  }
}
