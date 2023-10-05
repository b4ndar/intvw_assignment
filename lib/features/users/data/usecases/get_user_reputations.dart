import '../../../../core/core.dart';
import '../../domain/users_domain.dart';
import '../users_data.dart';

class GetReputationsUseCase implements UseCase<List<ReputationHistoryEntity>,int> {
  final UsersRepository usersRepository;

  GetReputationsUseCase(this.usersRepository);

  @override
  Future<List<ReputationHistory>> call({int? params,int? userId})  {
    return usersRepository.getUserDetails(userId,page: params!);
  }
}