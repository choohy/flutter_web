import 'dart:convert';
import 'package:matcher/matcher.dart';
import 'package:flutter_me/core/error/exception.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'package:flutter_me/features/leave/data/datasources/leave_type_local_data_source.dart';
import 'package:flutter_me/features/leave/data/models/leave_type_model.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  LeaveTypeLocalDataSourceImpl dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = LeaveTypeLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getCachedLeaveType', () {
    final tLeaveTypeModel = LeaveTypeModel.fromJson(json.decode(fixture('leave_type_cache.json')));
    final tPin = 'LEAVE TYPE PIN';

    test('should return from SharedPrefrences when leaveType is cached', () async {
      // arrange pre-conditions
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('leave_type_cache.json'));

      // act = perform the action
      final result = await dataSource.getLeaveType(tPin);
      // assert the result

      //check method called
      verify(mockSharedPreferences.getString(tPin));

      //check actual matches expected end result
      expect(result, equals(tLeaveTypeModel));
    });

    test('should throw a CacheException when there is not a cache value', ()  {
      // arrange pre-conditions
      when(mockSharedPreferences.getString(any))
          .thenReturn(null);

      // act = perform the action
      final call =  dataSource.getLeaveType;
      // assert the result

      //check actual matches expected end result
      expect(() => call(tPin),throwsA(TypeMatcher<CacheException>()));
    });
  });

  group('cacheLeaveType', () {
    // arrange pre-conditions
    final tLeaveTypeModel = LeaveTypeModel(
      leaveType: "LEAVE TYPE PIN",
        leaveDescription: "Leave Type Description"
    );
    final tPin = "LEAVE TYPE PIN";

    test('should call SharedPreferences to cache data', () async {
      // act = perform the action
      dataSource.setLeaveType(tLeaveTypeModel);

      // assert the result
      final expectedJsonString = json.encode(tLeaveTypeModel.toJson());

      //check method called
      verify(mockSharedPreferences.setString(tPin, expectedJsonString));
    });
  });
}