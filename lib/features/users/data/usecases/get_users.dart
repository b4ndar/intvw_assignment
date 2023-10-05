
import '../../../../core/core.dart';
import '../../domain/users_domain.dart';

class GetUsersUseCase implements UseCase<List<UserEntity>,int> {
  final UsersRepository usersRepository;

  GetUsersUseCase(this.usersRepository);

  @override
  Future<List<UserEntity>> call({int? params})  {
    return usersRepository.getUsers(page: params!);
  }
}