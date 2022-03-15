import 'package:dialogs/dialogs/choice_dialog.dart';
import 'package:flutter/cupertino.dart';

final customDialog = CustomDialog();

class CustomDialog {
  showDialog(BuildContext context, String title, String msg) {
    ChoiceDialog(
      title: title,
      message: msg,
    ).show(context);
  }
}
