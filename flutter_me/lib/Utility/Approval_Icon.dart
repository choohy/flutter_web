import 'package:flutter/material.dart';

class ApprovalIcon extends StatelessWidget {
  final String status;

  ApprovalIcon({this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case "Approved":
        return Icon(Icons.check,
          color: Colors.green,);
      case "Rejected":
        return Icon(Icons.thumb_down);
      default:
        return Icon(Icons.edit);
    }
  }
}