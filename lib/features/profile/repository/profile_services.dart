import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/internet_checker.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/components/methods/repository_methods.dart';
import 'package:e_commerce/core/utils/shared/models/user_data_model.dart';
import 'package:e_commerce/features/profile/model/address_model.dart';
import 'package:e_commerce/features/profile/model/order_model.dart';
import 'package:e_commerce/features/profile/repository/profile_api_calls.dart';

abstract class ProfileServices {
  Future<Either<Failure, UserDataModel>> editProfile(
      {required String token, required UserDataModel model});
  Future<Either<Failure, UserDataModel>> getProfile({
    required String token,
  });
  Future<Either<Failure, Unit>> addAddress(
      {required String token, required AddressModel model});
  Future<Either<Failure, Unit>> removeAddress(
      {required String token, required String addressID});
  Future<Either<Failure, List<AddressModel>>> getAddresses(
      {required String token});
  Future<Either<Failure, Unit>> removeOrder(
      {required String token, required String addressID});
  Future<Either<Failure, List<OrderModel>>> getOrders({required String token});
}

class ProfileServicesImpl implements ProfileServices {
  final ProfileApiCalls _profileApiCalls = ProfileApiCallsImpl();
  final NetworkInfo _networkInfo = NetworkInfoImpl();
  // ****************************************(ADDRESSES)*********************************
  @override
  Future<Either<Failure, Unit>> addAddress(
      {required String token, required AddressModel model}) async {
    if (await _networkInfo.isConnected) {
      try {
        await _profileApiCalls.addAddress(model: model, token: token);

        return const Right(unit);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeAddress(
      {required String token, required String addressID}) async {
    if (await _networkInfo.isConnected) {
      try {
        await _profileApiCalls.removeAddress(
            token: token, addressID: addressID);

        return const Right(unit);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<AddressModel>>> getAddresses(
      {required String token}) async {
    if (await _networkInfo.isConnected) {
      try {
        List<dynamic> listOfDynamics =
            await _profileApiCalls.getAddresses(token: token);
        List<Map<String, dynamic>> listOfMaps =
            convertFromListOfDynamicToListOfMaps(listOfDynamics);
        List<AddressModel> addresses = [];
        for (var element in listOfMaps) {
          addresses.add(AddressModel.fromJson(element));
        }
        return Right(addresses);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

// ****************************************(ORDERS)*********************************

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders({required String token}) {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> removeOrder(
      {required String token, required String addressID}) {
    // TODO: implement removeOrder
    throw UnimplementedError();
  }

// ****************************************(PROFILE)*********************************
  @override
  Future<Either<Failure, UserDataModel>> editProfile(
      {required String token, required UserDataModel model}) async {
    if (await _networkInfo.isConnected) {
      try {
        Map<String, dynamic> response =
            await _profileApiCalls.editProfile(token: token, model: model);
        UserDataModel user = UserDataModel.fromJson(response);
        print(user.name);
        return Right(user);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserDataModel>> getProfile(
      {required String token}) async {
    if (await _networkInfo.isConnected) {
      try {
        Map<String, dynamic> response = await _profileApiCalls.getProfile(
          token: token,
        ) as Map<String, dynamic>;
        UserDataModel user = UserDataModel.fromJson(response);
        print(user.name);
        return Right(user);
      } catch (e) {
        print(e.toString());
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
