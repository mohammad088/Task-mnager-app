import '../../../utilities/type_defs.dart';

abstract class AuthRepository {
  AuthResult login(String username , String password);
}