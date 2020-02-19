//class LeaveRequestModel {
//  List<LeaveRequest> request = [];
//
//  LeaveRequestModel({this.request});
//
//  factory LeaveRequestModel.fromJson(Map<String, dynamic> parsedJson) {
////    print('LeaveRequestModel parsedJson: $parsedJson');
//    var requestFromJson = parsedJson['leaveFormTypes'] as List;
//    List<LeaveRequest> request =
//    requestFromJson.map((i) => LeaveRequest.fromJson(i)).toList();
//    return LeaveRequestModel(
//      request: request,
//    );
//  }
//}
//
//class LeaveRequest {
//  List<String> leaveTypes = [];
//
//  LeaveRequest({this.leaveTypes});
//
//  factory LeaveRequest.fromJson(Map<String, dynamic> parsedJson) {
////    print('LeaveRequest parsedJson: $parsedJson');
//    List<String> loadLeaveTypes = [];
//    loadLeaveTypes.add(parsedJson['ANNUAL LEAVE']);
//    loadLeaveTypes.add(parsedJson['ANNUAL LEAVE']);
//    loadLeaveTypes.add(parsedJson['ANNUAL LEAVE']);
//    loadLeaveTypes.add(parsedJson['ANNUAL LEAVE']);
//    loadLeaveTypes.add(parsedJson['ANNUAL LEAVE']);
//    loadLeaveTypes.add(parsedJson['ANNUAL LEAVE']);
//    loadLeaveTypes.add(parsedJson['ANNUAL LEAVE']);
//    loadLeaveTypes.add(parsedJson['ANNUAL LEAVE']);
//
//    return LeaveRequest(leaveTypes: loadLeaveTypes);
//  }
//}
//
//class LeaveType {
//  final String leaveType;
////  final String reasonPin;
//
//  LeaveType({this.leaveType});//, this.reasonPin});
//
//  factory LeaveType.fromJson(Map<String, dynamic> parsedJson) {
//////    print('LeaveType parsedJson: $parsedJson');
//    var pinNm = parsedJson['pin_nm'];
//////    var reasonPin = parsedJson['reason_pin'];
//    return new LeaveType(
//      leaveType: leaveType,
////      pinNm: pinNm,
//////      reasonPin: reasonPin,
//    );
//  }

//
class LeaveRequestModel {
  final List<String> leaveFields = [
    "Leave Type",
    "Medical Certificate",
    "From",
    "To",
    'Selected Partial Hours Type',
    "Comments",
  ];
//  bool _medicalCertificateRequired = false;
  final Map<String, dynamic> formData = {
    'Leave Type': '',
    'Medical Certificate': 'false',
    'From': '',
    'To': '',
    'Selected Partial Hours Type': '',
    'Comments': '',
  };
  final List<String> leaveTypes = [
    'ANNUAL LEAVE',
    'SICK LEAVE',
    "LSLVE",
    'LIFESTYLE',
  ];

  final List<String> selectedPartialHoursType = [
    'Full first and last day',
    'Partial first day',
    'Partial last day',
    'Partial first and last day'
  ];
  String leaveType;
  String fromDate;
  String toDate;
  String comments;

//  String selectedPartialHoursType;

  String partialFirstHint;
  String partialLastHint;

  String partialFirstDayHours;
  String partialLastDayHours;

  String calculatedLeaveDays;

  @override
  String toString() {
    return 'LeaveForm{leaveFields: $leaveFields, formData: $formData, leaveTypes: $leaveTypes, leaveType: $leaveType, fromDate: $fromDate, toDate: $toDate, comments: $comments}';
  }
}
