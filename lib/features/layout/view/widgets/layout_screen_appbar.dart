import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

PreferredSize buildLayoutAppBar(
    BuildContext context, ZoomDrawerController controller) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(120),
    child: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 5.0, right: 5.0),
        child: Row(
          children: [
            DrawerButton(
              onPressed: () {
                controller.toggle?.call();
              },
            ),
            
            const Spacer(),
            SizedBox(
              width: ScreenSizes.getWidth(context) -
                  (ScreenSizes.getWidth(context) / 5.5),
              child: TextFormField(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.search);
                },
                readOnly: true,
                keyboardType: TextInputType.none,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20.0),
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
          ],
        )),
  );
}
