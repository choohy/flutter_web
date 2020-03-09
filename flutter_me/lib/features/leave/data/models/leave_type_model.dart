import 'package:meta/meta.dart';

import '../../domain/entities/leave_type.dart';

class LeaveTypeModel extends LeaveType {
  LeaveTypeModel({
    @required String leaveType,
    @required String leaveDescription,
}) : super(leaveType: leaveType, leaveDescription: leaveDescription);

  factory LeaveTypeModel.fromJson(Map<String, dynamic> json) {
    var keys = json.keys;
//    print('leaveType: '+ keys.elementAt(0));
//    print('leaveDescription: '+ json[keys.elementAt(0)]);
    return LeaveTypeModel(leaveType: keys.elementAt(0), leaveDescription:json[keys.elementAt(0)]);
  }

  Map<String, dynamic> toJson() {
//    print('leaveType: '+leaveType);
//    print('leaveDescription: '+leaveDescription);
    return {
      '${leaveType.toUpperCase()}': leaveDescription
    };
  }
}

class LeaveTypesModel extends LeaveTypes {
  LeaveTypesModel({
    @required List<LeaveType> leaveTypes
}) : super(leaveTypes: leaveTypes);

  factory LeaveTypesModel.fromJson(Map<String, dynamic> json) {
    final keys = json.keys;
//    print('keys: '+ keys.toString());
    final leaveTypes = new List<LeaveType>();
    keys.forEach((element) {
//      print('key: '+element+", description: "+json[element]);
      leaveTypes.add(LeaveType(leaveType: element, leaveDescription:json[element]));
    });
//    leaveTypes.forEach((element) {
//      print('element: '+element.toString());
//    });
    return LeaveTypesModel(leaveTypes: leaveTypes);
  }

  Map<String, dynamic> toJson() {
    return leaveTypes as Map;
  }

  @override
  String toString() {
    return '$leaveTypes';
  }

}