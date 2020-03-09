import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import '../../../../core/error/exception.dart';
import '../models/leave_type_model.dart';

abstract class LeaveTypeRemoteDataSource {
  //Calls the XX end point
  //Throws a [ServerException] for all error codes.
  Future<LeaveTypeModel> getLeaveDescription(String leaveTypePin);
  //Calls the XX end point
  //Throws a [ServerException] for all error codes.
  Future<LeaveTypeModel> getLeaveTypes();
}

class LeaveTypeRemoteDataSourceImpl implements LeaveTypeRemoteDataSource {
  final http.Client client;
  final String url = "http://numbersapi.com";

  LeaveTypeRemoteDataSourceImpl({
    @required this.client
});

  @override
  Future<LeaveTypeModel> getLeaveDescription(String leaveTypePin) async {
    return _getLeaveTypeFromUrl(url+'/'+leaveTypePin);
  }

  @override
  Future<LeaveTypeModel> getLeaveTypes() {
    // TODO: implement getLeaveTypes
    throw UnimplementedError();
  }

  Future<LeaveTypeModel> _getLeaveTypeFromUrl(String url) async {
    final response = await client.get(url,headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200)
      return LeaveTypeModel.fromJson(json.decode(response.body));
    else
      throw ServerException();
  }
}