class LeaveHistoryModel {
  List<LeaveHistory> history = [];

  LeaveHistoryModel({this.history});

  factory LeaveHistoryModel.fromJson(Map<String, dynamic> parsedJson) {
//    print('LeaveHistoryModel parsedJson: $parsedJson');
    var historyFromJson = parsedJson['history'] as List;
    List<LeaveHistory> history =
        historyFromJson.map((i) => LeaveHistory.fromJson(i)).toList();
    return LeaveHistoryModel(
      history: history,
    );
  }
}

class LeaveHistory {
  List<Item> items = [];
  String status;

  LeaveHistory({this.items, this.status});

  factory LeaveHistory.fromJson(Map<String, dynamic> parsedJson) {
//    print('LeaveHistory parsedJson: $parsedJson');
    var itemsFromJson = parsedJson['items'] as List;
    List<Item> items = itemsFromJson.map((i) => Item.fromJson(i)).toList();
    return LeaveHistory(items: items, status: parsedJson['status']);
  }
}

class Item {
  String id;
  String status;
  String approvalManagerName;
  Detail detail;
  Duration duration;
  List<Correspondence> correspondence;

  Item(
      {this.id,
      this.status,
      this.approvalManagerName,
      this.detail,
      this.duration,
      this.correspondence});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
//    print('Item parsedJson: $parsedJson');
    var detailParsedFromJson = parsedJson['detail'];
    Detail detail = Detail.fromJson(detailParsedFromJson);
//    print('Detail $detail');
    var durationFromJson = parsedJson['duration'];
    Duration duration = Duration.fromJson(durationFromJson);

    var correspondenceFromJson = parsedJson['correspondence'] as List;
    List<Correspondence> correspondence =
        correspondenceFromJson.map((i) => Correspondence.fromJson(i)).toList();
    return Item(
        id: parsedJson['id'],
        status: parsedJson['status'],
        approvalManagerName: parsedJson['approvalManagerName'],
        detail: detail,
        duration: duration,
        correspondence: correspondence);
  }
}

class Detail {
  String leaveId;
  String employeeID;
  int record;
  String fromDate;
  String toDate;
  String partialHoursType;
  String hoursFirstDay;
  String hoursEndDay;
  String comment;
  bool leaveDraft;
  LeaveType type;

  Detail(
      {this.leaveId,
      this.employeeID,
      this.record,
      this.fromDate,
      this.toDate,
      this.partialHoursType,
      this.hoursFirstDay,
      this.hoursEndDay,
      this.comment,
      this.leaveDraft,
      this.type});

  factory Detail.fromJson(Map<String, dynamic> parsedJson) {
//    print('Detail parsedJson: $parsedJson');
    var typeFromJson = parsedJson['type'];
    LeaveType leaveType = LeaveType.fromJson(typeFromJson);

    return Detail(
        leaveId: parsedJson['leaveId'],
        employeeID: parsedJson['employeeID'],
        record: parsedJson['record'],
        fromDate: parsedJson['fromDate'],
        toDate: parsedJson['toDate'],
        partialHoursType: parsedJson['partialHoursType'],
        hoursFirstDay: parsedJson['hoursFirstDay'],
        hoursEndDay: parsedJson['hoursEndDay'],
        comment: parsedJson['comment'],
        leaveDraft: parsedJson['leaveDraft'],
        type: leaveType);
  }
}

class LeaveType {
  final String pinNm;
  final String reasonPin;

  LeaveType({this.pinNm, this.reasonPin});

  factory LeaveType.fromJson(Map<String, dynamic> parsedJson) {
//    print('LeaveType parsedJson: $parsedJson');
    var pinNm = parsedJson['pin_nm'];
    var reasonPin = parsedJson['reason_pin'];
    return new LeaveType(
      pinNm: pinNm,
      reasonPin: reasonPin,
    );
  }

  @override
  String toString() {
    return 'LeaveType{pin_nm: $pinNm, reason_pin: $reasonPin}';
  }
}

class Duration {
  String duration;
  LeaveType type;
  String days;
  String hours;
  String totalHours;

  Duration({
    this.duration,
    this.type,
    this.days,
    this.hours,
    this.totalHours,
  });

  factory Duration.fromJson(Map<String, dynamic> parsedJson) {
//    print('Duration parsedJson: $parsedJson');
    var typeFromJson = parsedJson['type'];
    LeaveType leaveType = LeaveType.fromJson(typeFromJson);
    return Duration(
        duration: parsedJson['duration'],
        type: leaveType,
        days: parsedJson['days'],
        hours: parsedJson['hours'],
        totalHours: parsedJson['totalHours']);
  }
}

class Correspondence {
  String id;
  String lanID;
  String firstName;
  String lastName;
  String workFlowStatus;
  String dateOfCorrespondence;
  String comment;

  Correspondence(
      {this.id,
      this.lanID,
      this.firstName,
      this.lastName,
      this.workFlowStatus,
      this.dateOfCorrespondence,
      this.comment});

  factory Correspondence.fromJson(Map<String, dynamic> parsedJson) {
//    print('Correspondence parsedJson: $parsedJson');
    return Correspondence(
        id: parsedJson['id'],
        lanID: parsedJson['lanID'],
        firstName: parsedJson['firstName'],
        workFlowStatus: parsedJson['workFlowStatus'],
        dateOfCorrespondence: parsedJson['dateOfCorrespondence'],
        comment: parsedJson['comment']);
  }
}
