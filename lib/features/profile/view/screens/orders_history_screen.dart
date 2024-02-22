import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/screen_sizes/screen_sizes.dart';
import 'package:e_commerce/features/profile/model/address_model.dart';
import 'package:e_commerce/features/profile/model/order_model.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  OrderItem(index: index.toString()),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.index,
    // required this.addressModel,
  });
  final String index;
  // final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProfileViewModel>(context);
    var height = ScreenSizes.getHeight(context);
    return Slidable(
      key: Key(index),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {
            // provider.removeFavoritesItem(productModel, int.parse(index));
          },
        ),
        children: [
          SlidableAction(
            onPressed: (context) {
              // provider.removeFavoritesItem(productModel, int.parse(index));
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        height: height * .15,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150.0,
                    child: ProductNameText(
                      align: TextAlign.start,
                      productName: 'Manchester, Manchester.UK, 43 Oxford road',
                      size: 16,
                    ),
                  ),
                  PriceText(
                    price: '',
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
