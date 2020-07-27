import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LeaveType extends Equatable {
  final String leaveType;
  final String leaveDescription;

  const LeaveType({
    @required this.leaveType,
    @required this.leaveDescription
  });

  @override
  String toString() {
    return 'LeaveType{'
        'leaveType: $leaveType, '
        'leaveDescription: $leaveDescription}';
  }

  @override
  List<Object> get props => [leaveType, leaveDescription];
}

class LeaveTypes extends Equatable {
  final List<LeaveType> leaveTypes;

  LeaveTypes({
    @required this.leaveTypes
  });

  @override
  List<Object> get props => [leaveTypes];
}