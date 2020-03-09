import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../../lib/core/error/exception.dart';
import '../../../../../lib/features/leave/data/datasources/leave_type_remote_data_source.dart';
import '../../../../../lib/features/leave/data/models/leave_type_model.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  LeaveTypeRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = LeaveTypeRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('leave_type_cache.json'
        ''), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('leave_type_cache.json'
        ''), 404));
  }

  group('getRemoteLeaveType', () {
    final tPin = 'LEAVETYPEPIN';
    final tURL = "http://numbersapi.com/$tPin";
    final tLeaveTypeModel = LeaveTypeModel.fromJson(json.decode(fixture('leave_type_cache.json')));

    test('should perform a GET request on a URL with leaveType being the endpoint with application/json header', () async {
      // arrange pre-conditions
      setUpMockHttpClientSuccess200();

      // act = perform the action
      dataSource.getLeaveDescription(tPin);

      // assert the result
      //check method called
      verify(mockHttpClient.get(tURL,headers: {'Content-Type': 'application/json'}));
    });

    test('should return LeaveType when the response code is 200 (success)', ()  async {
      // arrange pre-conditions
      setUpMockHttpClientSuccess200();

      // act = perform the action
      final result = await dataSource.getLeaveDescription(tPin);

      // assert the result
      //check method called
      verify(mockHttpClient.get(tURL,headers: {'Content-Type': 'application/json'}));
      expect(result,equals(tLeaveTypeModel));
    });

    test('should throw a CacheException when there is not a cache value', ()  {
      // arrange pre-conditions
      setUpMockHttpClientFailure404();

      // act = perform the action
      final call =  dataSource.getLeaveDescription;

      // assert the result
      //check actual matches expected end result
      expect(() => call(tPin),throwsA(TypeMatcher<ServerException>()));
    });
  });
//
//  group('cacheLeaveType', () {
//    // arrange pre-conditions
//    final tLeaveTypeModel = LeaveTypeModel(
//      leaveType: "LEAVE TYPE PIN",
//        leaveDescription: "Leave Type Description"
//    );
//    final tPin = "LEAVE TYPE PIN";
//
//    test('should call SharedPreferences to cache data', () async {
//      // act = perform the action
//      dataSource.setLeaveType(tLeaveTypeModel);
//
//      // assert the result
//      final expectedJsonString = json.encode(tLeaveTypeModel.toJson());
//
//      //check method called
//      verify(mockSharedPreferences.setString(tPin, expectedJsonString));
//    });
//  });
}