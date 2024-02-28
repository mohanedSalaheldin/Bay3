import 'package:e_commerce/core/utils/shared/constants/assets_pathes.dart';
import 'package:e_commerce/features/search/view/widgets/search_appbar.dart';
import 'package:flutter/material.dart';

class NoSearchScreen extends StatelessWidget {
  const NoSearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: 20.0),
          child: SearchFieldAndBackBotton(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(AssetsPathes.noSearchImage),
                ),
              ),
              SizedBox(height: 20.0),
              Text('Item not found'),
              SizedBox(height: 10.0),
              Text(
                'Try a more genaric search term, or try looking for alternative products',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
