import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  const Failure(this.message);
}
class ApiFailure extends Failure{
  const ApiFailure( super.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}