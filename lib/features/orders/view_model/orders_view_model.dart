import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:e_commerce/features/orders/model/order_model.dart';
import 'package:e_commerce/features/orders/repository/orders_services.dart';
import 'package:flutter/material.dart';

enum OrdersStates {
  notRequested,
  loading,
  serverError,
  connectionError,
  success,
}

class OrdersViewModel with ChangeNotifier {
  final OrdersServices _ordersServices = OrdersServicesImpl();

  OrdersStates _ordersState = OrdersStates.notRequested;

  void setOrdersState(OrdersStates newStete) {
    _ordersState = newStete;
    notifyListeners();
  }

  OrdersStates get ordersStates => _ordersState;

  List<OrderModel> _orders = [];
  List<OrderModel> get orders => _orders;

  void getOrders() async {
    setOrdersState(OrdersStates.loading);
    _getOrders();
  }

  void _getOrders() async {
    Either<Failure, List<OrderModel>> response =
        await _ordersServices.getOrders(token: USER_TOKEN_VALUE);
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setOrdersState(OrdersStates.connectionError);
        } else {
          setOrdersState(OrdersStates.serverError);
        }
      },
      (orders) {
       
        _orders = orders;
        setOrdersState(OrdersStates.success);
      },
    );
  }

  void cancleOrder({required int index}) async {
    OrderModel cancledOrder = _orders[index];
   
    notifyListeners();
    Either<Failure, Unit> response = await _ordersServices.removeOrder(
        token: USER_TOKEN_VALUE, orderID: cancledOrder.id.toString());
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setOrdersState(OrdersStates.connectionError);
        } else {
          setOrdersState(OrdersStates.serverError);
        }
      },
      (_) {
        _getOrders();
      },
    );
  }
}
