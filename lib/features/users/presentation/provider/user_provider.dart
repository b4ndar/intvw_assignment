import 'package:flutter/material.dart';
import '../../data/users_data.dart';
import '../../domain/users_domain.dart';


class UserProvider extends ChangeNotifier {
  final GetUsersUseCase? getUsersUseCase;
  final GetReputationsUseCase? getReputationsUseCase;
  List<UserEntity> users = [];
  List<ReputationHistoryEntity> reputations = [];

  UserProvider(this.getUsersUseCase, this.getReputationsUseCase);

  Future<List<UserEntity>> getUsers(int page) async{
    final result = await getUsersUseCase!.call(params: page);
    users = result;
    return users;
  }

  Future<List<ReputationHistoryEntity>> getReputations(int userId ,{int? page}) async{
    final result = await getReputationsUseCase!.call(params: page,userId: userId);
    reputations = result;
    return reputations;
  }

}