import 'package:e_commerce/core/configs/routes/routes_name.dart';
import 'package:e_commerce/core/utils/shared/components/screens/no_history_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/features/orders/view/widgets/order_item.dart';
import 'package:e_commerce/features/orders/view_model/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders history'),
      ),
      body: buildOrdersHistoryBody(context),
    );
  }

  Widget buildOrdersHistoryBody(BuildContext context) {
    var provider = Provider.of<OrdersViewModel>(context);
    if (provider.ordersStates == OrdersStates.loading) {
      return const LoadingScreen();
    } else if (provider.ordersStates == OrdersStates.serverError) {
      return const ServerErrorScreen();
    } else if (provider.ordersStates == OrdersStates.connectionError) {
      return const OfflineErrorScreen(
        currentScreenPath: RoutesName.orders,
      );
    }
    if (provider.orders.isEmpty) {
      return const NoHistoryScreen();
    }
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => OrderItemWidget(
                  index: index.toString(),
                  model: provider.orders[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                itemCount: provider.orders.length,
              ),
            ),
          ],
        ));
  }
}
