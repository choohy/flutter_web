import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usercases/usecase.dart';
import '../entities/leave_type.dart';
import '../repositories/leave_type_repository.dart';

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
