import 'package:e_commerce/core/configs/styles/app_colors.dart';
import 'package:e_commerce/features/orders/model/order_model.dart';
import 'package:e_commerce/features/orders/view_model/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderItemWidget extends StatefulWidget {
  const OrderItemWidget({super.key, required this.model, required this.index});
  final OrderModel model;
  final String index;

  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrdersViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Total: ',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        TextSpan(
                          text: '\$${widget.model.total}',
                          style: const TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
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
                          ),
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
