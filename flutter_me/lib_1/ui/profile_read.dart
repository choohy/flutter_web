import 'package:flutter/material.dart';
import '../Utility/read_field.dart';
import '../models/profile_model.dart';
import '../navigation/profile_edit.dart';
import '../ui/edit_button.dart';

class ProfileWidget extends StatefulWidget {
  final Profile profile;

  const ProfileWidget({Key key, this.profile}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  Profile _profile;
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<FormMeState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _profile = this.widget.profile;
    print("profile Widget: " + _profile.lanID);

//    return FutureBuilder(
//        future: buildFutures(),
//        builder: (BuildContext context, AsyncSnapshot snapshot) {
//          switch (snapshot.connectionState) {
//            default:
//              if (snapshot.hasError) {
//                return Text(snapshot.error.toString());
//              } else {
//                if (snapshot.data != null)
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 5.0,
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 15.0),
          ),
          actions: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return EditButton(editWidget: ProfileEdit());
              },
            )
          ],
        ),
        floatingActionButton: EditButton(editWidget: ProfileEdit(),),

        body: Container(
            color: Colors.white,
            margin: const EdgeInsets.all(15.0),
            constraints: BoxConstraints.expand(),
            child: Form(
                key: _formKey,
                autovalidate: false,
                child: SingleChildScrollView(
                  child: Card(
                      elevation: 5,
                      child: Container(
                          margin: const EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              ReadField("lanID", _profile.lanID),
                              ReadField("First Name", _profile.firstName),
                              ReadField("Last Name", _profile.lastName),
                            ],
                          ))),
                ))));
//                else
//                  return LinearProgressIndicator();
//              }
//          }
//        });

  }

  Future<bool> buildFutures() async {
    return true;
  }
}
