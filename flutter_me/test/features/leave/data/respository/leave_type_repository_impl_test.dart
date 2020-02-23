import 'package:flutter_me/core/platform/network_info.dart';
import 'package:flutter_me/features/leave/data/datasources/leave_type_local_data_source.dart';
import 'package:flutter_me/features/leave/data/respositories/leave_type_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_me/features/leave/data/datasources/leave_type_remote_data_source.dart';

class MockRemoteDataSource extends Mock implements LeaveTypeRemoteDataSource {}
class MockLocalDataSource extends Mock implements LeaveTypeLocalDataSource {}
class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  LeaveTypeRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = LeaveTypeRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}