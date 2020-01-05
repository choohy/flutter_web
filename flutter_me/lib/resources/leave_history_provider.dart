import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_me/models/leave_history_model.dart';

class LeaveHistoryApiProvider {
  Future<String> _loadLeaveHistory() async {
    print("load leaveHistory");
    return await rootBundle.loadString('lib/resources/json/leave_history.json');
  }

  Future<LeaveHistoryModel> fetchLeaveHistory() async {
    String jsonString = await _loadLeaveHistory();
//    print("jsonString: "+jsonString);
    final jsonResponse = json.decode(jsonString);
//    print('jsonResponse: $jsonResponse');
    LeaveHistoryModel leaveHistoryModel =
        new LeaveHistoryModel.fromJson(jsonResponse);
    print('leaveHistoryModel: $leaveHistoryModel');

    return leaveHistoryModel;
  }
}
