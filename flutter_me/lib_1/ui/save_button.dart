import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SubmitButton extends StatelessWidget {
  final Form form;

  const SubmitButton({Key key, this.form}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return IconButton(
        icon: const Icon(Icons.save),
        iconSize: 20.0,
        tooltip: 'Save',
        onPressed: () async {
          _navigateAndDisplaySelection(context);
          Toast.show("Saved.", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
        });
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop.
  _navigateAndDisplaySelection(BuildContext context) async {
    print("Call SubmitButton: " + form.toString());

    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    Navigator.pop(context, form);
  }
}
