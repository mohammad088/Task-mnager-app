import 'package:dartz/dartz.dart';
import 'package:task_manager_app/auth/domain/entities/User.dart';
import 'package:task_manager_app/core/failure/failure.dart';

typedef  AuthResult  = Future<Either< Failure, User>>;