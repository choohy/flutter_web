import 'package:flutter_me/core/error/failure.dart';
import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';
import 'package:dartz/dartz.dart';

abstract class LeaveTypeRepository {
  Future<Either<Failure, LeaveType>> getLeaveDescription(String leaveType);
  Future<Either<Failure, List<LeaveType>>> getLeaveTypes();
}