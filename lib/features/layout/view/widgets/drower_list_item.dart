import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:flutter/material.dart';

Padding drowerDivider(context) {
  var height = ScreenSizes.getHeight(context);
  return Padding(
    padding: EdgeInsets.only(
      top: height / 55.0,
      bottom: height / 55.0,
    ),
    child: Container(
      height: .2,
      width: 120.0,
      color: Colors.white,
      margin: const EdgeInsetsDirectional.only(
        start: 35.0,
      ),
    ),
  );
}

Widget drowerItem(
  {
  required  String txt,
 required void Function()? onPressed,
  required IconData icon
  }
  
) {
  return TextButton(
    onPressed: onPressed,
    child: Row(
      children: [
         Icon(icon, color: Colors.white),
        const SizedBox(width: 10.0),
        Text(
          txt,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 17.0,
          ),
        ),
      ],
    ),
  );
}
