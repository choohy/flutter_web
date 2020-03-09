import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/leave_type.dart';
import '../../domain/repositories/leave_type_repository.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/leave_type_local_data_source.dart';
import '../datasources/leave_type_remote_data_source.dart';

typedef Future<LeaveType> _LeaveType();

class LeaveTypeRepositoryImpl implements LeaveTypeRepository {
  final LeaveTypeRemoteDataSource remoteDataSource;
  final LeaveTypeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LeaveTypeRepositoryImpl({
      @required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  @override
  Future<Either<Failure, LeaveType>> getLeaveDescription(String leaveTypePin) async {
    return await _getLeaveType(() {
      return remoteDataSource.getLeaveDescription(leaveTypePin);
    });
  }

  @override
  Future<Either<Failure, List<LeaveType>>> getLeaveTypes() {
    // TODO: implement getLeaveTypes
    throw UnimplementedError();
  }

  Future<Either<Failure, LeaveType>> _getLeaveType(
      _LeaveType getLeaveType,
//      Future<LeaveType> Function() getLeaveType
      ) async {
    if(await networkInfo.isConnected) {
      try {
        final remoteLeaveType = await getLeaveType();
        localDataSource.setLeaveType(remoteLeaveType);
        return Right(remoteLeaveType);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localLeaveType = await localDataSource.getLeaveType();
        return Right(localLeaveType);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
