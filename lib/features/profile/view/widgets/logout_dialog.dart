import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/default_text_buttin.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

showLogoutDialog(BuildContext context) {
  Widget cancelButton = DefaultTextButton(
    txt: 'Cancle',
    onpressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = DefaultTextButton(
    textColor: Colors.red,
    txt: 'Logout',
    onpressed: () {
      var provider = Provider.of<ProfileViewModel>(context, listen: false);
      provider.logout();
      Navigator.pushReplacementNamed(context, RoutesName.login);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text(
      "Logout",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
    content: const Text(
      "Are you sure you want to logout?",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
