abstract class UseCase<Type,Params> {
  Future<Type?> call({Params params});
}

abstract class UseCaseWithoutParams<Type> {
  Future<Type?> call();
}


