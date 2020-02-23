import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usercases/usecase.dart';
import '../entities/leave_type.dart';
import '../repositories/leave_type_repository.dart';

class GetLeaveTypes implements UseCase<List<LeaveType>, NoParams> {
  final LeaveTypeRepository repository;

  GetLeaveTypes(this.repository);

  @override
  Future<Either<Failure, List<LeaveType>>> call(NoParams noParams
  ) async {
    return await repository.getLeaveTypes();
  }
}