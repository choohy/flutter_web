import 'package:flutter/material.dart';
import 'package:flutter_me/models/profile.dart';
import 'package:flutter_me/ui/profile_read.dart';
import 'package:toast/toast.dart';

class ProfileButton extends StatefulWidget {
  final Profile profile;

  const ProfileButton({Key key, this.profile}) : super(key: key);

  @override
  _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  Profile _profile;

  @override
  Widget build(BuildContext context) {
    _profile = widget.profile;

    return new GestureDetector(
      onTap: () {
        _navigateAndDisplaySelection(context);
//        Toast.show("View profile.", context,
//            duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
      },
      child: Text(
        'View profile',
        style: new TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    print("Call profile: " + _profile.lanID);

    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final ProfileWidget result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileWidget(profile: _profile)),
    );

    print("Profile Results: $result");
  }
}
