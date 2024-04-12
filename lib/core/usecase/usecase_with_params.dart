abstract class UseCaseWithParams<T , Params>{
  const UseCaseWithParams();
  T call(Params params , Params params2);
}

abstract class UseCaseWithParam<T , Param>{
  const UseCaseWithParam();
  T call(Param params);
}

abstract class UseCaseWith2Params<T , Param1 , Param2>{
  const UseCaseWith2Params();
  T call(Param1 params , Param2 params2);
}