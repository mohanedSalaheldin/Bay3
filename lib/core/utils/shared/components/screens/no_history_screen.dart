import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:flutter/material.dart';

class NoHistoryScreen extends StatelessWidget {
  const NoHistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(AssetsPathes.noHistoryImage),
                ),
              ),
              SizedBox(height: 20.0),
              Text('No History yet'),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
