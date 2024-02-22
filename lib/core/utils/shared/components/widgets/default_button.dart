import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:flutter/material.dart';

// Widget defaultButton({
//     required void Function()? onPressed,
//     required String txt,
//     Color textColor = Colors.white,
//     Color backgoungColor = AppColors.mainColor,
//   }) {
//     return Container(
//       clipBehavior: Clip.antiAlias,
//       height: 60,
//       width: 300,
//       decoration: BoxDecoration(
//         color: backgoungColor,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: MaterialButton(
//         onPressed: onPressed,
//         height: 60,
//         child: Text(
//          txt ,
//           style: TextStyle(
//             height: 0.0,
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: textColor,
//           ),
//         ),
//       ),
//     );
//   }

// class DefaultButton extends StatelessWidget {
//   final void Function() onPressed;
//   final String txt;
//   final Color? textColor;
//   final Color? backgoungColor;

//   const DefaultButton({
//     super.key,
//     required this.onPressed,
//     required this.txt,
//     this.textColor = Colors.white,
//     this.backgoungColor = AppColors.mainColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       clipBehavior: Clip.antiAlias,
//       height: 60,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: backgoungColor,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: MaterialButton(
//         onPressed: onPressed,
//         height: 60,
//         child: Text(
//           txt,
//           style: TextStyle(
//             height: 0.0,
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//             color: textColor,
//           ),
//         ),
//       ),
//     );
//   }
// }

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    super.key,
    required this.txt,
    required this.onPressed,
    this.backgoungColor = AppColors.mainColor,
    this.textColor = Colors.white,
  });

  final Color? textColor;
  final String txt;
  final Color? backgoungColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 70.0,
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: backgoungColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: MaterialButton(
            onPressed: onPressed,
            height: 60,
            child: Text(
              txt,
              style: TextStyle(
                height: 0.0,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        ));
  }
}
