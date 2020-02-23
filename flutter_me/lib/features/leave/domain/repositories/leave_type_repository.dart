import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/leave_type.dart';

abstract class LeaveTypeRepository {
  Future<Either<Failure, LeaveType>> getLeaveDescription(String leaveType);
  Future<Either<Failure, List<LeaveType>>> getLeaveTypes();
}