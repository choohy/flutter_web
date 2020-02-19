//import 'package:flutter/material.dart';
//import '../blocs/leave_type.dart';
//import '../models/leave_type.dart';
//import '../models/leave_list_model.dart';
//
//
//class LeaveType extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    bloc.fetchAllLeaveTypes();
//    return Expanded(
//        child: Column(
//      children: <Widget>[
//        StreamBuilder(
//          stream: bloc.allLeaveTypes,
//          builder: (context, AsyncSnapshot<LeaveListModel> snapshot) {
//            if (snapshot.hasData) {
//              print('snapshot found');
//              print('snapshot: $snapshot');
//              return buildList(snapshot);
//            } else if (snapshot.hasError) {
//              print('no snapshot found');
//              return Text(snapshot.error.toString());
//            }
//            print('loading...');
//            return Center(child: CircularProgressIndicator());
//          },
//        ),
//      ],
//    ));
//  }
//
//  Widget buildList(AsyncSnapshot<LeaveListModel> snapshot) {
//    print('buildList snapshot: '+ snapshot.toString());
//    return
//      //ListView.builder(
//      GridView.builder(
//          itemCount: snapshot.data.leaveTypeTitles.length,
//        shrinkWrap: true,
//        gridDelegate:
//            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
//        itemBuilder: (BuildContext context, int index) {
//          print('index: $index');
//          return GridTile(
//            child:
//                Container(
////                  height: 10,
//                    child: Text(snapshot.data.leaveTypeTitles[index]),
//                ),
////            InkResponse(
////              enableFeedback: true,
////              child: Image.network(
////                'https://image.tmdb.org/t/p/w185${snapshot.data
////                    .leaveType[index]}',
////                fit: BoxFit.cover,
////              ),
////              onTap: () => print(index)),
//
//          );
//          //Text(index.toString()//'{snapshot.data.results[index].leaveType.toString()}'
////          return Image.network(
////            'https://image.tmdb.org/t/p/w185${snapshot.data
////                .results[index].leaveType}',
////            fit: BoxFit.cover,
//
//    });
//  }
//}
