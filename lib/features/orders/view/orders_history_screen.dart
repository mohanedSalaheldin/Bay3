import 'dart:ffi';

import 'package:date_format/date_format.dart';
import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/features/orders/model/order_model.dart';
import 'package:e_commerce/features/orders/view/widgets/order_item.dart';
import 'package:e_commerce/features/orders/view_model/orders_view_model.dart';
import 'package:e_commerce/features/profile/view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrdersViewModel>(context);

    if (provider.ordersStates == OrdersStates.loading) {
      return const LoadingScreen();
    } else if (provider.ordersStates == OrdersStates.serverError) {
      return const ServerErrorScreen();
    } else if (provider.ordersStates == OrdersStates.connectionError) {
      return const OfflineErrorScreen();
    }
    List<Widget> listOfOrdersWidget = [];
    for (var i = 0; i < provider.orders.length; i++) {
      listOfOrdersWidget.add(
        OrderItemWidget(
          index: i.toString(),
          model: provider.orders[i],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders history'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [const SizedBox(height: 15), ...listOfOrdersWidget],
            ),
          ),
        ),
      ),
    );
  }
}
