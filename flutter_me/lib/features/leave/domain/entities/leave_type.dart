import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LeaveType extends Equatable {
  final String leaveType;
  final String leaveDescription;

  LeaveType({
    @required this.leaveType,
    @required this.leaveDescription
  }) : super([leaveType,leaveDescription]);
}

class LeaveTypes extends Equatable {
  final Map<String,String> leaveTypes;

  LeaveTypes({
    @required this.leaveTypes
  }) : super([leaveTypes]);
}