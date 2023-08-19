// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw_barbershop/src/core/exceptions/service_exception.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/fp/nil.dart';
import 'package:dw_barbershop/src/repositories/user/user_repository.dart';
import 'package:dw_barbershop/src/services/user_register/user_register_service.dart';
import 'package:dw_barbershop/src/services/users_login/user_login_service.dart';

class UserRegisterServiceImpl implements UserRegisterService {
  final UserRepository userRepository;
  final UserLoginservice userLoginservice;

  UserRegisterServiceImpl({
    required this.userRepository,
    required this.userLoginservice,
  });

  @override
  Future<Either<ServiceException, Nil>> execute(
      ({String email, String name, String password}) userData) async {
    final registerResult = await userRepository.registerAdmin(userData);

    switch (registerResult) {
      case Success():
        return userLoginservice.execute(userData.email, userData.password);
      case Failure(:final exception):
        return Failure(ServiceException(message: exception.message));
    }
  }
}
