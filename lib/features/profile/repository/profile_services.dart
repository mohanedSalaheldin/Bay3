import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/utils/helpers/cache_helper/cache_helper.dart';
import 'package:e_commerce/core/utils/helpers/network/internet_checker.dart';
import 'package:e_commerce/core/utils/helpers/network/helpers/api_response_states.dart';
import 'package:e_commerce/core/utils/shared/models/user_data_model.dart';
import 'package:e_commerce/features/auth/view_model/login_view_model.dart';
import 'package:e_commerce/features/profile/repository/profile_api_calls.dart';

abstract class ProfileServices {
  Future<Either<Failure, UserDataModel>> editProfile(
      {required String token, required UserDataModel model});
  Future<Either<Failure, UserDataModel>> getProfile({
    required String token,
  });
  Either<Failure, Unit> logout();
}

class ProfileServicesImpl implements ProfileServices {
  final ProfileApiCalls _profileApiCalls = ProfileApiCallsImpl();
  final NetworkInfo _networkInfo = NetworkInfoImpl();
  @override
  Future<Either<Failure, UserDataModel>> editProfile(
      {required String token, required UserDataModel model}) async {
    if (await _networkInfo.isConnected) {
      try {
        Map<String, dynamic> response =
            await _profileApiCalls.editProfile(token: token, model: model);
        UserDataModel user = UserDataModel.fromJson(response);
        // print(user.name);
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
        // print(user.name);
        return Right(user);
      } catch (e) {
        // print(e.toString());
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Either<Failure, Unit> logout() {
    try {
      CacheHelper cacheHelper = CacheHelperImpl();
      cacheHelper.saveData(USER_TOKEN_KEY, '');
      return const Right(unit);
    } catch (e) {
      // print(e.toString());
      return Left(ServerFailure());
    }
  }
}
