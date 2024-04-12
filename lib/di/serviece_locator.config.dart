// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../auth/data/data_source/auth_api_service.dart' as _i3;
import '../auth/data/data_source/auth_remote_data_source.dart' as _i4;
import '../auth/data/repository_impl/auth_repository_impl.dart' as _i6;
import '../auth/domain/repository/auth_repository.dart' as _i5;
import '../auth/domain/usecases/login_usecase.dart' as _i8;
import '../auth/presentation/bloc/login_bloc.dart' as _i13;
import '../home/data/data_source/todos_api_service.dart' as _i9;
import '../home/data/data_source/todos_data_source.dart' as _i10;
import '../home/data/repository_impl/home_repository_impl.dart' as _i12;
import '../home/domain/repository/home_repository.dart' as _i11;
import '../home/domain/usecases/add_todo_usecase.dart' as _i15;
import '../home/domain/usecases/delete_todo_usecase.dart' as _i16;
import '../home/domain/usecases/get_todos_use_case.dart' as _i17;
import '../home/domain/usecases/home_usecase.dart' as _i18;
import '../home/domain/usecases/update_todo_usecase.dart' as _i14;
import '../home/presentaion/bloc/home_bloc.dart' as _i19;
import 'auth_api_service_module.dart' as _i20;
import 'home_api_service_module.dart' as _i21;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final authApiServiceModule = _$AuthApiServiceModule();
    final todosApiServiceModule = _$TodosApiServiceModule();
    await gh.factoryAsync<_i3.AuthApiService>(
      () => authApiServiceModule.authApiService,
      preResolve: true,
    );
    gh.lazySingleton<_i4.AuthRemoteDataSource>(
        () => _i4.AuthRemoteDataSourceImpl(gh<_i3.AuthApiService>()));
    gh.lazySingleton<_i5.AuthRepository>(
        () => _i6.AuthRepositoryImpl(gh<_i4.AuthRemoteDataSource>()));
    gh.singleton<_i7.Dio>(() => authApiServiceModule.dio);
    gh.lazySingleton<_i8.LoginUseCase>(
        () => _i8.LoginUseCase(gh<_i5.AuthRepository>()));
    gh.singleton<_i9.TodosAPiService>(
        () => todosApiServiceModule.todosAPiService(gh<_i7.Dio>()));
    gh.lazySingleton<_i10.TodosDataSource>(
        () => _i10.TodosDataSourceImpl(gh<_i9.TodosAPiService>()));
    gh.lazySingleton<_i11.HomeRepository>(
        () => _i12.HomeRepositoryImpl(gh<_i10.TodosDataSource>()));
    gh.lazySingleton<_i13.LoginBloc>(
        () => _i13.LoginBloc(gh<_i8.LoginUseCase>()));
    gh.lazySingleton<_i14.UpdateTodoUseCase>(
        () => _i14.UpdateTodoUseCase(gh<_i11.HomeRepository>()));
    gh.lazySingleton<_i15.AddTodoUseCase>(
        () => _i15.AddTodoUseCase(gh<_i11.HomeRepository>()));
    gh.lazySingleton<_i16.DeleteTodoUseCase>(
        () => _i16.DeleteTodoUseCase(gh<_i11.HomeRepository>()));
    gh.lazySingleton<_i17.GetTodosUseCase>(
        () => _i17.GetTodosUseCase(gh<_i11.HomeRepository>()));
    gh.lazySingleton<_i18.HomeUseCase>(() => _i18.HomeUseCase(
          addTodo: gh<_i15.AddTodoUseCase>(),
          deleteTodo: gh<_i16.DeleteTodoUseCase>(),
          getTodos: gh<_i17.GetTodosUseCase>(),
          updateTodo: gh<_i14.UpdateTodoUseCase>(),
        ));
    gh.lazySingleton<_i19.HomeBloc>(
        () => _i19.HomeBloc(gh<_i18.HomeUseCase>()));
    return this;
  }
}

class _$AuthApiServiceModule extends _i20.AuthApiServiceModule {}

class _$TodosApiServiceModule extends _i21.TodosApiServiceModule {}
