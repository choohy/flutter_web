import 'package:dartz/dartz.dart';
import 'package:flutter_me/core/error/exception.dart';
import 'package:flutter_me/core/error/failure.dart';
import 'package:flutter_me/core/network/network_info.dart';
import 'package:flutter_me/features/leave/data/datasources/leave_type_local_data_source.dart';
import 'package:flutter_me/features/leave/data/models/leave_type_model.dart';
import 'package:flutter_me/features/leave/data/respositories/leave_type_repository_impl.dart';
import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';
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

  void runTestsOnline(Function body) {
    group('device is online', ()
    {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', ()
    {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  group('getLeaveDescription', () {
    final tLeaveTypePin = "ANNUAL LEAVE";
    final tLeaveTypeModel = LeaveTypeModel(
        leaveType: tLeaveTypePin, leaveDescription: "Annual Leeave");
    final LeaveType tLeaveType = tLeaveTypeModel;

    test('should check if device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getLeaveDescription(tLeaveTypePin);
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        //arrange
        when(mockRemoteDataSource.getLeaveDescription(any))
            .thenAnswer((_) async => tLeaveTypeModel);
        //act
        final result = await repository.getLeaveDescription(tLeaveTypePin);
        //asset
        verify(mockRemoteDataSource.getLeaveDescription(tLeaveTypePin));
        expect(result, Right(tLeaveType));
      });

      test(
          'should cache data locally when the call to remote data source is successful',
          () async {
        //arrange
        when(mockRemoteDataSource.getLeaveDescription(any))
            .thenAnswer((_) async => tLeaveTypeModel);
        //act
        final rightLeaveType = await repository.getLeaveDescription(tLeaveTypePin);
        final leaveType = rightLeaveType.getOrElse(() => null);
        //asset
        verify(mockRemoteDataSource.getLeaveDescription(tLeaveTypePin));
        verify(mockLocalDataSource.setLeaveType(leaveType));
      });

      test(
          'should return server failure call to remote data source is unsuccessful',
          () async {
        //arrange
        when(mockRemoteDataSource.getLeaveDescription(any))
            .thenThrow(ServerException());
        //act
        final result = await repository.getLeaveDescription(tLeaveTypePin);
        //asset
        verify(mockRemoteDataSource.getLeaveDescription(tLeaveTypePin));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test('should return last locally cached data when cached data is present',
          () async {
        //arrange
        when(mockLocalDataSource.getLeaveType(tLeaveTypePin))
            .thenAnswer((_) async => tLeaveTypeModel);
        //act
        final result = await repository.getLeaveDescription(tLeaveTypePin);
        //asset
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLeaveType(tLeaveTypePin));
        expect(result, Right(tLeaveType));
      });

      test('should return CacheFailure when no cached data present',
              () async {
            //arrange
            when(mockLocalDataSource.getLeaveType(tLeaveTypePin))
                .thenThrow(CacheException());
            //act
            final result = await repository.getLeaveDescription(tLeaveTypePin);
            //asset
            verifyZeroInteractions(mockRemoteDataSource);
            verify(mockLocalDataSource.getLeaveType(tLeaveTypePin));
            expect(result, equals(Left(CacheFailure())));
          });
    });
  });
}
