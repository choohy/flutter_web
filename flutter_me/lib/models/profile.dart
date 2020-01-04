class Profile {
  String id;
  String lanID = "smithp";
  String firstName = "Peter";
  String lastName = "Smith";
  String status;
  String type;
  int record;
  String division;
  String regRegion;
  String lineManagerID;
  String matrixManagerID;
  String personalEmail;
  List<Address> addresses;
  List<Phone> phones;
  List<EmergencyContact> emergencyContact;
  Job job;
}

class Address {
  String type;
  String address1;
  String address2;
  String address3;
  String address4;
  String state;
  String postcode;
  String country;
}

class Phone {
  String type;
  String countryCode;
  String phone;
}

class EmergencyContact {
  String name;
  String phone;
  Address address;
}

class Job {
  String group;
  String jobTitle;
  String jobGroup;
  String costCentre;
  String costCentreDescription;
  int fullTimeEmployeeRatio;
  int actualStandardHours;
  Position position;
}

class Position {
  String id;
  String title;
  String family;
  String grade;
  String function;
  String tempPositionFlag;
}