import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/network/internet_checker.dart';
import 'package:e_commerce/features/auth/model/register_response.dart';

import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/features/auth/model/login_response.dart';
import 'package:e_commerce/features/auth/repository/auth_api_calls.dart';

abstract class AuthServices {
  Future<Either<Failure, LoginResponseModel>> login(
      {required String userEmail, required String password});
  Future<Either<Failure, RegisterResponseModel>> register(
      {required String userEmail,
      required String userName,
      required String password,
      required String phone,
      required String image});
}

class AuthServicesImpl implements AuthServices {
  final AuthApiCalls _authApiCalls = AuthApiCallsImpl();
  final NetworkInfo networkInfo = NetworkInfoImpl();

  @override
  Future<Either<Failure, LoginResponseModel>> login(
      {required String userEmail, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        LoginResponseModel loginResponseModel =
            await _authApiCalls.login(userEmail: userEmail, password: password);
        return Right(loginResponseModel);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, RegisterResponseModel>> register({
    required String userEmail,
    required String userName,
    required String password,
    required String phone,
    required String image,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        RegisterResponseModel registerResponseModel =
            await _authApiCalls.register(
                userEmail: userEmail,
                userName: userName,
                password: password,
                phone: phone,
                image: image);
        return Right(registerResponseModel);
      } catch (e) {
        // print(e.toString());
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
