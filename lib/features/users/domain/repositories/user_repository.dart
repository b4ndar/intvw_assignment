import '../../data/users_data.dart';
import '../entites/user.dart';

abstract class UsersRepository {
 Future<List<UserEntity>> getUsers({int page});
 Future<List<ReputationHistory>> getUserDetails(int? userId,{int page=1});
}