class LeaveFormSubTypes {
  final SickLeave sickLeave;
  final SickLeave sickLeaveWithoutPay;
  final VolunteerLeave volunteerLeave;


  LeaveFormSubTypes({
    this.sickLeave,
    this.sickLeaveWithoutPay,
    this.volunteerLeave
  });

  factory LeaveFormSubTypes.fromJson(Map<String, dynamic> parsedJson) {
    return LeaveFormSubTypes(
      sickLeave: parsedJson['SICK LEAVE'],
      sickLeaveWithoutPay: parsedJson['SL WITHOUT PAY'],
      volunteerLeave: parsedJson['VOLUNTEER LEAVE'],
    );
  }

  @override
  String toString() {
    return 'LeaveFormSubTypes{sickLeave: $sickLeave, sickLeaveWithoutPay: $sickLeaveWithoutPay, volunteerLeave: $volunteerLeave}';
  }
}

class SickLeave {
  final String medicalCertificateYes;
  final String medicalCertificateNo;

  SickLeave({
    this.medicalCertificateYes,
    this.medicalCertificateNo
  });

  factory SickLeave.fromJson(Map<String, dynamic> parsedJson) {
    return SickLeave(
      medicalCertificateYes: parsedJson['MCY'],
      medicalCertificateNo: parsedJson['MCN'],
    );
  }

  @override
  String toString() {
    return 'SickLeave{medicalCertificateYes: $medicalCertificateYes, medicalCertificateNo: $medicalCertificateNo}';
  }
}

class VolunteerLeave {
  final Map<String, dynamic> volunteerLeaveTypes;

  VolunteerLeave({
    this.volunteerLeaveTypes,
  });

  factory VolunteerLeave.fromJson(Map<String, dynamic> parsedJson) {
    return VolunteerLeave(
      volunteerLeaveTypes: parsedJson,
    );
  }

  @override
  String toString() {
    return 'VolunteerLeave{volunteerLeaveTypes: $volunteerLeaveTypes}';
  }
}

class LeaveFormTypeMap {
  final Map<String, dynamic> leaveFormTypeMap;

  LeaveFormTypeMap({
    this.leaveFormTypeMap,
  });

  factory LeaveFormTypeMap.fromJson(Map<String, dynamic> parsedJson) {
    return LeaveFormTypeMap(
      leaveFormTypeMap: parsedJson,
    );
  }

  @override
  String toString() {
    return 'LeaveFormTypeMap{leaveFormTypeMap: $leaveFormTypeMap}';
  }
}

class LeaveFormTypes {
  final Map<String, dynamic> leaveFormTypes;

  LeaveFormTypes({
    this.leaveFormTypes,
  });

  factory LeaveFormTypes.fromJson(Map<String, dynamic> parsedJson) {
    return LeaveFormTypes(
      leaveFormTypes: parsedJson,
    );
  }

  int leaveFormTypesCount() => leaveFormTypes.length;
  String leaveTitle(String pin) => leaveFormTypes[pin];

  @override
  String toString() {
    return 'LeaveFormTypes{leaveFormTypes: $leaveFormTypes}';
  }
}

class LeaveFormTypesByEmployeeType {
  final Map<String, dynamic> fullTimeEmployeeTypes;
  final Map<String, dynamic> partTimeEmployeeTypes;
  final Map<String, dynamic> casualEmployeeTypes;

  LeaveFormTypesByEmployeeType({
    this.fullTimeEmployeeTypes,
    this.partTimeEmployeeTypes,
    this.casualEmployeeTypes
  });

  factory LeaveFormTypesByEmployeeType.fromJson(Map<String, dynamic> parsedJson) {
    return LeaveFormTypesByEmployeeType(
      fullTimeEmployeeTypes: parsedJson['Full-Time'],
      partTimeEmployeeTypes: parsedJson['Part-Time'],
      casualEmployeeTypes: parsedJson['Casual'],
    );
  }

  List<String> get getFullTimeEmployeeTypes => fullTimeEmployeeTypes.keys as List;
  List<String> get getPartTimeEmployeeTypes => partTimeEmployeeTypes.keys as List;
  List<String> get getCasualEmployeeTypes => casualEmployeeTypes.keys as List;

  Map<String, dynamic> get getFullTimeEmployeeSubTypes => fullTimeEmployeeTypes;
  Map<String, dynamic> get getPartTimeEmployeeSubTypes => partTimeEmployeeTypes;
  Map<String, dynamic> get getCasualEmployeeSubTypes => casualEmployeeTypes;

  @override
  String toString() {
    return 'LeaveFormTypesByEmployeeType{fullTimeEmployee: $fullTimeEmployeeTypes, partTimeEmployee: $partTimeEmployeeTypes, casualEmployee: $casualEmployeeTypes}';
  }


}