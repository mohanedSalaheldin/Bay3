import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:e_commerce/features/addresses/model/address_model.dart';
import 'package:e_commerce/features/addresses/repository/addresses_services.dart';
import 'package:flutter/material.dart';

enum AddressesStates {
  notRequested,
  loading,
  serverError,
  connectionError,
  success,
}

class AddressesViewModel with ChangeNotifier {
  final AddressesServices _addressesServices = AddressesServicesImpl();

  AddressesStates _addressesState = AddressesStates.notRequested;

  void setAddressesState(AddressesStates newStete) {
    _addressesState = newStete;
    notifyListeners();
  }

  AddressesStates get addressesStates => _addressesState;
  List<AddressModel> _addresses = [];

  List<AddressModel> get addresses => _addresses;

  void getAddresses() async {
    setAddressesState(AddressesStates.loading);
    _getAddresses();
  }

  _getAddresses() async {
    Either<Failure, List<AddressModel>> respose =
        await _addressesServices.getAddresses(token: USER_TOKEN_VALUE);
    respose.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setAddressesState(AddressesStates.connectionError);
        } else {
          setAddressesState(AddressesStates.serverError);
        }
      },
      (addreses) {
        
        _addresses = addreses;
        setAddressesState(AddressesStates.success);
      },
    );
  }

  void deleteAddress({required int index}) async {
    String token = USER_TOKEN_VALUE;
    setAddressesState(AddressesStates.loading);
    Either<Failure, Unit> respose = await _addressesServices.removeAddress(
        token: token, addressID: _addresses[index].id.toString());
    respose.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setAddressesState(AddressesStates.connectionError);
        } else {
          setAddressesState(AddressesStates.serverError);
        }
      },
      (unit) {
        _addresses.removeAt(index);
        notifyListeners();
        _getAddresses();
      },
    );
  }

  void addAddress({required AddressModel model}) async {
    String token = USER_TOKEN_VALUE;
    setAddressesState(AddressesStates.loading);
    Either<Failure, Unit> respose =
        await _addressesServices.addAddress(token: token, model: model);
    respose.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setAddressesState(AddressesStates.connectionError);
        } else {
          setAddressesState(AddressesStates.serverError);
        }
      },
      (unit) {
        _addresses.add(model);
        notifyListeners();
        _getAddresses();
      },
    );
  }
}
