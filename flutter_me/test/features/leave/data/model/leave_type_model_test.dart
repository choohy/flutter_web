import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_me/features/leave/data/models/leave_type_model.dart';
import 'package:flutter_me/features/leave/domain/entities/leave_type.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tleaveTypeModel = LeaveTypeModel(
      leaveType: "LEAVE TYPE PIN", leaveDescription: "Leave Type Description");
  final tleaveTypeModel2 = LeaveTypeModel(
      leaveType: "LEAVE TYPE PIN2",
      leaveDescription: "Leave Type Description2");

  test('should be a subclass of LeaveType entity', () async {
    //asset
    expect(tleaveTypeModel, isA<LeaveType>());
  });

  group('fromJson', () {
    test('should return a valid model when only 1 entry in json', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('leave_type.json'));
      //act
      final result = LeaveTypeModel.fromJson(jsonMap);
      //asset
      expect(result, tleaveTypeModel);
    });

    test('should return a valid model when multiple entries in json', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('leave_type.json'));
      var tleaveTypes = List<LeaveType>();
      tleaveTypes.add(tleaveTypeModel);
      tleaveTypes.add(tleaveTypeModel2);
      var tleaveTypesModel = new LeaveTypesModel(leaveTypes: tleaveTypes);
      //act
      final result = LeaveTypesModel.fromJson(jsonMap);
      //asset
//      print('expected: '+tleaveTypesModel.toString());
//      print('actual: '+result.toString());
      expect(result, tleaveTypesModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      //act
      final result = tleaveTypeModel.toJson();
      //asset
      final expectedMap = {"LEAVE TYPE PIN": "Leave Type Description"};
      expect(result, expectedMap);
    });
  });
}
