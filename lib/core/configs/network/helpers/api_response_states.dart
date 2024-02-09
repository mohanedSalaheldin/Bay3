// ignore_for_file: constant_identifier_names

abstract class Failure {}

class OfflineFailure extends Failure {}

class ServerFailure extends Failure {}

const String OFFLINE_ERROR_MESSAGE = 'No Internst Conection';
const String SERVER_ERROR_MESSAGE = 'Sever Error';
const String LOGIN_SUCCESSED = 'Login Successed';
const String REGISTER_SUCCESSED = 'Register Successed';
