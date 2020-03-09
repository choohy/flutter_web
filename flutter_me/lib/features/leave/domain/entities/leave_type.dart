import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LeaveType extends Equatable {
  final String leaveType;
  final String leaveDescription;

  LeaveType({
    @required this.leaveType,
    @required this.leaveDescription
  }) : super([leaveType,leaveDescription]);

  @override
  String toString() {
    return 'LeaveType{'
        'leaveType: $leaveType, '
        'leaveDescription: $leaveDescription}';
  }
}

class LeaveTypes extends Equatable {
  final List<LeaveType> leaveTypes;

  LeaveTypes({
    @required this.leaveTypes
  }) : super([leaveTypes]);
}