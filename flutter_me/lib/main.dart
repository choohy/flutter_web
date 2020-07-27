import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_me/features/leave/presentation/bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LeaveType',
      theme: ThemeData(
        primaryColor: Colors.blue.shade800,
        accentColor: Colors.blue.shade600,
      ),
      home: ShowLeaveType(),
    );
  }
}

class ShowLeaveType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show leave type"),
      ),
      body: BlocBuilder<LeaveTypeBloc,LeaveTypeState>(
        builder: (_,leaveTypeState) {
            return Text('$leaveTypeState');
          }
      ),
    );
  }
}
