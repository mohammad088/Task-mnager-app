import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_manager_app/auth/domain/entities/User.dart';
import 'package:task_manager_app/auth/domain/usecases/login_usecase.dart';
import 'package:task_manager_app/auth/presentation/bloc/login_bloc.dart';
import 'package:task_manager_app/core/failure/failure.dart';

class MockLoginUseCase extends Mock implements LoginUseCase{}

void main() {
  late LoginUseCase useCase;
  late LoginBloc bloc;
  setUp(() {
    useCase = MockLoginUseCase();
    bloc = LoginBloc(useCase);
  });
  tearDown(() => bloc.close());
  group("bloc testing", () {
    test('initial state', () {
      //Act
      final state = bloc.state;
      //assert
      expect(state, isA<LoginInitial>());
    });
    blocTest("should emit login completes when success", build: () {
      when(() => useCase(any() , any())).thenAnswer((_) async=> const Right(User.empty()));
      return LoginBloc(useCase);
    },
      act: (bloc) async=> bloc.add(const OnLoginButtonPressed(username: "username", password: "password")),
      expect: () => [LoginCompletes()],
      verify: (bloc) {
        verify(() => useCase(any(),any())).called(1);
        verifyNoMoreInteractions(useCase);
      },
    );
    blocTest('should emit authentication Error when error occurred', build: () {
      when(() => useCase(any() , any() )).thenAnswer((_) async => const Left(ApiFailure("Error")));
      return LoginBloc(useCase);
    },
      act: (bloc) => bloc.add(const OnLoginButtonPressed(username: "username", password: "password")),
      expect: () => [const AuthenticationError(message: "Error")],
      verify: (bloc) {
        verify(() => useCase(any(),any()),).called(1);
        verifyNoMoreInteractions(useCase);
      },
    );
  });
}