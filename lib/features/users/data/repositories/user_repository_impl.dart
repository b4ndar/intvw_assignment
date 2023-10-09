import '../../../../core/core.dart';
import '../../domain/users_domain.dart';
import '../users_data.dart';

class UserRepositoryImpl implements UsersRepository {

  final apiHelper = ApiHelper();
  @override
  Future<List<ReputationHistory>> getUserDetails(int? userId,{int page=1}) async {
    final response = await apiHelper.get('users/$userId/reputation-history',queryParams: {'page': '$page', Constants.pageSize: '10', 'site': Constants.site});
    final List<ReputationHistory> reputations = (response['items'] as List)
    .map((item) => ReputationHistory.fromJson(item as Map<String, dynamic>))
    .toList();
    return reputations;
  }

  @override
  Future<List<UserEntity>> getUsers({int page=1}) async {
    final response = await apiHelper.get('users', queryParams: {'page': '$page', 'pageSize': Constants.pageSize, 'site': Constants.site});
    final List<User> users = (response['items'] as List)
        .map((item) => User.fromJson(item as Map<String, dynamic>)) // Ensure 'item' is cast to Map<String, dynamic>
        .toList();
    return users;
  }

}