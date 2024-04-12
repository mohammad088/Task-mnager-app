import 'package:injectable/injectable.dart';
import 'package:task_manager_app/auth/domain/repository/auth_repository.dart';
import 'package:task_manager_app/core/usecase/usecase_with_params.dart';
import 'package:task_manager_app/utilities/type_defs.dart';

@lazySingleton
class LoginUseCase extends UseCaseWithParams<AuthResult, String> {
  const LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  AuthResult call(String username, String password) {
    return _authRepository.login(username, password);
  }
}
