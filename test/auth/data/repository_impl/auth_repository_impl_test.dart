import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_manager_app/auth/data/data_source/auth_remote_data_source.dart';
import 'package:task_manager_app/auth/data/models/user_model.dart';
import 'package:task_manager_app/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:task_manager_app/auth/domain/entities/User.dart';
import 'package:task_manager_app/core/errors/Exceptions.dart';
import 'package:task_manager_app/core/failure/failure.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late AuthRepositoryImpl authRepository;
  late AuthRemoteDataSource dataSource;
  setUp(() {
    dataSource = MockAuthRemoteDataSource();
    authRepository = AuthRepositoryImpl(dataSource);
  });
  group("Login to Task Manager", () {
    test("should be return the user and login in to app", () async {
      //Arrange
      when(() => dataSource.login(any(), any())).thenAnswer((_) async =>
          UserModel(
              id: 1,
              username: "username",
              email: "email",
              firstName: "firstName",
              lastName: "lastName",
              gender: "gender",
              image: "image",
              token: "token"));
      //Act
      final result = await authRepository.login("username", "password");
      //Assert
      expect(
          result,
          Right<Failure, User>(UserModel(
                  id: 1,
                  username: "username",
                  email: "email",
                  firstName: "firstName",
                  lastName: "lastName",
                  gender: "gender",
                  image: "image",
                  token: "token")
              .toUser()));
      verify(() => dataSource.login("username", "password")).called(1);
      verifyNoMoreInteractions(dataSource);
    });
    test("should return failure when it fails", () async {
      //Arrange
      when(() => dataSource.login(any(), any()))
          .thenThrow(ApiException(message: 'message', statusCode: 500));
      //Act
      final result = await authRepository.login("username", "password");
      //Assert
      expect(result, const Left<Failure,User>(ApiFailure("message")));
      verify(() => dataSource.login('username', 'password'));
      verifyNoMoreInteractions(dataSource);
    });
  });
}
