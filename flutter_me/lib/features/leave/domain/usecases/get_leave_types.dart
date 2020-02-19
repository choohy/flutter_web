import 'package:dartz/dartz.dart';

import 'package:flutter_me/core/error/failure.dart';
import 'package:flutter_me/core/usercases/usecase.dart';
import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';
import 'package:flutter_me/features/leave/domain/repositories/leave_type_repository.dart';

class GetLeaveTypes implements UseCase<List<LeaveType>, NoParams> {
  final LeaveTypeRepository repository;

  GetLeaveTypes(this.repository);

  @override
  Future<Either<Failure, List<LeaveType>>> call(NoParams noParams
  ) async {
    return await repository.getLeaveTypes();
  }
}