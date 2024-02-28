import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/internet_checker.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/components/methods/repository_methods.dart';
import 'package:e_commerce/features/addresses/model/address_model.dart';
import 'package:e_commerce/features/addresses/repository/addresses_api_calls.dart';

abstract class AddressesServices {
  Future<Either<Failure, Unit>> addAddress(
      {required String token, required AddressModel model});
  Future<Either<Failure, Unit>> removeAddress(
      {required String token, required String addressID});
  Future<Either<Failure, List<AddressModel>>> getAddresses(
      {required String token});
}

class AddressesServicesImpl implements AddressesServices {
  final AddressesApiCalls _apiCalls = AddressesApiCallsImpl();
  final NetworkInfo _networkInfo = NetworkInfoImpl();
  @override
  Future<Either<Failure, Unit>> addAddress(
      {required String token, required AddressModel model}) async {
    if (await _networkInfo.isConnected) {
      try {
        await _apiCalls.addAddress(model: model, token: token);

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
        await _apiCalls.removeAddress(token: token, addressID: addressID);
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
            await _apiCalls.getAddresses(token: token);
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
}
