class LeaveForm {
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
