import 'dart:ffi';

import 'package:date_format/date_format.dart';
import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/core/configs/styles/frequently_used_texts.dart';
import 'package:e_commerce/core/utils/shared/components/screens/offline_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/screens/server_error_screen.dart';
import 'package:e_commerce/core/utils/shared/components/widgets/loading_screen.dart';
import 'package:e_commerce/features/orders/model/order_model.dart';
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
        ExpansionTileExample(
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
        child: Column(
          children: [const SizedBox(height: 15), ...listOfOrdersWidget],
        ),
      ),
    );
  }
}

class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample(
      {super.key, required this.model, required this.index});
  final OrderModel model;
  final String index;

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  final bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrdersViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExpansionTile(
            childrenPadding: const EdgeInsets.all(20.0),
            title: Text(
              widget.model.status,
              style: const TextStyle(
                color: Colors.red,
              ),
            ),
            subtitle: Text(widget.model.date.toString()),
            children: <Widget>[
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Total: ',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        TextSpan(
                          text: '\$${widget.model.total}',
                          style: const TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  widget.model.status == 'Cancelled'
                      ? TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Cancelled',
                            style: TextStyle(color: Colors.grey),
                          ))
                      : TextButton(
                          onPressed: () {
                            provider.cancleOrder(
                                index: int.parse(widget.index));
                          },
                          child: const Text(
                            'Remove',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
