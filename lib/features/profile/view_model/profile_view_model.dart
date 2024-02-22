import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/models/user_data_model.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:e_commerce/features/profile/model/address_model.dart';
import 'package:e_commerce/features/profile/repository/profile_services.dart';
import 'package:flutter/material.dart';

enum ProfileStates {
  notRequested,
  loading,
  serverError,
  connectionError,
  success,
}

class ProfileViewModel with ChangeNotifier {
  final ProfileServices _profileServices = ProfileServicesImpl();

  ProfileStates _profileState = ProfileStates.notRequested;

  void setProfileState(ProfileStates newStete) {
    _profileState = newStete;
    notifyListeners();
  }

  ProfileStates get profileStates => _profileState;

  UserDataModel _userData = UserDataModel(
      id: 0,
      name: '',
      email: '',
      phone: '',
      image: '',
      points: 0,
      credit: 0,
      token: '');
  UserDataModel get userdata => _userData;

  void getProfileData() async {
    setProfileState(ProfileStates.loading);
    Either<Failure, UserDataModel> response =
        await _profileServices.getProfile(token: USER_TOKEN_VALUE);
    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setProfileState(ProfileStates.connectionError);
        } else {
          setProfileState(ProfileStates.serverError);
        }
      },
      (user) {
        print('USER NAME IS:  ${user.name}');
        _userData = user;
        setProfileState(ProfileStates.success);
      },
    );
  }

  void editProfile({required UserDataModel model}) async {
    setProfileState(ProfileStates.loading);
    Either<Failure, UserDataModel> response = await _profileServices
        .editProfile(token: USER_TOKEN_VALUE, model: model);

    response.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setProfileState(ProfileStates.connectionError);
        } else {
          setProfileState(ProfileStates.serverError);
        }
      },
      (user) {
        print('USER NAME IS:  ${user.name}');
        _userData = user;
        setProfileState(ProfileStates.success);
      },
    );
  }

  List<AddressModel> _addresses = [];
  List<AddressModel> get addresses => _addresses;

  void getAddresses() async {
    setProfileState(ProfileStates.loading);
    _getAddresses();
  }

  _getAddresses() async {
    Either<Failure, List<AddressModel>> respose =
        await _profileServices.getAddresses(token: USER_TOKEN_VALUE);
    respose.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setProfileState(ProfileStates.connectionError);
        } else {
          setProfileState(ProfileStates.serverError);
        }
      },
      (addreses) {
        for (var element in addreses) {
          print(element.name);
        }
        _addresses = addreses;
        setProfileState(ProfileStates.success);
      },
    );
  }

  void deleteAddress({required int index}) async {
    String token = USER_TOKEN_VALUE;
    setProfileState(ProfileStates.loading);
    Either<Failure, Unit> respose = await _profileServices.removeAddress(
        token: token, addressID: _addresses[index].id.toString());
    respose.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setProfileState(ProfileStates.connectionError);
        } else {
          setProfileState(ProfileStates.serverError);
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
    setProfileState(ProfileStates.loading);
    Either<Failure, Unit> respose =
        await _profileServices.addAddress(token: token, model: model);
    respose.fold(
      (failure) {
        if (failure is OfflineFailure) {
          setProfileState(ProfileStates.connectionError);
        } else {
          setProfileState(ProfileStates.serverError);
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
