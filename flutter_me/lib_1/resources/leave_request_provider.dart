import 'dart:async' show Future;

import 'package:flutter/services.dart' show rootBundle;
import '../models/leave_request_model.dart';

class LeaveRequestApiProvider {
  Future<String> _loadLeaveRequest() async {
    print("load leaveRequest");
    return await rootBundle.loadString('lib/resources/json/leave_request.json');
  }

  Future<LeaveRequestModel> fetchLeaveRequest() async {
//    String jsonString = await _loadLeaveRequest();
////    print("jsonString: "+jsonString);
//    final jsonResponse = json.decode(jsonString);
////    print('jsonResponse: $jsonResponse');
//    LeaveRequestModel leaveRequestModel =
//        new LeaveRequestModel.fromJson(jsonResponse);
//    print('leaveRequestModel: $leaveRequestModel');

    LeaveRequestModel leaveRequestModel = new LeaveRequestModel();
    return leaveRequestModel;
  }
}
