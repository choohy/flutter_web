import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/leave_type.dart';
import '../../domain/repositories/leave_type_repository.dart';
import '../../../../core/platform/network_info.dart';
import '../datasources/leave_type_local_data_source.dart';
import '../datasources/leave_type_remote_data_source.dart';

class LeaveTypeRepositoryImpl implements LeaveTypeRepository {
  final LeaveTypeRemoteDataSource remoteDataSource;
  final LeaveTypeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LeaveTypeRepositoryImpl({
      @required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, LeaveType>> getLeaveDescription(String leaveType) {
    // TODO: implement getLeaveDescription
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<LeaveType>>> getLeaveTypes() {
    // TODO: implement getLeaveTypes
    throw UnimplementedError();
  }
}
