import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_manager_app/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:task_manager_app/auth/domain/entities/User.dart';
import 'package:task_manager_app/auth/domain/usecases/login_usecase.dart';
import 'package:task_manager_app/core/failure/failure.dart';

class MockAuthRepository extends Mock implements AuthRepositoryImpl {}

void main() {
  late AuthRepositoryImpl authRepository;
  late LoginUseCase useCase;
  setUp(() {
    authRepository = MockAuthRepository();
    useCase = LoginUseCase(authRepository);
  });
  test("should return Auth result when called", () async {
    //Arrange
    when(() => authRepository.login(any(), any()))
        .thenAnswer((_) async => const Right(User.empty()));
    //Act
    final result = await useCase('username','password');
    expect(result, const Right<Failure,User>(User.empty()));
    verify(() => authRepository.login("username", "password")).called(1);
    verifyNoMoreInteractions(authRepository);
  });
}
